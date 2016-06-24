{def $valid_nodes = $block.valid_nodes}
{if $valid_nodes|count()|gt(0)}
    {if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
    <div class="widget_tabs {$block.view}">

        {if $block.name}<div class="widget_title"><h3>{$block.name}</h3></div>{else}<h3 class="hide">Altre informazioni</h3>{/if}
        <ul class="nav nav-tabs">
            {foreach $valid_nodes as $index => $child}
                <li class="{if $index|eq(0)}active{/if}">
                    <a href="#{$block.id}-{$child.name|slugize()}" data-toggle="tab" title="{$child.name|wash()}">{$child.name|wash()}</a>
                </li>
            {/foreach}
        </ul>
        <div>
            <div class="tab-content widget">
                {foreach $valid_nodes as $index => $child}
                    <div class="tab-pane{if $index|eq(0)} active{/if}" id="{$block.id}-{$child.name|slugize()}">
                        <div class="media">
                            <div class="media-body">
                                <div class="clearfix">
                                  {if and( is_set($child.data_map.image), $child.data_map.image.has_content)}
                                    <a href="{if is_set( $child.url_alias )}{$child.url_alias|ezurl('no')}{else}#{/if}">
                                        {attribute_view_gui image_class='medium' attribute=$child.data_map.image href=false() image_css_class="pull-right" fluid=false()}
                                    </a>
                                  {elseif and( is_set($child.data_map.sindaco ), $child.data_map.sindaco.content.data_map.image.has_content )}
                                    <a href="{$child.data_map.sindaco.content.main_node.url_alias|ezurl('no')}">
                                        {attribute_view_gui image_class='medium' attribute=$child.data_map.sindaco.content.data_map.image href=false() image_css_class="pull-right" fluid=false()}
                                    </a>
                                  {/if}
  
                                  {$child|abstract()}
                                </div>
                                <p class="link">
                                    <a href="{$child.url_alias|ezurl(no)}" title="Link alla pagina {$child.name|wash()}">Leggi</a>
                                </p>
                            </div>
                        </div>
                    </div>
                {/foreach}
            </div>
        </div>

    </div>
    {if is_set($block.custom_attributes.color_style)}</div>{/if}
{/if}
