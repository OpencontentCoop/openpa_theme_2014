<div class="t_align_c">
    {if $node|has_attribute('image')}
        {include uri='design:atoms/image.tpl' item=$node image_class=squaremedium css_classes="m_bottom_15" image_css_class="img-circle"}
    {/if}
    <div class="caption">
        <h4 class="fw_medium color_dark">
            <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>
        </h4>

        {if $openpa.content_ruoli_comune.ruoli.dipendente}
            <ul class="list-unstyled t_align_c color_dark">
            {foreach $openpa.content_ruoli_comune.ruoli.dipendente as $ruolo}
                <li><b>{node_view_gui content_node=$ruolo view=ruolo}</b></li>
            {/foreach}
            </ul>
        {/if}

    </div>
</div>