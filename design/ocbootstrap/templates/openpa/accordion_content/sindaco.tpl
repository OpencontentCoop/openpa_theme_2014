<div class="clearfix">
  {if and( is_set($node.data_map.sindaco ), $node.data_map.sindaco.content.data_map.image.has_content )}
    <a href="{$node.data_map.sindaco.content.main_node.url_alias|ezurl('no')}">
        {attribute_view_gui image_class=medium attribute=$node.data_map.sindaco.content.data_map.image href=false() image_css_class="object-right" fluid=false()}
    </a>
  {/if}

  {$node|abstract()}
</div>