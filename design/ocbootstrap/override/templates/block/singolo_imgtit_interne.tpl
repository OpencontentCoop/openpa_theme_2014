{def $valid_node = $block.valid_nodes[0]}
<div class="color color-{if is_set($block.custom_attributes.color_style)}{$block.custom_attributes.color_style}{/if}">
  <div class="widget_single">
    <h3 class='widget_title'>{node_view_gui content_node=$valid_node view=text_linked}</h3>
    {include uri='design:atoms/image.tpl' item=$valid_node image_class=large alignment=center href=object_handler($valid_node).content_link.full_link}    
  </div>
</div>