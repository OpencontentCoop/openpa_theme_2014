{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}
<link type="text/css" rel="stylesheet" media="all" href="{'stylesheets/roboto.css'|ezdesign(no)}" />
{if $load_css_file_list}
  {ezcss_load( array( 'app.css',
                      'app_2.css',
                      'debug.css',
                      'websitetoolbar.css',
                      'plugins/owl-carousel/owl.carousel.css',
                      'plugins/owl-carousel/owl.theme.css',
                      "plugins/blueimp/blueimp-gallery.css",
                      'plugins/table-calendar.css',
                      'leaflet/leaflet.css',
                      'leaflet/map.css',
                      'leaflet/MarkerCluster.css',
                      'leaflet/MarkerCluster.Default.css',
                      'controls-audio.css',
                      'dataTables.bootstrap.css',
                      'fuelux.css',
                      ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
                      ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' )
  ),
  'all', 'text/css', 'stylesheet')}
{else}
  {ezcss_load( array( 'app.css',
                      'app_2.css',
                      'debug.css',
                      'websitetoolbar.css',
                      'plugins/owl-carousel/owl.carousel.css',
                      'plugins/owl-carousel/owl.theme.css',
                      "plugins/blueimp/blueimp-gallery.css",
                      'plugins/table-calendar.css',
                      'leaflet/leaflet.css',
                      'leaflet/map.css',
                      'leaflet/MarkerCluster.css',
                      'leaflet/MarkerCluster.Default.css',
                      'controls-audio.css',
                      'dataTables.bootstrap.css',
                      'fuelux.css'
  ),
  'all', 'text/css', 'stylesheet', '')}
{/if}
