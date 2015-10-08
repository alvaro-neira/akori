/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.akori.main;

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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Claudio
 */
public class DrawLevel {
    public static final String RESULTS_PATH = "../results/";
    public static final String WEBSITES_PATH = "../websites/";
    public static final String PICTURES_PATH = "./build/reports/tests/";
    public static final String[] URLlist = {
    };
    public static void main(String[] args) {
        System.out.println("esto es DrawLevel");
        for (int k = 0; k < URLlist.length; ++k) {
            WebPage webpage= new WebPage(URLlist[k]);
            try {
                webpage.getCoordinates();
            } catch (IOException ex) {
                Logger.getLogger(DrawLevel.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("Max Depth="+webpage.getMaxDepth());
            webpage.getPng();
            System.out.println("DrawLevel terminado");
        }
    }
}
