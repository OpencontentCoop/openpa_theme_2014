<?php /*

[ImageMagick]
#centra l'immagine e la ritaglia
#Filters[]=roundcenterimg=-gravity center -crop %1x%2+0+0 +repage
#applica la maschera
#Filters[]=roundmask=extension/openpa_theme_2014/design/standard/images/round-mask.png -composite
#scontorna il bianco
#Filters[]=roundtrans=-transparent White

#[AliasSettings]
#AliasList[]=round_thumb

#[round_thumb]
#questo è importante serve a restituire una gif (trasparente) partendo da altri formati
#MIMEType=image/gif
#Reference=
#Filters[]
#Filters[]=geometry/scaleheight=300
#Filters[]=roundcenterimg=300;300
#Filters[]=roundmask=
#Filters[]=roundtrans=