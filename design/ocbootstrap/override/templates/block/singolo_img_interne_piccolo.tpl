{set_defaults( hash('show_title', true()) )}
{def $valid_node = $block.valid_nodes[0]}
{def $current_openpa = object_handler($valid_node)}

{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
{if and( $show_title, $block.name|ne('') )}
<div class="widget_title">
    <h3><a href={$valid_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
  </div>
<div class="widget {$block.view}">
{/if}

  <div class="{if and( $show_title, $block.name|ne('') )}widget_content {/if}">	
    {include name=block_full uri=$current_openpa.content_main.template openpa=$current_openpa node=$valid_node}
    {include name=block_full uri=$current_openpa.content_detail.template openpa=$current_openpa node=$valid_node}
  </div>

{if and( $show_title, $block.name|ne('') )}
</div>
{/if}
{if is_set($block.custom_attributes.color_style)}</div>{/if}
{undef $valid_node $current_openpa}