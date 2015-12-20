/**
 * 
 */
package cl.akori.util;

import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * @author aneira
 *
 */
public class StringUtils {
	public static String namefile(String url) {
        String new_url = url.replaceAll("/", "");
        new_url = new_url.replaceAll("\\.", "");
        new_url = new_url.replaceAll("www", "");
        new_url = new_url.replaceAll("http", "");
        new_url = new_url.replaceAll(":", "");
        return new_url;
    }

    public static String toAbsolutePath(String relativePath){
        Path p = Paths.get(relativePath);
        String retVal="";
        try {
            retVal = p.toAbsolutePath().toRealPath().toString();
        }catch(Exception e){
            e.printStackTrace();
            System.exit(1);
        }
        return retVal;
    }

    public static String url2file(String url) {
        return url.replaceAll("%20", "\\ ");
    }
}
