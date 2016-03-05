{if count($block.valid_nodes)}
{def $valid_node = $block.valid_nodes[0]}
{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="relative panels-container {$block.view}">
{if and( $block.name|ne(''), $valid_node|has_attribute( 'image' ) )}
  <div class="panel-label">{$block.name}</div>
{/if}
{node_view_gui content_node=$valid_node view=panel image_class=large}
</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}
{/if}