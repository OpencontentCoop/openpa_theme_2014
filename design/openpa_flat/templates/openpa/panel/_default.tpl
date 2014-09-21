<div class="t_align_c">
    {if $node|has_attribute('image')}
        {include uri='design:atoms/image.tpl' item=$node image_class=squaremedium css_classes="m_bottom_15"}
    {/if}
    <div class="caption">
        <h4 class="fw_medium color_dark">
            <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a></h4>

        {$node|abstract()}

    </div>
</div>