{def $openpa= object_handler($block)}
{set_defaults( hash('show_title', true(), 'items_per_row', 4) )}

{if and( $show_title, $block.name|ne('') )}
<div class="widget {$block.view}">
    <div class="widget_title">
        <h3><a href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
    </div>
{/if}
    <div class="{if and( $show_title, $block.name|ne('') )}widget_content {/if}accordion-container">
        {include uri='design:atoms/panels.tpl'
        items_per_row=$items_per_row
        items=$openpa.content
        root_node=$openpa.root_node}
    </div>

{if and( $show_title, $block.name|ne('') )}
</div>
{/if}