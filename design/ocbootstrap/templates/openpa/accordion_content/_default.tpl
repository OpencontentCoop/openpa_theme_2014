{set_defaults(hash(
  'image_class', 'small',
  'image_css_class', "object-left",
  'fluid', false()
))}
<div class="clearfix">
  
  {if and( is_set($node.data_map.image), $node.data_map.image.has_content)}
    <a href="{if is_set( $node.url_alias )}{$node.url_alias|ezurl('no')}{else}#{/if}">
        {attribute_view_gui image_class=$image_class attribute=$node.data_map.image href=false() image_css_class=$image_css_class fluid=$fluid}
    </a>  
  {/if}

  {$node|abstract()}
</div>