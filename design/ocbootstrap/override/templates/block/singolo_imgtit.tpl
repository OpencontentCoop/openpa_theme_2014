{def $valid_node = $block.valid_nodes[0]}
<div class="owl-item color color-{if is_set($block.custom_attributes.color_style)}{$block.custom_attributes.color_style}{/if}">
<div class="widget_single item">
{node_view_gui content_node=$valid_node view=carousel image_class=carousel}
</div>
</div>