{set_defaults( hash('show_title', true()) )}
{def $valid_node = $block.valid_nodes[0]}
{def $openpa = object_handler($valid_node)}

{if and( $show_title, $block.name|ne('') )}
<div class="widget {$block.view}">
  <div class="widget_title">
    <h3><a href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>
  </div>
{/if}

  <div class="{if and( $show_title, $block.name|ne('') )}widget_content {/if}">
    {include uri=$openpa.content_main.template}
    {include uri=$openpa.content_detail.template}
  </div>

{if and( $show_title, $block.name|ne('') )}
</div>
{/if}