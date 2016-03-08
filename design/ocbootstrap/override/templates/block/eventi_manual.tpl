{def $valid_nodes = $block.valid_nodes
$show_link = true()}

{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
    <div class="widget {$block.view} panels-container">
        {if $block.name|ne('')}
            <div class="widget_title">
                {if $show_link}
                    <a class="pull-right" href="{$valid_nodes[0].parent.url_alias|ezurl(no)}"
                       title="Vai al calendario"><i class="fa fa-calendar f_size_ex_large"></i></a>
                {/if}
                <h3>
                    {$block.name|wash()}
                </h3>
            </div>
        {/if}
        <div class="widget_content">
            <div class="events">
                {foreach $valid_nodes as $i => $child}
                    {include uri="design:calendar/block_list_item.tpl" item=$child}
                {/foreach}
            </div>
        </div>
    </div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}

