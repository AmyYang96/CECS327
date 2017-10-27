import java.rmi.*;
import java.net.*;
import java.util.*;
import java.io.*;
import java.math.BigInteger;
import java.security.*;
import java.nio.file.*;

/**
* @author Amy Yang
* @author Tiler Dao
* @author Christian Eirik Blydt-Hansen
*/
public class Client {
    DFS dfs;
    public Client(int p) throws Exception {
        dfs = new DFS(p);
        run();
    }

    public void run() throws Exception {
        Scanner in = new Scanner(System.in);

        boolean isRunning = true;
        byte[] result;
        String name;
        String oldName;
        int pageNum;

        while(isRunning==true) {
            System.out.println("\nEnter a command");
            System.out.println("1. join");
            System.out.println("2. ls");
            System.out.println("3. touch");
            System.out.println("4. delete");
            System.out.println("5. read");
            System.out.println("6. tail");
            System.out.println("7. head");
            System.out.println("8. append");
            System.out.println("9. move");
            System.out.println("0. quit");

            String choice = in.nextLine();

            switch(choice) {
                case "1":
                    System.out.println("Plese enter port");
                    String port = in.nextLine();
                    dfs.join("localhost",Integer.parseInt(port));
                    //join
                    break;
                case "2":
                    //ls
                    System.out.println( dfs.ls());
                    break;
                case "3":
                    //touch
                    System.out.println("Plese enter file name");
                    name = in.nextLine();
                    dfs.touch(name);
                    break;
                case "4":
                    //delete
                    System.out.println("Plese enter file name");
                    name = in.nextLine();
                    dfs.delete(name);
                    break;
                case "5":
                    //read
                    System.out.println("Plese enter file name");
                    name = in.nextLine();
                    System.out.println("Plese enter page number");
                    pageNum = in.nextInt();
                    result = dfs.read(name,pageNum);
                    System.out.println(new String(result));
                    break;
                case "6":
                    //tail
                    System.out.println("Plese enter file name");
                    name = in.nextLine();
                    result = dfs.tail(name);
                    System.out.println(new String(result));
                    break;
                case "7":
                    //head
                    System.out.println("Plese enter file name");
                    name = in.nextLine();
                    result = dfs.head(name);
                    System.out.println(new String(result));
                    break;
                case "8":
                    //append
                    System.out.println("Plese enter file name");
                    name = in.nextLine();
                    System.out.println("Plese enter file content");
                    String content = in.nextLine();
                    byte[] b = content.getBytes();
                    dfs.append(name,b);
                    break;
                case "9":
                    //move
                    break;
                case "0":
                    //quit
                    
                    //isRunning = false;
                    System.exit(0);
                    break;
                default:
                    System.out.println("Invalid input");
            }
        }
      //  System.out.println("out");
    }
    
    static public void main(String args[]) throws Exception {
        if (args.length < 1 ) {
            throw new IllegalArgumentException("Parameter: <port>");
        }
        Client client=new Client( Integer.parseInt(args[0]));

     } 
}
