{if is_unset( $load_css_file_list )}
    {def $load_css_file_list = true()}
{/if}

<style>{literal}
    @font-face {
        font-family: 'Open Sans';
        font-style: normal;
        font-weight: 400;
        src: local('Open Sans'), local('OpenSans'), url(http://fonts.gstatic.com/s/opensans/v13/cJZKeOuBrn4kERxqtaUH3ZBw1xU1rKptJj_0jans920.woff2) format('woff2');
    }
{/literal}</style>

{if $load_css_file_list}
{ezcss_load( array(
    'app.css',
    'app_2.css',
    'leaflet/leaflet.0.7.2.css',
    'debug.css',
    'websitetoolbar.css',
    ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ),
    ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' )
),
'all', 'text/css', 'stylesheet' )}
{else}
{ezcss_load( array(
    'app.css',
    'app_2.css',
    'leaflet/leaflet.0.7.2.css',
    'debug.css',
    'websitetoolbar.css'
),
'all', 'text/css', 'stylesheet' )}
{/if}
