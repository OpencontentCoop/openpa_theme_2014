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
  'openpa_flat.js',
  ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ),
  ezini( 'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini' )
))}

<!--[if lt IE 9]>
<script type="text/javascript" src={"javascript/respond.js"|ezdesign()} ></script>
<![endif]-->