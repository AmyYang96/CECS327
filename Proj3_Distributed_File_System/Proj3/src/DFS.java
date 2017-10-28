import java.rmi.*;
import java.net.*;
import java.util.*;
import java.io.*;
import java.nio.file.*;
import java.math.BigInteger;
import java.security.*;
import com.google.gson.*;  // imported a json package
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;

/**
* @author Amy Yang
* @author Tiler Dao
* @author Christian Eirik Blydt-Hansen
* This class represents a distributed file system that uses the chord interface
*/
public class DFS
{
    /**Port that this poor is using*/
    int port;

    /**Chord object*/
    Chord  chord;
    

    /**
    * Hash function to generate unique GUID
    * @param objectName – name of the peer
    * @preturn guid of the peer
    */
    private long md5(String objectName)
    {
        try
        {
            MessageDigest m = MessageDigest.getInstance("MD5");
            m.reset();
            m.update(objectName.getBytes());
            BigInteger bigInt = new BigInteger(1,m.digest());
            return Math.abs(bigInt.longValue());
        }
        catch(NoSuchAlgorithmException e)
        {
                e.printStackTrace();
                
        }
        return 0;
    }
    
    
    /**
    * Constructor for the distributed file system
    * @param port – port number that the peer is using
    */
    public DFS(int port) throws Exception
    {
        
        this.port = port;
        long guid = md5("" + port);
        chord = new Chord(port, guid);
        Files.createDirectories(Paths.get(guid+"/repository"));
    }
    

    /**
    * Joins the peer to the ring
    * @param Ip – ip address
    * @param port – port number
    */
    public  void join(String Ip, int port) throws Exception
    {
        chord.joinRing(Ip, port);
        chord.Print();
    }
    

    /**
    * Reads in the metadata 
    * @return JsonReader for the metadata
    */
    public JsonReader readMetaData() throws Exception
    {
        //JsonParser jsonParser _ null;
        long guid = md5("Metadata");
        ChordMessageInterface peer = chord.locateSuccessor(guid);
        InputStream metadataraw = peer.get(guid);
        // jsonParser = Json.createParser(metadataraw);
        JsonReader reader = new JsonReader(new InputStreamReader(metadataraw, "UTF-8"));
        return reader;
    }

    /**
    * Writes the metadata and puts into the Chord
    * @param stream – InputStream of metadata
    */
    public void writeMetaData(InputStream stream) throws Exception
    {
        //JsonParser jsonParser _ null;
        //JsonWriter writer = new JsonWriter(new FileWriter("metadata"));
        long guid = md5("Metadata");
        ChordMessageInterface peer = chord.locateSuccessor(guid);
        peer.put(guid, stream);
        //writer.beginObject();
        //writer.name("metadata");
        //writer.beginArray();
        //writer.endArray();
        //writer.endObject();
        //writer.close();
    }


    /**
    * Changes a file name in metadata
    * @param oldName – file name to be changed
    * @paran newName – new file name
    */
    public void mv(String oldName, String newName) throws Exception
    {
        // TODO:  Change the name in Metadata
        // Write Metadata
        JsonParser jp = new JsonParser();
        JsonReader jr = readMetaData();
        JsonObject meta = (JsonObject)jp.parse(jr);
        JsonArray fileList = meta.getAsJsonArray("metadata");
        int indexToRemove = -1;

        for (int i=0;i<fileList.size();i++) {
            JsonObject jo = fileList.get(i).getAsJsonObject();
            String name = jo.get("name").getAsString();
            if (name.equals(oldName)) {
                jo.addProperty("name", newName);
                JsonArray pageArray = jo.get("pages").getAsJsonArray();
                
                for (int j=0;j<pageArray.size();j++) {
                    JsonObject page = pageArray.get(j).getAsJsonObject();
                    long guid = md5(newName+pageArray.size());
                    
                    page.addProperty("guid",guid);
 
                    
                }
            }
        }
        String str = meta.toString();
        InputStream is = new ByteArrayInputStream(str.getBytes());
        writeMetaData(is);
    }

    
    /**
    * Lists the file names in metadata
    * @return String of file names
    */
    public String ls() throws Exception
    {
        String listOfFiles = "";
        // TODO: returns all the files in the Metadata
        // JsonParser jp = readMetaData();
        JsonReader jr = readMetaData();
        System.out.println("Start ls");
        jr.beginObject();
        jr.skipValue();
        jr.beginArray();
        while (jr.hasNext()) {
            jr.beginObject();
            while (jr.hasNext()) {
                String name = jr.nextName();
                if (name.equals("name")) {
                    listOfFiles += jr.nextString()+"\n";
                } else {
                    jr.skipValue();
                }
            }
            jr.endObject();
        }
        jr.endArray();
        jr.endObject();
        return listOfFiles;
    }

