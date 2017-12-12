import java.rmi.*;
import java.rmi.registry.*;
import java.rmi.server.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.net.*;
import java.util.*;
import java.io.*;
import java.math.BigInteger;
/**
* This class implements the MapInterface class and ReduceInterface class for map reducing
* @author Amy Yang
* @author Tiler Dao
* @author Christian Eirik Blydt-Hansen
*/
public class Mapper extends java.rmi.server.UnicastRemoteObject implements MapInterface, ReduceInterface  {
	private Chord chord;
	Registry registry;
	
	public Mapper(Chord c) throws RemoteException
	{
		chord = c;
		
		System.out.println("mapper make");
		try
        {
            // create the registry and bind the name and object.
            registry = LocateRegistry.createRegistry( 4999 );
            registry.rebind("Mapper", this);
        }
        catch(RemoteException e){
	       throw e;
        }
	}
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
	 * Maps the guid and content to TreeMap
	 * @param key - guid
	 * @param value - page content
	 */
	public void map(long key, String value, CounterInterface counter) throws IOException
	{
		//For each word in value
		System.out.println("mapper map");
		int number = Integer.parseInt(value.split(":")[0]);
		String[]values = value.split(":")[1].split(",");
		for(String val : values)
		{
			chord.emitMap(md5(val), val, counter);
		}
		//System.out.println(chord);
		
		System.out.println("comple");
	}

	public void test() {
		System.out.println("tester");
	}
	
	/**
	 * Removes repeated keys in the map
	 * @param key -  guid
	 * @param value - page content
	 */
	public void reduce(long key, String values[], CounterInterface counter) throws IOException
	{
		String word = values[0].split(":")[0];
		chord.emitReduce(key, word + ":"+ values.length, counter);
	}
}
