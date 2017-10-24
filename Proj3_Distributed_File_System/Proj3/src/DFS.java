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

/**
* @author Amy Yang
* @author Tiler Dao
* @author Christian Eirik Blydt-Hansen
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
        long guid = md5("Metadata");
        ChordMessageInterface peer = chord.locateSuccessor(guid);
        InputStream metadataraw = peer.get(guid);
        JsonReader reader = new JsonReader(new InputStreamReader(metadataraw, "UTF-8"));
        return reader;
    }
    
    //to do
    public void writeMetaData(InputStream stream) throws Exception
    {
       // JsonWriter writer = new JsonWriter(new FileWriter("metadata.json"));
        long guid = md5("Metadata");
        ChordMessageInterface peer = chord.locateSuccessor(guid);
        peer.put(guid, stream);
      //  writer.beginObject();
        //writer.name("Metadata");
       // writer.beginArray();
        //writeFile();
    }
    
    public void writeFile(JsonWriter writer, String filename, long guid, InputStream stream) throws Exception
    {
        final int sizeLimit = 1024;
        writer.name("file").value(filename);
        byte[] buffer = stream.readAllBytes();
        writer.beginArray();

        if (buffer.length>sizeLimit)
        {
            int fullPages = buffer.length/sizeLimit;
            int remainingBytes = buffer.length % sizeLimit;

            for (int page = 1; page<=fullPages; page++) //write full pages
            {
                writePage(writer, guid, sizeLimit, page);    
            }
            writePage(writer, guid, remainingBytes,fullPages+1); //write remaining bytes
        }
        else//1 page
        {
                writePage(writer, guid, buffer.length,1); 
        }
        writer.endArray();
    }
    public void writePage(JsonWriter writer, long guid, int pageSize, int pageNumber) throws Exception
    {
        writer.name("page");
        writer.beginArray();
        writer.name("number").value(pageNumber);
        writer.name("guid").value(guid);
        writer.name("size").value(pageSize);
        writer.endArray();
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
        JsonReader reader = readMetaData();
        reader.beginObject();
        while (reader.hasNext()) 
        {
           String name = reader.nextName();
           if (name.equals("file")) 
           {
             listOfFiles = listOfFiles + "\n" + reader.nextString(); 
           } 
           else 
           {
             reader.skipValue();
           }
         }
        reader.endObject();

        if (listOfFiles=="")
        {
            listOfFiles="There are no files.";
        }
        return listOfFiles;
    }

    
    public void touch(String fileName) throws Exception
    {
         // TODO: Create the file fileName by adding a new entry to the Metadata
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
