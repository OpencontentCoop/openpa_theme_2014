<?php /*

[General]
AllowedTypes[]=HTML
AllowedTypes[]=Banner
AllowedTypes[]=ImmagineDimensioneOriginale


[AreaRiservata]
Name=Login Area Riservata
ViewName[]
ViewName[accesso_area_riservata]=Accesso area riservata

[GMapItems]
Name=Google Map Items
ViewName[]
ViewName[geo_located_content]=Mappa (Google)
ViewName[geo_located_content_osm]=Mappa (OpenStreetMap)

[GMap]
Name=Google Map
ViewName[]
ViewName[gmap]=Google Map

[Singolo]
Name=Oggetto singolo
ViewName[]
ViewName[singolo_img]=Solo immagine
ViewName[singolo_imgtit]=Banner
ViewName[singolo_img_interne]=Titolo e immagine
ViewName[singolo_imgtit_interne]=Immagine e Titolo (media)
ViewName[singolo_img_interne_piccolo]=Full
ViewName[singolo_imgtit_interne_piccolo]=Immagine e Titolo (con titolo blocco)
ViewName[singolo_box_piccolo]=Line (immagine piccola con blocco titolo)
ViewName[singolo_box]=Line
ViewName[singolo_banner]=Line (con blocco titolo, sfondo grigio)

[Lista]
Name=Lista di oggetti (assegnare un contenitore)
[Lista]
Name=Lista di oggetti (assegnare un contenitore)
NumberOfValidItems=1
NumberOfArchivedItems=0
CustomAttributes[]=node_id
UseBrowseMode[node_id]=true
CustomAttributes[]=limite
CustomAttributes[]=includi_classi
CustomAttributes[]=escludi_classi
CustomAttributes[]=ordinamento
CustomAttributes[]=livello_profondita
CustomAttributes[]=state_id
CustomAttributeNames[]
CustomAttributeNames[livello_profondita]=Livello di profondità nell'alberatura
CustomAttributeNames[limite]=Numero di elementi
CustomAttributeNames[includi_classi]=Tipologie di contenuto da includere
CustomAttributeNames[escludi_classi]=Tipologie di contenuto da escludere (alternativo rispetto al precedente)
CustomAttributeNames[ordinamento]=Ordina per
CustomAttributeNames[state_id]=Stato
CustomAttributeTypes[ordinamento]=select
CustomAttributeTypes[includi_classi]=class_select
CustomAttributeTypes[escludi_classi]=class_select
CustomAttributeSelection_ordinamento[]
CustomAttributeSelection_ordinamento[name]=Titolo
CustomAttributeSelection_ordinamento[pubblicato]=Data di pubblicazione
CustomAttributeSelection_ordinamento[modificato]=Data di ultima modifica
CustomAttributeSelection_ordinamento[priority]=Priorità del nodo
CustomAttributeTypes[state_id]=state_select
ManualAddingOfItems=disabled
ViewName[]
ViewName[lista_num]=Panelli (carousel) [Mostra solo elementi con immagine]
ViewName[lista_accordion]=Panelli
ViewName[lista_box]=Elenco
ViewName[lista_carousel]=Banner (carousel) [Mostra solo elementi con immagine]
ViewName[lista_carousel_rassegna]=Pannelli (carousel)
ViewName[lista_carousel_rassegna_oggi]=Schede (carousel rassegna oggi)

[Lista3]
Name=Lista di oggetti (assegnati singolarmente) - MAX 5
ViewName[]
ViewName[lista_accordion_manual]=Panelli
ViewName[lista_box2]=Box a 3 colonne (3 oggetti)
ViewName[lista_box4]=Box ultimi figli (3 oggetti)
ViewName[lista_tab]=Schede (tab)
ViewName[lista_carousel]=Banner (carousel) [Mostra solo elementi con immagine]

[Lista4]
Name=Lista di oggetti (assegnati singolarmente) - MAX 15
ViewName[]
ViewName[lista_accordion_manual]=Panelli
ViewName[lista_box2]=Box a 3 colonne (3 oggetti)
ViewName[lista_tab]=Schede (tab)

[Eventi]
Name=Eventi
ViewName[]
ViewName[eventi]=Eventi
ViewName[eventi_manual]=Eventi singoli
ViewName[eventi_carousel]=Panelli (carousel)

[Iosono]
Name=Schede Homepage (Io sono, eventi della vita, ecc...)
ViewName[]
ViewName[iosono]=Schede (tab)

[FeedRSS]
Name=Feed reader
ViewName[]
ViewName[feed_reader]=Feed reader
ViewName[feed_meteo]=Feed meteo

[VideoPlayer]
Name=Video Player
ViewName[]
ViewName[video_ez]=eZ Player
ViewName[video_flow]=Flow Player
ViewName[video_flow_playlist]=Flow Player Playlist (piccola)
ViewName[video_flow_playlist_big]=Flow Player Playlist (grande)

[ContentSearch]
Name=Motori di ricerca
ViewName[]
ViewName[search_class_and_attributes]=Cerca per classe e attributi
ViewName[search_free_ajax]=Ricerca libera

[HTML]
Name=Codice HTML
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=html
CustomAttributeTypes[html]=text
ViewList[]
ViewList[]=html
ViewName[html]=html

[Banner]
Name=Banner
NumberOfValidItems=1
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
CustomAttributes[]
CustomAttributes[]=uri
CustomAttributeTypes[uri]=Url del link
ViewList[]
ViewList[]=banner_uri
ViewName[]
ViewName[banner_uri]=Banner

[ImmagineDimensioneOriginale]
Name=Singola Immagine a dimensione originale
NumberOfValidItems=1
NumberOfArchivedItems=0
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=single_original_image
ViewName[]
ViewName[single_original_image]=L'immagine visualizzata sarà in formato orginale


*/?>