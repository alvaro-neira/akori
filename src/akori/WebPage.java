package akori;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebElement;

import com.codeborne.selenide.ElementsCollection;
import com.codeborne.selenide.Selenide;
import com.codeborne.selenide.SelenideElement;
import cl.akori.util.StringUtils;

public class WebPage {
	public static final String RESULTS_PATH = "../results/";
	public static final String WEBSITES_PATH = "../websites/";
	public static final String PICTURES_PATH = "./build/reports/tests/";
    public static final Integer MAX_DEPTH = 100;

	private String uri;
	private SelenideElement baseElem;
	private Integer maxDepth;
	private ArrayList<String> coordinates;
	String name;
	PrintWriter writer;
	Integer objectId;
	public WebPage(String uri) {
		this.uri = uri;
		this.name = StringUtils.namefile(uri);
	}

	public ArrayList<String> getCoordinates() {
		coordinates = new ArrayList<>();
		By by = By.tagName("body");
		baseElem = Selenide.$(by);

		Document doc = getJsoupDoc(uri, true);
		Elements e1 = doc.body().getAllElements();

		ArrayList<String> tags = new ArrayList<>();
		Selenide.screenshot(name);

		maxDepth = 0;
		Integer numberElements = e1.size();
		Integer numberSelenideElements = 0;
		System.out.println("number of elements=" + numberElements);
		Integer elementCounter = 0;
        try {
			writer = new PrintWriter(RESULTS_PATH + name+".csv", "UTF-8");
		} catch (Exception e) {
			System.err.println("Trying to write '"+RESULTS_PATH+name+".csv'");
            e.printStackTrace();
            System.exit(1);
		} 
        writer.println("node_name,x,y,width,height,depth,has_text,id,k,object_id");
        objectId=0;
		for (Element elem : e1) {
			elementCounter++;
			System.out.println("Examining element '" + elem.nodeName() + "'");
			if (tags.indexOf(elem.tagName()) != -1) {
				System.out.println("Skipping " + elem.tagName());
				continue;
			}
			tags.add(elem.tagName());
			ElementsCollection selenideElements = Selenide.$$(By.tagName(elem.tagName()));
			numberSelenideElements = selenideElements.size();
			System.out.println("number of selenide elements=" + numberSelenideElements);
			int id = 1;
			for (SelenideElement temp2 : selenideElements) {
				System.out.println(id + "/" + numberSelenideElements + "/" + elementCounter + "/" + numberElements);

				processSelenideElement(temp2, elem, id);
				id++;
				// if(id>MAX_DEPTH2){
				// continue;
				// }
			}
		}

		System.out.println("out of loop");
        writer.close();
		return coordinates;
	}

	public void processSelenideElement(SelenideElement selenideElem, Element elem, Integer id) {
		WebElement temp1 = selenideElem.toWebElement();
		Point po = temp1.getLocation();
		Dimension d = temp1.getSize();
		if (d.width <= 0 || d.height <= 0 || po.x < 0 || po.y < 0) {
			return;
		}
		int dep = 0;
		int j = 1;
		for (; !selenideElem.equals(baseElem); j++) {
			selenideElem = selenideElem.parent();
			if (j > MAX_DEPTH) {
				break;
			}
		}
		Integer k = 0;
		String str = "";
		
		str = elem.nodeName() + "," + po.x + "," + po.y + "," + d.width + "," + d.height + "," + j + "," 
		      + (elem.hasText()?1:0) + ","	+ id + "," + (k + 1)+","+(++objectId);
		coordinates.add(str);
		if (j > maxDepth) {
			maxDepth = j;
		}
        writer.println(str);
	}

	public static Document getJsoupDoc(String path, Boolean isOffline) {
		Document doc = null;
		String url = path;
		try {
			if (isOffline) {
				url = StringUtils.toAbsolutePath(WEBSITES_PATH) + path;
				System.out.println("Trying to open 'file://" + url + "'");
				Selenide.open("file://" + url);
				File in = new File(StringUtils.url2file(url));
				doc = Jsoup.parse(in, "UTF-8", "http://www.google.com");
			} else {
				Selenide.open(url);
				doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 6.1; rv:24.0) Gecko/20100101 Firefox/24.0")
						.timeout(0).referrer("http://www.google.com").get();
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.exit(1);
		}
		return doc;
	}
	
	public String getName(){
		return name;
	}
	
	public Integer getMaxDepth(){
		return maxDepth;
	}
}
