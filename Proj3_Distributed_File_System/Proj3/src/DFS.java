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
// import a json package


/* JSON Format

 {
    "metadata" :
    {
        file :
        {
            name  : "File1"
            numberOfPages : "3"
            pageSize : "1024"
            size : "2291"
            page :
            {
                number : "1"
                guid   : "22412"
                size   : "1024"
            }
            page :
            {
                number : "2"
                guid   : "46312"
                size   : "1024"
            }
            page :
            {
                number : "3"
                guid   : "93719"
                size   : "243"
            }
        }
    }
}
 
 
 */


public class DFS
{
    int port;
    Chord  chord;
    
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
    
    
    
    public DFS(int port) throws Exception
    {
        
        this.port = port;
        long guid = md5("" + port);
        chord = new Chord(port, guid);
        Files.createDirectories(Paths.get(guid+"/repository"));
    }
    
    public  void join(String Ip, int port) throws Exception
    {
        chord.joinRing(Ip, port);
        chord.Print();
    }
    
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

    public void mv(String oldName, String newName) throws Exception
    {
        // TODO:  Change the name in Metadata
        // Write Metadata
    }

    
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
                    String thing = jr.nextString();
                    System.out.println(thing);
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
        // will need to add more properties
        fileObj.addProperty("name",fileName);
        fileList.add(fileObj);
        meta.add("metadata",fileList);
        
        String str = meta.toString();
        InputStream is = new ByteArrayInputStream(str.getBytes());
        writeMetaData(is);

        // Write Metadata
        
    }
    public void delete(String fileName) throws Exception
    {
        // TODO: remove all the pages in the entry fileName in the Metadata and then the entry
        // for each page in Metadata.filename
        //     peer = chord.locateSuccessor(page.guid);
        //     peer.delete(page.guid)
        // delete Metadata.filename
        // Write Metadata

        
    }
    
    public Byte[] read(String fileName, int pageNumber) throws Exception
    {
        // TODO: read pageNumber from fileName
        return null;
    }
    
    
    public Byte[] tail(String fileName) throws Exception
    {
        // TODO: return the last page of the fileName
        return null;
    }
    public Byte[] head(String fileName) throws Exception
    {
        // TODO: return the first page of the fileName
        return null;
    }
    public void append(String filename, Byte[] data) throws Exception
    {
        // TODO: append data to fileName. If it is needed, add a new page.
        // Let guid be the last page in Metadata.filename
        //ChordMessageInterface peer = chord.locateSuccessor(guid);
        //peer.put(guid, data);
        // Write Metadata

        
    }
    
}
