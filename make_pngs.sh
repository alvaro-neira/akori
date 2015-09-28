cd ~/akori &&
date &&
java -classpath ".:lib/selenium-server-standalone-2.47.1.jar:lib/jsoup-1.7.3.jar:build/classes" cl.akori.main.GetImage "/ds_eggs/www.designsponge.com/2015/04/in-the-kitchen-with-marnie-andrea-and-jens-deviled-eggs.html" &&
java -classpath ".:lib/selenium-server-standalone-2.47.1.jar:lib/jsoup-1.7.3.jar:build/classes" cl.akori.main.GetImage "/ds_london/www.designsponge.com/2015/03/24-hours-in-london-england-with-james-greig.html" &&
java -classpath ".:lib/selenium-server-standalone-2.47.1.jar:lib/jsoup-1.7.3.jar:build/classes" cl.akori.main.GetImage "/ds_instagram/www.designsponge.com/2014/09/10-travel-instagram-feeds-to-follow-and-swoon-over.html" &&
java -classpath ".:lib/selenium-server-standalone-2.47.1.jar:lib/jsoup-1.7.3.jar:build/classes" cl.akori.main.GetImage "/dc_manhattan/www.divinecaroline.com/lifestyle/food-drink/how-make-manhattan.html" &&
# 1 hour so far
date

