{def $valid_node = $block.valid_nodes[0]}
{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="widget_single {$block.view}">
    <div class="widget_title r_corners_top">
        <h3>{node_view_gui content_node=$valid_node view=text_linked text=$block.name}</h3>
    </div>
    <div class="well">        
        {node_view_gui content_node=$valid_node view=accordion_content image_class=large image_css_class='' fluid=true()}        
        <p class="link">
          <a href="{object_handler($valid_node).content_link.full_link}" title="{$valid_node.name|wash()}">Leggi</a>
        </p>
    </div>
</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}