---
title       : Play Data, Play Ball ! ! 
subtitle    : Dig Deeper
author      : Summit Suen
job         : Taiwan R User Group
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]     # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Recap

### Introduction to Baseball Analytics

- [BUx edX | Sabermetrics 101](https://www.edx.org/course/sabermetrics-101-introduction-baseball-bux-sabr101x-0)

### Useful R packages

- [Lahman Database](http://lahman.r-forge.r-project.org/)
- [pitchRx](http://cpsievert.github.io/pitchRx/#2D_animation)
- [openWAR](https://baseballwithr.wordpress.com/2014/03/17/introduction-to-openwar/)
- [RSelenium](http://ropensci.github.io/RSelenium/)
- [phantomJS](http://phantomjs.org/)

---

## Sabermetrics

### Pythagorean theorem

$$latex
\frac{RS^2}{RS^2 + RA^2} = \text{Est. Winning Percentage} \text{, where RS = Runs Scored, RA = Runs Allowed}
$$
$$latex
\text{i.e., Est. Winning Percentage} = \frac{R^n}{R^n + 1} \text{, where } R = \frac{RS}{RA} \text{as the scoring ratio}
$$

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 

---

## Sabermetrics

### Runs Created formula
- From common sense to a linear weighted model

---

## Sabermetrics

### Win Above Replacement

[openWAR](https://baseballwithr.wordpress.com/category/openwar/)
![](https://baseballwithr.files.wordpress.com/2014/08/unnamed-chunk-14.png)

---

## openWAR


```r
require(openWAR)
source("~/Documents/openWAR/R/GameDay.R")
getGameIds(date=as.Date("2015-04-05"))
```

```
## 
## Retrieving data from 2015-04-05 ...
## ...found 2 games
```

```
## [1] "gid_2015_04_05_slnmlb_chnmlb_1" "gid_2015_04_05_zznmlb_zzamlb_1"
```

```r
gd = gameday(gameId="gid_2015_04_05_slnmlb_chnmlb_1")
```

```
## gid_2015_04_05_slnmlb_chnmlb_1
```

---

## openWAR


```r
gd$url
```

```
##                                                                                                        bis_boxscore.xml 
##      "http://gd2.mlb.com/components/game/mlb/year_2015/month_04/day_05/gid_2015_04_05_slnmlb_chnmlb_1/bis_boxscore.xml" 
##                                                                                                          inning_all.xml 
## "http://gd2.mlb.com/components/game/mlb/year_2015/month_04/day_05/gid_2015_04_05_slnmlb_chnmlb_1/inning/inning_all.xml" 
##                                                                                                          inning_hit.xml 
## "http://gd2.mlb.com/components/game/mlb/year_2015/month_04/day_05/gid_2015_04_05_slnmlb_chnmlb_1/inning/inning_hit.xml" 
##                                                                                                                game.xml 
##              "http://gd2.mlb.com/components/game/mlb/year_2015/month_04/day_05/gid_2015_04_05_slnmlb_chnmlb_1/game.xml" 
##                                                                                                         game_events.xml 
##       "http://gd2.mlb.com/components/game/mlb/year_2015/month_04/day_05/gid_2015_04_05_slnmlb_chnmlb_1/game_events.xml"
```

---

## openWAR

![](assets/img/plays_xml.png)

---

## openWAR


```r
str(gd$ds)
```

```
## 'data.frame':	75 obs. of  62 variables:
##  $ pitcherId     : num  452657 452657 452657 452657 452657 ...
##  $ batterId      : num  572761 518792 407812 425509 571431 ...
##  $ field_teamId  : chr  "112" "112" "112" "112" ...
##  $ ab_num        : num  1 2 3 4 5 6 7 8 9 10 ...
##  $ inning        : num  1 1 1 1 1 1 1 1 1 2 ...
##  $ half          : Factor w/ 2 levels "bottom","top": 2 2 2 2 2 1 1 1 1 2 ...
##  $ balls         : num  2 1 2 0 1 1 1 2 2 1 ...
##  $ strikes       : num  2 0 0 3 3 0 2 3 1 3 ...
##  $ endOuts       : num  1 1 1 2 3 0 1 2 3 1 ...
##  $ event         : Factor w/ 18 levels "Caught Stealing 2B",..: 7 3 15 17 17 3 7 17 7 17 ...
##  $ actionId      : num  NA NA NA NA NA NA NA NA NA NA ...
##  $ description   : Factor w/ 94 levels "Adam Wainwright called out on strikes.  ",..: 51 23 55 32 49 20 39 4 79 93 ...
##  $ stand         : Factor w/ 2 levels "L","R": 1 1 2 2 1 1 2 1 2 2 ...
##  $ throws        : Factor w/ 2 levels "L","R": 1 1 1 1 1 2 2 2 2 1 ...
##  $ runnerMovement: Factor w/ 45 levels "","[407812::1B::Walk]",..: 1 26 28 1 3 17 18 1 19 1 ...
##  $ x             : num  142 190 175 NA NA ...
##  $ y             : num  159 119 127 NA NA ...
##  $ game_type     : Factor w/ 1 level "R": 1 1 1 1 1 1 1 1 1 1 ...
##  $ home_team     : Factor w/ 1 level "chn": 1 1 1 1 1 1 1 1 1 1 ...
##  $ home_teamId   : num  112 112 112 112 112 112 112 112 112 112 ...
##  $ home_lg       : Factor w/ 1 level "NL": 1 1 1 1 1 1 1 1 1 1 ...
##  $ away_team     : Factor w/ 1 level "sln": 1 1 1 1 1 1 1 1 1 1 ...
##  $ away_teamId   : num  138 138 138 138 138 138 138 138 138 138 ...
##  $ away_lg       : Factor w/ 1 level "NL": 1 1 1 1 1 1 1 1 1 1 ...
##  $ venueId       : num  17 17 17 17 17 17 17 17 17 17 ...
##  $ stadium       : Factor w/ 1 level "Wrigley Field": 1 1 1 1 1 1 1 1 1 1 ...
##  $ timestamp     : chr  "2015-04-06 00:16:58" "2015-04-06 00:19:47" "2015-04-06 00:18:55" "2015-04-06 00:20:42" ...
##  $ playerId.C    : num  424325 424325 424325 424325 424325 ...
##  $ playerId.1B   : num  519203 519203 519203 519203 519203 ...
##  $ playerId.2B   : num  6e+05 6e+05 6e+05 6e+05 6e+05 ...
##  $ playerId.3B   : num  592609 592609 592609 592609 592609 ...
##  $ playerId.SS   : num  516770 516770 516770 516770 516770 ...
##  $ playerId.LF   : num  458085 458085 458085 458085 458085 ...
##  $ playerId.CF   : num  451594 451594 451594 451594 451594 ...
##  $ playerId.RF   : num  624585 624585 624585 624585 624585 ...
##  $ batterPos     : chr  "3B" "RF" "LF" "SS" ...
##  $ batterName    : Factor w/ 30 levels "Adams, M","Alcantara",..: 4 9 10 19 1 8 26 22 5 15 ...
##  $ pitcherName   : Factor w/ 30 levels "Adams, M","Alcantara",..: 13 13 13 13 13 28 28 28 28 13 ...
##  $ runsOnPlay    : int  0 0 1 0 0 0 0 0 0 0 ...
##  $ startOuts     : num  0 1 1 1 2 0 0 1 2 0 ...
##  $ runsInInning  : int  1 1 1 1 1 0 0 0 0 1 ...
##  $ runsITD       : num  0 0 0 1 1 0 0 0 0 0 ...
##  $ runsFuture    : num  1 1 1 0 0 0 0 0 0 1 ...
##  $ start1B       : chr  NA NA NA "407812" ...
##  $ start2B       : chr  NA NA "518792" NA ...
##  $ start3B       : chr  NA NA NA NA ...
##  $ end1B         : chr  NA NA "407812" "407812" ...
##  $ end2B         : chr  NA "518792" NA NA ...
##  $ end3B         : chr  NA NA NA NA ...
##  $ outsInInning  : num  3 3 3 3 3 3 3 3 3 3 ...
##  $ startCode     : num  0 0 2 1 1 0 2 4 4 0 ...
##  $ endCode       : num  0 2 1 1 0 2 4 4 0 0 ...
##  $ fielderId     : num  6e+05 NA NA NA NA ...
##  $ gameId        : chr  "gid_2015_04_05_slnmlb_chnmlb_1" "gid_2015_04_05_slnmlb_chnmlb_1" "gid_2015_04_05_slnmlb_chnmlb_1" "gid_2015_04_05_slnmlb_chnmlb_1" ...
##  $ isPA          : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
##  $ isAB          : logi  TRUE TRUE TRUE TRUE TRUE TRUE ...
##  $ isHit         : logi  FALSE TRUE TRUE FALSE FALSE TRUE ...
##  $ isBIP         : logi  TRUE TRUE TRUE FALSE FALSE TRUE ...
##  $ our.x         : num  42.2 163.2 124.3 NA NA ...
##  $ our.y         : num  99.1 200.4 180.7 NA NA ...
##  $ r             : num  108 258 219 NA NA ...
##  $ theta         : num  1.168 0.887 0.968 NA NA ...
```

---

## openWAR


```r
ggplot(data = gd$ds, aes(x = x, y = y, color = isHit)) + geom_point(size = 3) + coord_fixed()
```

![plot of chunk unnamed-chunk-5](assets/fig/unnamed-chunk-5-1.png) 

---

## Data Source

- lahman database
- MLBAM: Gameday

---

## openWAR



---

## CPBL

---

## Early Power Surge: is that real?

