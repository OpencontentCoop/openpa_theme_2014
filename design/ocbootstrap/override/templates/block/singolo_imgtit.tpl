{def $valid_node = $block.valid_nodes[0]}
{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="widget_single">
{node_view_gui content_node=$valid_node view=carousel image_class=carousel}
</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}