    /**
    * Creates the file fileName by adding a new entry to the Metadata
    * @param fileName –  new file to be added
    */
    public void touch(String fileName) throws Exception
    {
        
        // TODO: Create the file fileName by adding a new entry to the Metadata
        
        // all this commented out code is how to make a json object

        //JsonObject innerObject = new JsonObject();
        //innerObject.addProperty("name", "john");
        //JsonObject fileObj = new JsonObject();
        //fileObj.addProperty("name",fileName);

        //JsonArray fileArray = new JsonArray();
        //fileArray.add(fileObj);

        //JsonObject jsonObject = new JsonObject();
        //jsonObject.add("metadata",fileArray);

        // this reads existing metadata into a json object

        JsonParser jp = new JsonParser();
        JsonReader jr = readMetaData();
        JsonObject meta = (JsonObject)jp.parse(jr);
        JsonArray fileList = meta.getAsJsonArray("metadata");
        
        JsonObject fileObj = new JsonObject();
        fileObj.addProperty("name",fileName);
        fileObj.addProperty("numberOfPages", 0);
        fileObj.addProperty("pageSize", 1024);
        fileObj.addProperty("size", 0);
        fileObj.add("pages", new JsonArray());

        fileList.add(fileObj);
        
        String str = meta.toString();
        InputStream is = new ByteArrayInputStream(str.getBytes());
        writeMetaData(is);

        // Write Metadata        
    }

    
    /**
    * Removes a file in the metadata as well as in Chord
    * @param fileName – name of file to be removed
    */
    public void delete(String fileName) throws Exception
    {
        // TODO: remove all the pages in the entry fileName in the Metadata and then the entry
        // for each page in Metadata.filename
        //     peer = chord.locateSuccessor(page.guid);
        //     peer.delete(page.guid)
        // delete Metadata.filename
        // Write Metadata

        JsonParser jp = new JsonParser();
        JsonReader jr = readMetaData();
        JsonObject meta = (JsonObject)jp.parse(jr);
        JsonArray fileList = meta.getAsJsonArray("metadata");
        int indexToRemove = -1;

        for (int i=0;i<fileList.size();i++) {
            JsonObject jo = fileList.get(i).getAsJsonObject();
            String name = jo.get("name").getAsString();
            if (name.equals(fileName)) {
                JsonArray pageArray = jo.get("pages").getAsJsonArray();
                
                for (int j=0;j<pageArray.size();j++) {
                    JsonObject page = pageArray.get(j).getAsJsonObject();
                    long pageGuid = page.get("guid").getAsLong();

                    ChordMessageInterface peer = chord.locateSuccessor(pageGuid);
                    peer.delete(pageGuid);
                }
                indexToRemove = i;
            }
        }
        if (indexToRemove > -1) {
            fileList.remove(indexToRemove);
            String str = meta.toString();
            InputStream is = new ByteArrayInputStream(str.getBytes());
            writeMetaData(is);
        }
    }
    

    /**
    * Reads the content from a page in a file 
    * @param fileName – name of file to be read from
    * @param pageNumber – page number in the file
    * @return content in byte array 
    */
    public byte[] read(String fileName, int pageNumber) throws Exception
    {
        // TODO: read pageNumber from fileName
        JsonParser jp = new JsonParser();
        JsonReader jr = readMetaData();
        JsonObject meta = (JsonObject)jp.parse(jr);
        JsonArray fileList = meta.getAsJsonArray("metadata");

        byte[] array = null;

        for (int i=0;i<fileList.size();i++) {
            JsonObject jo = fileList.get(i).getAsJsonObject();
            String name = jo.get("name").getAsString();
            if (name.equals(fileName)) {
                JsonArray pageArray = jo.get("pages").getAsJsonArray();
                int index = (pageNumber != -1) ? pageNumber-1 : pageArray.size()-1;
                JsonObject page = pageArray.get(pageNumber-1).getAsJsonObject();
                int size = page.get("size").getAsInt();
                long pageGuid = page.get("guid").getAsLong();

                ChordMessageInterface peer = chord.locateSuccessor(pageGuid);
                InputStream is = peer.get(pageGuid);
                array = new byte[size];

                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                int nRead = is.read(array, 0, array.length);
                buffer.write(array, 0, nRead);
                buffer.flush();
                is.close();
            }
        }

        return array;
    }
    
    
    public byte[] tail(String fileName) throws Exception
    {
        // TODO: return the last page of the fileName
        return read(fileName,-1);
    }
    public byte[] head(String fileName) throws Exception
    {
        // TODO: return the first page of the fileName
        return read(fileName,1);
    }
    public void append(String filename, byte[] data) throws Exception
    {
        // TODO: append data to fileName. If it is needed, add a new page.
        // Let guid be the last page in Metadata.filename

        JsonParser jp = new JsonParser();
        JsonReader jr = readMetaData();
        JsonObject meta = (JsonObject)jp.parse(jr);
        JsonArray fileList = meta.getAsJsonArray("metadata");

        // loop through list of files
        for (int i=0;i<fileList.size();i++) {
            JsonObject jo = fileList.get(i).getAsJsonObject();
            // get name of file
            String name = jo.get("name").getAsString();
            // if name is the filename we're looking for
            if (name.equals(filename)) {
                // get size of page
                int pageSize = jo.get("pageSize").getAsInt();
                // get page list
                JsonArray pageArray = jo.get("pages").getAsJsonArray();
                int pageNum = pageArray.size();
                // loop through data
                for (int j=0;j<data.length;j++) {
                    if (j % pageSize == 0) {
                        JsonObject page = new JsonObject();
                        long guid = md5(name+pageNum);
                        page.addProperty("number",pageNum);
                        page.addProperty("guid",guid);
                        
                        int beginIndex = j;
                        int endIndex = j+pageSize;
                        if (endIndex > data.length) {
                            endIndex = data.length;
                        }
                        byte[] subdata = Arrays.copyOfRange(data, beginIndex, endIndex);
                        page.addProperty("size",subdata.length);

                        ChordMessageInterface peer = chord.locateSuccessor(guid);
                        
                        InputStream is = new ByteArrayInputStream(subdata);
                        peer.put(guid, is);
                        pageArray.add(page);
                        pageNum += 1;
                    }
                }
            }
        }
        //fileList.get()

        String str = meta.toString();
        InputStream is = new ByteArrayInputStream(str.getBytes());
        writeMetaData(is);
        
        // Write Metadata

        
    }
    
}
