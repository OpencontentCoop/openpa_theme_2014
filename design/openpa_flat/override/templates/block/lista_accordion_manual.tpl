{def $openpa= object_handler($block)}
{set_defaults( hash('show_title', true()) )}

{if $show_title}
<div class="widget {$block.view}">
    <div class="widget_title">
        <h3><a href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
    </div>
{/if}
    <div class="{if $show_title}widget_content {/if}accordion-container">
        {include uri='design:atoms/panels.tpl'
        items_per_row=4
        items=$openpa.content
        root_node=$openpa.root_node}
    </div>

{if $show_title}
</div>
{/if}