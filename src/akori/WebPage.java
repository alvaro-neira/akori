package akori;

import java.io.File;
import java.io.PrintWriter;
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
	public static final String RESULTS_PATH = "../test2/";
	public static final String WEBSITES_PATH = "../websites/";
	public static final String PICTURES_PATH = "./build/reports/tests/";
    public static final Integer MAX_DEPTH = 100;

	private static String uri;
	private static SelenideElement baseElem;
	private static Integer maxj;
	private static ArrayList<String> coordinates;
	public WebPage(String uri) {
		this.uri = uri;
	}

	public ArrayList<String> getCoordinates() {
		coordinates = new ArrayList<>();

		String NAME = StringUtils.namefile(uri);

		By by = By.tagName("body");
		baseElem = Selenide.$(by);

		Document doc = getJsoupDoc(uri, true);
		Elements e1 = doc.body().getAllElements();

		ArrayList<String> tags = new ArrayList<>();
		Selenide.screenshot(NAME);

		maxj = 0;
		Integer numberElements = e1.size();
		Integer numberSelenideElements = 0;
		System.out.println("number of elements=" + numberElements);
		Integer elementCounter = 0;
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
		return coordinates;
	}

	public static void processSelenideElement(SelenideElement elem, Element temp, Integer id) {
		WebElement temp1 = elem.toWebElement();
		Point po = temp1.getLocation();
		Dimension d = temp1.getSize();
		if (d.width <= 0 || d.height <= 0 || po.x < 0 || po.y < 0) {
			return;
		}
		int dep = 0;
		int j = 1;
		for (; !elem.equals(baseElem); ++j) {
			elem = elem.parent();
			if (j > MAX_DEPTH) {
				break;
			}
		}
		Integer k = 0;
		String str = "";
		if (temp.hasText()) {
			str = temp.nodeName() + "," + po.x + "," + po.y + "," + d.width + "," + d.height + "," + j + "," + 1 + ","
					+ id + "," + (k + 1);
		} else {
			str = temp.nodeName() + "," + po.x + "," + po.y + "," + d.width + "," + d.height + "," + j + "," + 0 + ","
					+ id + "," + (k + 1);
		}
		coordinates.add(str);
		if (j > maxj) {
			maxj = j;
		}
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
}
