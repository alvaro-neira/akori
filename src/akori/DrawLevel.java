/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package akori;

import com.codeborne.selenide.ElementsCollection;
import com.codeborne.selenide.SelenideElement;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.imageio.ImageIO;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.*;
import com.codeborne.selenide.Selenide;
import java.nio.file.Paths;
import java.nio.file.Path;

/**
 *
 * @author Claudio
 */
public class DrawLevel {
    public static final String RESULTS_PATH = "../results/";
    public static final String WEBSITES_PATH = "../websites/";
    public static final String PICTURES_PATH = "./build/reports/tests/";
    public static final String[] URLlist = {
        //"http://www.mbauchile.cl"
        //"http://www.businessinsider.com/best-iphone-only-apps-you-cant-get-on-android-2015-6"
        //WEBSITES_PATH+"bi_apps/www.businessinsider.com/best-iphone-only-apps-you-cant-get-on-android-2015-650f4.html" //missing 10 hours
        //WEBSITES_PATH+"ds_berlin/www.designsponge.com/2015/05/berlin-germany-city-guide.html"
        //WEBSITES_PATH+"ds_argentina/www.designsponge.com/2012/12/palermo-buenos-aires-argentina-city-guide.html"
        //WEBSITES_PATH+"columbia_about/www.columbia.edu/content/about-columbia.html"
        //WEBSITES_PATH+"columbia_adm/www.columbia.edu/node/52.html" //missing
//        WEBSITES_PATH+"columbia_nobel/www.columbia.edu/content/nobel-laureates.html" //105 minutes
        //WEBSITES_PATH+"dc_manhattan/www.divinecaroline.com/lifestyle/food-drink/how-make-manhattan.html"
        "/ds_eggs/www.designsponge.com/2015/04/in-the-kitchen-with-marnie-andrea-and-jens-deviled-eggs.html"
        //WEBSITES_PATH+"ds_instagram/www.designsponge.com/2014/09/10-travel-instagram-feeds-to-follow-and-swoon-over.html"
        //WEBSITES_PATH+"ds_london/www.designsponge.com/2015/03/24-hours-in-london-england-with-james-greig.html"
        //WEBSITES_PATH+"emol_vino/www.emol.com/tendenciasymujer/Noticias/2015/06/09/27386/Expertos-eligen-a-vino-sudafricano-como-el-mejor-del-mundo.html"
//        WEBSITES_PATH+"es_berlin/www.elizabethstreet.com/travel/berlin-international-film-festival/the-luxer.html"
//        WEBSITES_PATH+"gq_autos/www.gq.com.mx/maquinas/autos.html" //missing
//        WEBSITES_PATH+"gq_bitbite/www.gq.com.mx/maquinas/gadgets/articulos/bitbite-el-gadget-ideal-para-bajar-de-peso/5040.html" //24 minutes
//        WEBSITES_PATH+"gq_secuelas/www.gq.com.mx/actualidad/cine-tv/articulos/cuales-son-las-mejores-segundas-partes-en-la-historia-del-cine/4842.html" //error
//        WEBSITES_PATH+"primer_battery/www.primermagazine.com/2009/field-manual/five-ways-to-make-your-cell-phone-battery-last-longer.html" //missing 153 minutes
//        WEBSITES_PATH+"primer_beer/www.primermagazine.com/2012/learn/a-simple-guide-to-pairing-beer-with-food.html" //7 hours and did not finished
//        WEBSITES_PATH+"science_cat/news.sciencemag.org/categories.html" //ugly
//        WEBSITES_PATH+"science_mag/www.sciencemag.org/magazine.html"
//        WEBSITES_PATH+"uncrate_phones/uncrate.com/tech/cell-phones/index.html"
//        WEBSITES_PATH+"werd_rides/www.werd.com/category/rides/index.html"
        //WEBSITES_PATH+"wharton_phd/doctoral.wharton.upenn.edu/class-profile/index.html"
       // WEBSITES_PATH+"wiki_paine/es.wikipedia.org/wiki/Parque_nacional_Torres_del_Paine.html" //paragraphs missing
        //WEBSITES_PATH+"wiki_pisco/es.wikipedia.org/wiki/Pisco_(aguardiente).html" //paragraphs reguleque
//          WEBSITES_PATH+"wired_note4/www.wired.com/2014/10/samsung-galaxy-note-4-2/index.html"
//          WEBSITES_PATH+"enfem/Diez%20alimentos%20que%20puedes%20comer%20antes%20de%20hacer%20ejercicio.htm" //84 minutes and didn't stop
//          WEBSITES_PATH+"enfem/Recetas%20sin%20gluten%20-%20enfemenino.htm" //No results after 4 hours
    };
    public static void main(String[] args) {
        System.out.println("esto es DrawLevel");
        for (int k = 0; k < URLlist.length; ++k) {
            WebPage webpage= new WebPage(URLlist[k]);
            ArrayList<String>coordinates = webpage.getCoordinates();
            try {
            	BufferedReader reader = new BufferedReader(new FileReader(RESULTS_PATH+webpage.getName()+".csv"));
                int[] conteo = new int[webpage.getMaxDepth()];
                BufferedImage img = ImageIO.read(new File(PICTURES_PATH+webpage.getName() + ".png"));
                Graphics2D graph = img.createGraphics();
                graph.setColor(Color.RED);
//                graph.setFont(	);
                Font currentFont = graph.getFont();
                Integer fontSize=12;
                Font newFont = new Font(currentFont.getFontName(), Font.BOLD, fontSize);
                graph.setFont(newFont);
                
                ArrayList<String> elementsGraphed = new ArrayList<>();
				String line=reader.readLine(); //header
				line=reader.readLine();
				while(line!=null){
					String[] aux = line.split(",");
	                conteo[Integer.parseInt(aux[5]) - 1]++;
	                if (Integer.parseInt(aux[5]) < webpage.getMaxDepth() && conteo[Integer.parseInt(aux[5])-1] > conteo[Integer.parseInt(aux[5])]) {
	                    int x = Integer.parseInt(aux[1]);
	                    int y = Integer.parseInt(aux[2]);
	                    int w = Integer.parseInt(aux[3]);
	                    int h = Integer.parseInt(aux[4]);

	                    graph.draw(new Rectangle(x, y, w, h));
	                    String id=aux[9];
	                    graph.drawString(id, x, y+fontSize-1);
	                    elementsGraphed.add(line);
	                }
	                line=reader.readLine();
				}
	            graph.dispose();
	            reader.close();
	            //Here it generates the png file
	            ImageIO.write(img, "png", new File(RESULTS_PATH + webpage.getName() + ".png"));

			} catch (Exception e1) {
				System.err.println("Exception: "+e1);
	            e1.printStackTrace();
	            System.exit(1);
			}

            System.out.println("DrawLevel terminado");
        }
    }
}
