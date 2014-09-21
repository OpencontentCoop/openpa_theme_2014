<?php /*

[ImageMagick]
Filters[]=thumb=-resize 'x%1' -resize '%1x<' -resize 50%
Filters[]=centerimg=-gravity center -crop %1x%2+0+0 +repage
Filters[]=strip=-strip
Filters[]=sharpen=-sharpen 0.5
Filters[]=play_watermark=extension/opencontent/design/standard/images/i-play-2.png -composite -gravity Center
Filters[]=play_watermark_big=extension/opencontent/design/ftcoop_base/images/icons/play-btn.png -composite -gravity Center
Filters[]=geometry/scalemin=-geometry %1x%2^
Filters[]=geometry/galleryscale=-gravity center -background %1 -extent %2x%3

[AliasSettings]
AliasList[]=carousel
AliasList[]=squaremini
AliasList[]=squarethumb
AliasList[]=squaremedium
AliasList[]=imagefull
AliasList[]=imagefullwide
AliasList[]=imagefull_cutwide
AliasList[]=widethumb
AliasList[]=widemini
AliasList[]=widemedium

[carousel]
Filters[]
Filters[]=geometry/scalemin=850;440
Filters[]=centerimg=850;440;0;0

[squaremini]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=150
Filters[]=centerimg=64;64

[squarethumb]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=300
Filters[]=centerimg=150;150

[squaremedium]
Reference=original
Filters[]
Filters[]=geometry/scalewidth=600
Filters[]=centerimg=250;250

[imagefull]
Reference=original
Filters[]=geometry/scalewidthdownonly=850

[imagefullwide]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=1170

[imagefull_cutwide]
Reference=original
Filters[]=geometry/scalewidthdownonly=850
Filters[]=centerimg=850;380

[widemini]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=150
Filters[]=centerimg=100;50

[widemedium]
Reference=original
Filters[]
Filters[]=geometry/scalewidth=400
Filters[]=centerimg=400;250

[widethumb]
Reference=original
Filters[]
Filters[]=geometry/scalewidthdownonly=300
Filters[]=geometry/topscale=#ffffff;300;180
