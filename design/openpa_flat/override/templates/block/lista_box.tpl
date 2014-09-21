{def $openpa= object_handler($block)}
{set_defaults('show_title', true())}

{if $show_title}
<div class="widget {$block.view}">
    <div class="widget_title">
        <h3><a href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
    </div>
{/if}

    {foreach $openpa.content as $item}
        {node_view_gui content_node=$item view=line}
    {/foreach}

{if $show_title}
</div>
{/if}