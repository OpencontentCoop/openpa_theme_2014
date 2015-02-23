{def $valid_node = $block.valid_nodes[0]}
<div class="relative panels-container {$block.view}">
{if and( $block.name|ne(''), $valid_node|has_attribute( 'image' ) )}
  <div class="panel-label">{$block.name}</div>
{/if}
{node_view_gui content_node=$valid_node view=panel image_class=large}
</div>