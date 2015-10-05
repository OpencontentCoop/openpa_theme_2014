{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true()))}

{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
{if and( $show_title, $block.name|ne('') )}
<div class="widget {$block.view}">
    <div class="widget_title">
        <h3><a href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
    </div>
    {/if}

    {foreach $openpa.content as $item}
        {node_view_gui content_node=$item view=line}
    {/foreach}

    {if and( $show_title, $block.name|ne('') )}
</div>
{/if}
{if is_set($block.custom_attributes.color_style)}</div>{/if}