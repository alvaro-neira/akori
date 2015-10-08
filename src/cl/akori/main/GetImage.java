package cl.akori.main;

import java.util.ArrayList;

public class GetImage {
	public static final String RESULTS_PATH = "../results/";
    public static final String WEBSITES_PATH = "../websites/";
    public static final String PICTURES_PATH = "/Users/aneira/lalo/data/pngs/";
    //Sorted by duration
//    public static final String[] URLlist = {
//    	"/ds_eggs/www.designsponge.com/2015/04/in-the-kitchen-with-marnie-andrea-and-jens-deviled-eggs.html", //2m7.147s
//    	"/ds_london/www.designsponge.com/2015/03/24-hours-in-london-england-with-james-greig.html", //3m41.747s
//    	"/ds_instagram/www.designsponge.com/2014/09/10-travel-instagram-feeds-to-follow-and-swoon-over.html", //3m48.523s
//    	"/dc_manhattan/www.divinecaroline.com/lifestyle/food-drink/how-make-manhattan.html", //4m38.993s
//    	"/ds_berlin/www.designsponge.com/2015/05/berlin-germany-city-guide.html", //5m36.069s
//    	"/es_berlin/www.elizabethstreet.com/travel/berlin-international-film-festival/the-luxer.html", //5m36.069s
//    	"/ds_argentina/www.designsponge.com/2012/12/palermo-buenos-aires-argentina-city-guide.html" //6m7.363s
//    };
	public static void main(String[] args) {
        WebPage webpage= new WebPage(args[0].trim());
        webpage.getPng();
	}

}
