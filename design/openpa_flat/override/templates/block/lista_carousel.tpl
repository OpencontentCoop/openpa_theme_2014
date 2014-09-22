{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true()))}

{if and( $show_title, $block.name|ne('') )}
<div class="widget">
    <div class="widget_title">
        <h3><a href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
    </div>
{/if}
    <div class="{if and( $show_title, $block.name|ne('') )}widget_content {/if}carousel-container">
        {include uri='design:atoms/carousel.tpl'
                items=$openpa.content
                root_node=$openpa.root_node
                autoplay=0
                nav_controls=true()
                nav_indicators= false()
                interval=10000}
    </div>

{if and( $show_title, $block.name|ne('') )}
</div>
{/if}