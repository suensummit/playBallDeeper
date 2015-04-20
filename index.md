---
title       : Play Data, Play Ball! (II)
subtitle    : Dig Deeper
author      : Summit Suen
job         : Taiwan R User Group
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Recap

- [BUx edX | Sabermetrics 101: Introduction to Baseball Analytics](https://www.edx.org/course/sabermetrics-101-introduction-baseball-bux-sabr101x-0)

- [Lahman Database](http://lahman.r-forge.r-project.org/)
- [pitchRx](http://cpsievert.github.io/pitchRx/#2D_animation)
- [openWAR](https://baseballwithr.wordpress.com/2014/03/17/introduction-to-openwar/)

- [RSelenium](http://ropensci.github.io/RSelenium/)
- [phantomJS](http://phantomjs.org/)

---

## Sabermetrics: 

- Pythagorean theorem

$$latex
f(x;\mu,\sigma^2) = \frac{1}{\sigma\sqrt{2\pi}} 
e^{ -\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2 }
$$

- Runs Created formula

- Win Above Replacement

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
summary(gd$ds)
```

```
##    pitcherId         batterId      field_teamId           ab_num    
##  Min.   :425794   Min.   :407812   Length:75          Min.   : 1.0  
##  1st Qu.:425794   1st Qu.:435466   Class :character   1st Qu.:19.5  
##  Median :452657   Median :516770   Mode  :character   Median :38.0  
##  Mean   :461388   Mean   :502015                      Mean   :38.0  
##  3rd Qu.:462222   3rd Qu.:571431                      3rd Qu.:56.5  
##  Max.   :593372   Max.   :624585                      Max.   :75.0  
##                                                                     
##      inning          half        balls          strikes    
##  Min.   :1.000   bottom:34   Min.   :0.000   Min.   :0.00  
##  1st Qu.:2.500   top   :41   1st Qu.:1.000   1st Qu.:0.00  
##  Median :5.000               Median :1.000   Median :2.00  
##  Mean   :4.813               Mean   :1.587   Mean   :1.68  
##  3rd Qu.:7.000               3rd Qu.:3.000   3rd Qu.:3.00  
##  Max.   :9.000               Max.   :4.000   Max.   :3.00  
##                                                            
##     endOuts            event       actionId  
##  Min.   :0.000   Strikeout:23   Min.   : NA  
##  1st Qu.:1.000   Groundout:16   1st Qu.: NA  
##  Median :2.000   Single   : 9   Median : NA  
##  Mean   :1.693   Flyout   : 7   Mean   :NaN  
##  3rd Qu.:2.000   Double   : 6   3rd Qu.: NA  
##  Max.   :3.000   Walk     : 5   Max.   : NA  
##                  (Other)  : 9   NA's   :75   
##                                                                                        description
##  Matt Adams strikes out swinging.                                                            : 2  
##  Matt Carpenter grounds out, second baseman Tommy La Stella to first baseman Anthony Rizzo.  : 2  
##  Mike Olt strikes out swinging.                                                              : 2  
##  Adam Wainwright called out on strikes.                                                      : 1  
##  Adam Wainwright grounds out, third baseman Mike Olt to first baseman Anthony Rizzo.         : 1  
##  Adam Wainwright pops out to first baseman Anthony Rizzo in foul territory.                  : 1  
##  (Other)                                                                                     :66  
##  stand  throws
##  L:43   L:26  
##  R:32   R:49  
##               
##               
##               
##               
##               
##                                                       runnerMovement
##                                                              :30    
##  [518792::2B::Double]                                        : 2    
##  [407812::1B::Walk]                                          : 1    
##  [407812:1B:::Strikeout]                                     : 1    
##  [407812:1B:2B::Stolen Base 3B][518792:2B:3B::Stolen Base 3B]: 1    
##  [424325::2B::Double]                                        : 1    
##  (Other)                                                     :39    
##        x               y          game_type home_team  home_teamId 
##  Min.   : 50.3   Min.   : 61.78   R:75      chn:75    Min.   :112  
##  1st Qu.:114.8   1st Qu.:116.60                       1st Qu.:112  
##  Median :134.5   Median :139.00                       Median :112  
##  Mean   :131.9   Mean   :135.04                       Mean   :112  
##  3rd Qu.:151.6   3rd Qu.:159.93                       3rd Qu.:112  
##  Max.   :210.8   Max.   :179.89                       Max.   :112  
##  NA's   :31      NA's   :31                                        
##  home_lg away_team  away_teamId  away_lg    venueId            stadium  
##  NL:75   sln:75    Min.   :138   NL:75   Min.   :17   Wrigley Field:75  
##                    1st Qu.:138           1st Qu.:17                     
##                    Median :138           Median :17                     
##                    Mean   :138           Mean   :17                     
##                    3rd Qu.:138           3rd Qu.:17                     
##                    Max.   :138           Max.   :17                     
##                                                                         
##   timestamp           playerId.C      playerId.1B      playerId.2B    
##  Length:75          Min.   :424325   Min.   :519203   Min.   :543939  
##  Class :character   1st Qu.:424325   1st Qu.:519203   1st Qu.:543939  
##  Mode  :character   Median :425877   Median :519203   Median :570489  
##                     Mean   :434380   Mean   :542880   Mean   :571571  
##                     3rd Qu.:425877   3rd Qu.:571431   3rd Qu.:600303  
##                     Max.   :471083   Max.   :571431   Max.   :600303  
##                                                                       
##   playerId.3B      playerId.SS      playerId.LF      playerId.CF    
##  Min.   :572761   Min.   :425509   Min.   :407812   Min.   :445055  
##  1st Qu.:572761   1st Qu.:425509   1st Qu.:407812   1st Qu.:445055  
##  Median :592609   Median :516770   Median :458085   Median :451594  
##  Mean   :583611   Mean   :475398   Mean   :436784   Mean   :450376  
##  3rd Qu.:592609   3rd Qu.:516770   3rd Qu.:458085   3rd Qu.:451594  
##  Max.   :592609   Max.   :516770   Max.   :458085   Max.   :488721  
##                                                                     
##   playerId.RF      batterPos                batterName      pitcherName
##  Min.   :518792   Length:75          Heyward     : 6   Lester     :23  
##  1st Qu.:518792   Class :character   Carpenter, M: 5   Wainwright :23  
##  Median :624585   Mode  :character   Holliday    : 5   Martinez, C: 4  
##  Mean   :576626                      Peralta     : 5   Ramirez, N : 4  
##  3rd Qu.:624585                      Adams, M    : 4   Rondon, H  : 4  
##  Max.   :624585                      Castro, S   : 4   Strop      : 4  
##                                      (Other)     :46   (Other)    :13  
##    runsOnPlay     startOuts       runsInInning     runsITD       
##  Min.   :0.00   Min.   :0.0000   Min.   :0.00   Min.   :0.00000  
##  1st Qu.:0.00   1st Qu.:0.0000   1st Qu.:0.00   1st Qu.:0.00000  
##  Median :0.00   Median :1.0000   Median :0.00   Median :0.00000  
##  Mean   :0.04   Mean   :0.9733   Mean   :0.24   Mean   :0.09333  
##  3rd Qu.:0.00   3rd Qu.:2.0000   3rd Qu.:0.00   3rd Qu.:0.00000  
##  Max.   :1.00   Max.   :2.0000   Max.   :1.00   Max.   :1.00000  
##                                                                  
##    runsFuture       start1B            start2B            start3B         
##  Min.   :0.0000   Length:75          Length:75          Length:75         
##  1st Qu.:0.0000   Class :character   Class :character   Class :character  
##  Median :0.0000   Mode  :character   Mode  :character   Mode  :character  
##  Mean   :0.1467                                                           
##  3rd Qu.:0.0000                                                           
##  Max.   :1.0000                                                           
##                                                                           
##     end1B              end2B              end3B            outsInInning
##  Length:75          Length:75          Length:75          Min.   :3    
##  Class :character   Class :character   Class :character   1st Qu.:3    
##  Mode  :character   Mode  :character   Mode  :character   Median :3    
##                                                           Mean   :3    
##                                                           3rd Qu.:3    
##                                                           Max.   :3    
##                                                                        
##    startCode        endCode        fielderId         gameId         
##  Min.   :0.000   Min.   :0.000   Min.   :407812   Length:75         
##  1st Qu.:0.000   1st Qu.:0.000   1st Qu.:446690   Class :character  
##  Median :1.000   Median :1.000   Median :518792   Mode  :character  
##  Mean   :1.373   Mean   :1.373   Mean   :507830                     
##  3rd Qu.:2.000   3rd Qu.:2.000   3rd Qu.:571196                     
##  Max.   :7.000   Max.   :7.000   Max.   :600303                     
##                                  NA's   :45                         
##     isPA            isAB           isHit           isBIP        
##  Mode :logical   Mode :logical   Mode :logical   Mode :logical  
##  FALSE:1         FALSE:7         FALSE:60        FALSE:31       
##  TRUE :74        TRUE :68        TRUE :15        TRUE :44       
##  NA's :0         NA's :0         NA's :0         NA's :0        
##                                                                 
##                                                                 
##                                                                 
##      our.x             our.y              r              theta       
##  Min.   :-186.43   Min.   : 47.69   Min.   : 51.09   Min.   :0.4766  
##  1st Qu.: -25.34   1st Qu.: 97.51   1st Qu.:107.04   1st Qu.:0.9910  
##  Median :  23.75   Median :149.73   Median :181.77   Median :1.4221  
##  Mean   :  17.16   Mean   :159.62   Mean   :180.23   Mean   :1.4267  
##  3rd Qu.:  66.45   3rd Qu.:205.65   3rd Qu.:231.39   3rd Qu.:1.7242  
##  Max.   : 214.25   Max.   :342.46   Max.   :345.68   Max.   :2.2823  
##  NA's   :31        NA's   :31       NA's   :31       NA's   :31
```

---

## Data Source

- lahman database
- MLBAM: Gameday

---

## openWAR



## CPBL

---

## Early Power Surge: is that real?

