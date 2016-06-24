{def $valid_nodes = $block.valid_nodes
	 $valid_nodes_count = $valid_nodes|count()}

{set_defaults( hash('show_title', true()) )}
{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
{if and( $show_title, $block.name|ne('') )}
<div class="widget {$block.view}">
    <div class="widget_title">
        <h3>{$block.name|wash()}</h3>
    </div>
{/if}

<div class="{if and( $show_title, $block.name|ne('') )}widget_content {/if}">

{if $valid_nodes_count|eq(1)}
  
  {node_view_gui content_node=$valid_nodes[0] view=line}

{elseif $valid_nodes_count|eq(2)}

  <div class="row">	
        <div class="col-md-6">
          {node_view_gui content_node=$valid_nodes[0] view=line}
        </div>
	
	    <div class="col-md-6">
        <div class="widget">
          <div class="widget_content"> 
            {node_view_gui content_node=$valid_nodes[1] view=line}          
          </div>
        </div>
      </div>  
	</div>
	
{elseif $valid_nodes_count|ge(3)}    
    {def $col-width=6 $modulo=2}
    {if and( $valid_nodes_count|eq(3), mod( 12, $valid_nodes_count )|eq(0) )}
      {set $col-width=4 $modulo=3}
    {/if}
    <div class="row"> 
    {foreach $valid_nodes as $valid_node }
      <div class="col-md-{$col-width}">
        <div class="widget">
          <div class="widget_content"> 
            {node_view_gui content_node=$valid_node view=line}
          </div>
        </div>
      </div>
      {delimiter modulo=$modulo}</div><div class="row">{/delimiter}
    {/foreach}
    </div>
{/if}
</div>
{if and( $show_title, $block.name|ne('') )}
</div>
{/if}
{if is_set($block.custom_attributes.color_style)}</div>{/if}