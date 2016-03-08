{def $openpa= object_handler($block)}
{set_defaults( hash('show_title', true(), 'items_per_row', 3) )}

{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="{$block.view}">
    
    {if and( $show_title, $block.name|ne('') )}
      <div  class="widget_title">
        <h3>{$block.name|wash()}</h3>
      </div>
    {/if}    

    <div class="panel-group" id="item-{$block.id}-accordion" role="tablist" aria-multiselectable="true">
      {foreach $openpa.content as $index => $item}
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="item-{$block.id}-{$item.node_id}-heading">            
          <h4 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="#item-{$block.id}-accordion" href="#item-{$block.id}-{$item.node_id}-collapse" aria-expanded="true" aria-controls="item-{$block.id}-{$item.node_id}">
              {$item.name|wash()}
            </a>
          </h4>
        </div>
        <div id="item-{$block.id}-{$item.node_id}-collapse" class="panel-collapse collapse{if $index|eq(0)} in{/if}" role="tabpanel" aria-labelledby="item-{$block.id}-{$item.node_id}-heading">
          <div class="panel-body">
            {node_view_gui content_node=$item view=line}
            <p class="link">
              <a href="{object_handler($item).content_link.full_link}" title="{$item.name|wash()}">Leggi</a>
            </p>
          </div>
        </div>
      </div>
      {/foreach}        
    </div>      

</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}
{unset_defaults( array('show_title', 'items_per_row') )}