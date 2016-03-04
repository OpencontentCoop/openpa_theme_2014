<?php /*

############################################
############################################ DATATYPE
############################################

[datatype_compensi]
Source=content/datatype/view/ezmatrix.tpl
MatchFile=datatype/compensi_matrix.tpl
Subdir=templates
Match[attribute_identifier]=compensi

[ezstring_sito]
Source=content/datatype/view/ezstring.tpl
MatchFile=datatype/string_as_url.tpl
Subdir=templates
Match[attribute_identifier]=sito

[datatype_binary_mp3]
Source=content/datatype/view/ezbinaryfile.tpl
MatchFile=datatype/file_mp3.tpl
Subdir=templates
Match[attribute_identifier]=mp3

[datatype_video_seduta]
Source=content/datatype/view/ezstring.tpl
MatchFile=datatype/link_video.tpl
Subdir=templates
Match[attribute_identifier]=codice_video

[datatype_video_seduta2]
Source=content/datatype/view/ezstring.tpl
MatchFile=datatype/link_video.tpl
Subdir=templates
Match[attribute_identifier]=codice_video_2

[datatype_video_seduta3]
Source=content/datatype/view/ezstring.tpl
MatchFile=datatype/link_video.tpl
Subdir=templates
Match[attribute_identifier]=codice_video_3

############################################
############################################ EMBED
############################################

[embed_banner]
Source=content/view/embed.tpl
MatchFile=embed/banner.tpl
Subdir=templates
Match[class_identifier]=banner

[embed_file_pdf]
Source=content/view/embed.tpl
MatchFile=embed/file_pdf.tpl
Subdir=templates
Match[class_identifier]=file_pdf

[embed_file]
Source=content/view/embed.tpl
MatchFile=embed/file.tpl
Subdir=templates
Match[class_identifier]=file

[embed_flow_media]
Source=content/view/embed.tpl
MatchFile=embed/ezflowmedia.tpl
Subdir=templates
Match[class_identifier]=ezflowmedia

[embed_folder]
Source=content/view/embed.tpl
MatchFile=embed/folder.tpl
Subdir=templates
Match[class_identifier]=folder

[embed_pagina_sito]
Source=content/view/embed.tpl
MatchFile=embed/folder.tpl
Subdir=templates
Match[class_identifier]=pagina_sito

[embed_forum]
Source=content/view/embed.tpl
MatchFile=embed/forum.tpl
Subdir=templates
Match[class_identifier]=forum

[embed_gallery]
Source=content/view/embed.tpl
MatchFile=embed/gallery.tpl
Subdir=templates
Match[class_identifier]=gallery

[embed_image]
Source=content/view/embed.tpl
MatchFile=embed/image.tpl
Subdir=templates
Match[class_identifier]=image

[embed_poll]
Source=content/view/embed.tpl
MatchFile=embed/poll.tpl
Subdir=templates
Match[class_identifier]=poll

############################################
############################################ EMBED-INLINE
############################################

[embed_inline_image]
Source=content/view/embed-inline.tpl
MatchFile=embed-inline/image.tpl
Subdir=templates
Match[class_identifier]=image

############################################
############################################ BLOCK
############################################

[block_gmapitems_geo_located_content]
Source=block/view/view.tpl
MatchFile=block/geo_located_content.tpl
Subdir=templates
Match[type]=GMapItems
Match[view]=geo_located_content

[block_gmapitems_geo_located_content_osm]
Source=block/view/view.tpl
MatchFile=block/geo_located_content_osm.tpl
Subdir=templates
Match[type]=GMapItems
Match[view]=geo_located_content_osm

[block_accesso_area_riservata]
Source=block/view/view.tpl
MatchFile=block/accesso_area_riservata.tpl
Subdir=templates
Match[type]=AreaRiservata
Match[view]=accesso_area_riservata

[block_class_filter]
Source=block/view/view.tpl
MatchFile=block/class_filter.tpl
Subdir=templates
Match[type]=ContentSearch
Match[view]=class_filte

[block_search_class]
Source=block/view/view.tpl
MatchFile=block/search_class.tpl
Subdir=templates
Match[type]=ClassSearch
Match[view]=search_class

[block_search_class_and_attributes]
Source=block/view/view.tpl
MatchFile=block/search_class_and_attributes.tpl
Subdir=templates
Match[type]=AttributesSearch
Match[view]=search_class_and_attributes

[block_search_free_ajax]
Source=block/view/view.tpl
MatchFile=block/search_free_ajax.tpl
Subdir=templates
Match[type]=FreeSearch
Match[view]=search_free_ajax

[block_video_ez]
Source=block/view/view.tpl
MatchFile=block/videoez.tpl
Subdir=templates
Match[type]=VideoPlayer
Match[view]=video_ez

[block_video_flow_playlist]
Source=block/view/view.tpl
MatchFile=block/videoflow_playlist.tpl
Subdir=templates
Match[type]=VideoPlayer
Match[view]=video_flow_playlist

[block_video_flow_playlist_big]
Source=block/view/view.tpl
MatchFile=block/videoflow_playlist_big.tpl
Subdir=templates
Match[type]=VideoPlayer
Match[view]=video_flow_playlist_big

[block_video_flow]
Source=block/view/view.tpl
MatchFile=block/videoflow.tpl
Subdir=templates
Match[type]=VideoPlayer
Match[view]=video_flow

[block_feed_reader]
Source=block/view/view.tpl
MatchFile=block/feed_reader.tpl
Subdir=templates
Match[type]=FeedRSS
Match[view]=feed_reader

[block_feed_meteo]
Source=block/view/view.tpl
MatchFile=block/feed_meteo.tpl
Subdir=templates
Match[type]=FeedRSS
Match[view]=feed_meteo

[block_singolo_img]
Source=block/view/view.tpl
MatchFile=block/singolo_img.tpl
Subdir=templates
Match[type]=Singolo
Match[view]=singolo_img

[block_singolo_img_interne]
Source=block/view/view.tpl
MatchFile=block/singolo_img_interne.tpl
Subdir=templates
Match[type]=Singolo
Match[view]=singolo_img_interne

[block_singolo_imgtit_interne]
Source=block/view/view.tpl
MatchFile=block/singolo_imgtit_interne.tpl
Subdir=templates
Match[type]=Singolo
Match[view]=singolo_imgtit_interne

[block_singolo_imgtit]
Source=block/view/view.tpl
MatchFile=block/singolo_imgtit.tpl
Subdir=templates
Match[type]=Singolo
Match[view]=singolo_imgtit

[block_singolo_box]
Source=block/view/view.tpl
MatchFile=block/singolo_box.tpl
Subdir=templates
Match[type]=Singolo
Match[view]=singolo_box

[block_singolo_banner]
Source=block/view/view.tpl
MatchFile=block/singolo_banner.tpl
Subdir=templates
Match[type]=Singolo
Match[view]=singolo_banner

[block_lista_num]
Source=block/view/view.tpl
MatchFile=block/lista_num.tpl
Subdir=templates
Match[type]=Lista
Match[view]=lista_num

[block_lista_accordion]
Source=block/view/view.tpl
MatchFile=block/lista_accordion.tpl
Subdir=templates
Match[type]=Lista
Match[view]=lista_accordion

[block_lista_accordion_Lista3]
Source=block/view/view.tpl
MatchFile=block/lista_accordion_manual.tpl
Subdir=templates
Match[type]=Lista3
Match[view]=lista_accordion_manual

[block_lista_accordion_Lista4_max15]
Source=block/view/view.tpl
MatchFile=block/lista_accordion_manual.tpl
Subdir=templates
Match[type]=Lista4
Match[view]=lista_accordion_manual

[block_lista_box]
Source=block/view/view.tpl
MatchFile=block/lista_box.tpl
Subdir=templates
Match[type]=Lista
Match[view]=lista_box

[block_lista_box_2_Lista3]
Source=block/view/view.tpl
MatchFile=block/lista_box2.tpl
Subdir=templates
Match[type]=Lista3
Match[view]=lista_box2

[block_lista_box_2_Lista4_Max15]
Source=block/view/view.tpl
MatchFile=block/lista_box2.tpl
Subdir=templates
Match[type]=Lista4
Match[view]=lista_box2

[block_lista_box_3_Lista3]
Source=block/view/view.tpl
MatchFile=block/lista_box3.tpl
Subdir=templates
Match[type]=Lista3
Match[view]=lista_box3

[block_lista_box_4_Lista3]
Source=block/view/view.tpl
MatchFile=block/lista_box4.tpl
Subdir=templates
Match[type]=Lista3
Match[view]=lista_box4

[block_lista_box_5_Lista3]
Source=block/view/view.tpl
MatchFile=block/lista_box5.tpl
Subdir=templates
Match[type]=Lista3
Match[view]=lista_box5

[block_lista_tab]
Source=block/view/view.tpl
MatchFile=block/lista_tab.tpl
Subdir=templates
Match[type]=Lista
Match[view]=lista_tab

[block_lista_tab_Lista3]
Source=block/view/view.tpl
MatchFile=block/lista_tab.tpl
Subdir=templates
Match[type]=Lista3
Match[view]=lista_tab

[block_lista_tab_Lista4]
Source=block/view/view.tpl
MatchFile=block/lista_tab.tpl
Subdir=templates
Match[type]=Lista4
Match[view]=lista_tab

[block_lista_carousel]
Source=block/view/view.tpl
MatchFile=block/lista_carousel.tpl
Subdir=templates
Match[type]=Lista
Match[view]=lista_carousel

[block_lista_carousel_rassegna]
Source=block/view/view.tpl
MatchFile=block/lista_num.tpl
Subdir=templates
Match[type]=Lista
Match[view]=lista_carousel_rassegna

[block_lista_carousel_rassegna_oggi]
Source=block/view/view.tpl
MatchFile=block/lista_num.tpl
Subdir=templates
Match[type]=Lista
Match[view]=lista_carousel_rassegna_oggi

[block_lista_carousel3]
Source=block/view/view.tpl
MatchFile=block/lista_carousel.tpl
Subdir=templates
Match[type]=Lista3
Match[view]=lista_carousel

[block_iosono]
Source=block/view/view.tpl
MatchFile=block/iosono.tpl
Subdir=templates
Match[type]=Iosono
Match[view]=iosono

[block_gmap]
Source=block/view/view.tpl
MatchFile=block/gmap.tpl
Subdir=templates
Match[type]=GMap
Match[view]=gmap

[block_html]
Source=block/view/view.tpl
MatchFile=block/html.tpl
Subdir=templates
Match[type]=HTML
Match[view]=html

[block_eventi_carousel]
Source=block/view/view.tpl
MatchFile=block/eventi_carousel.tpl
Subdir=templates
Match[type]=Eventi
Match[view]=eventi_carousel

[block_lista_num_auto_scroll]
Source=block/view/view.tpl
MatchFile=block/lista_num_auto_scroll.tpl
Subdir=templates
Match[type]=Lista
Match[view]=lista_num_auto_scroll

[block_banner_uri_content]
Source=block/view/view.tpl
MatchFile=block/banner_uri.tpl
Subdir=templates
Match[type]=Banner
Match[view]=banner_uri

[block_single_original_image_content]
Source=block/view/view.tpl
MatchFile=block/single_original_image.tpl
Subdir=templates
Match[type]=ImmagineDimensioneOriginale
Match[view]=single_original_image
