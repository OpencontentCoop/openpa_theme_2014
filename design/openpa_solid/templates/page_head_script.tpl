<script type="text/javascript">{literal}//<![CDATA[
var UiContext = {/literal}"{$ui_context}"{literal}, UriPrefix = {/literal}{'/'|ezurl()}{literal}, PathArray = [{/literal}{if is_set( $pagedata.path_array[0].node_id )}{foreach $pagedata.path_array|reverse as $path}{$path.node_id}{delimiter},{/delimiter}{/foreach}{/if}{literal}];
//]]>{/literal}</script>

{* Load JavaScript dependencys + JavaScriptList *}
{ezscript_load( array(
  'ezjsc::jquery',
  'ezjsc::jqueryUI',
  'ezjsc::jqueryio',
  'bootstrap/tab.js',
  'bootstrap/dropdown.js',
  'bootstrap/collapse.js',
  'bootstrap/affix.js',
  'bootstrap/alert.js',
  'bootstrap/button.js',
  'bootstrap/carousel.js',
  'bootstrap/modal.js',
  'bootstrap/tooltip.js',
  'bootstrap/popover.js',
  'bootstrap/scrollspy.js',
  'bootstrap/transition.js',
  'waypoints.min.js',
  'leaflet/leaflet.0.7.2.js',  
  'leaflet/leaflet.markercluster.js',
  'leaflet/Leaflet.MakiMarkers.js',
  'leaflet/Control.Geocoder.js',  
  'openpa_solid.js'
))}

<!--[if lt IE 9]>    
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>        
<script type="text/javascript" src={"javascript/respond.min.js"|ezdesign()} ></script>
<![endif]-->