{def $openpa= object_handler($block)}
{set_defaults( hash('show_title', true(), 'items_per_row', 4) )}
{*
<div class="content-view-block accordion-container">
    {include uri='design:atoms/accordion.tpl'
             items=$openpa.content
             root_node=$openpa.root_node
             title=cond($show_title, $block.name, false())}
</div>
*}

<div class="relative carousel-top-control {if or( $show_title|not(), $block.name|eq('') )}title-placeholder{/if} {$block.view}">

    {if and( $show_title, $block.name|ne('') )}
        <h3 class="widget_title"><a href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
{/if}

    <div class="{if and( $show_title, $block.name|ne('') )}widget_content {/if}panels-container">
    {include uri='design:atoms/panels.tpl'
             items_per_row=$items_per_row
             items=$openpa.content
             image_class=widemedium
             root_node=$openpa.root_node}
    </div>

</div>

{unset_defaults( array('show_title', 'items_per_row') )}