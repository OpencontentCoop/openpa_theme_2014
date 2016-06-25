{def $valid_node = $block.valid_nodes[0]}

{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="widget_single owl-item">
    <div class="item">
        {include uri='design:atoms/image.tpl' item=$valid_node image_class=carousel css_classes="" image_css_class="media-object tr_all_long_hover" alignment=center}
    </div>
</div>

{if is_set($block.custom_attributes.color_style)}</div>{/if}