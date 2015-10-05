{def $valid_node = $block.valid_nodes[0]}

{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="widget {$block.view}">
    <div class="widget_title">
        <h3>{node_view_gui content_node=$valid_node view=text_linked text=$block.name}</h3>
    </div>

    <div class="widget_content">
    {if and( is_set($valid_node.data_map.image), $valid_node.data_map.image.has_content )}
    {attribute_view_gui alt=$valid_node.name|wash() attribute=$valid_node.data_map.image image_class=large}
    {/if}
    </div>
</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}