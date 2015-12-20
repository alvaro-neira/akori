package cl.akori.main;

import java.util.ArrayList;

public class GetImage {
	
	public static void main(String[] args) {
        WebPage webpage= new WebPage(args[0].trim());
        webpage.getPng();
	}

}
