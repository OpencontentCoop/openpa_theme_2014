{def $valid_nodes = $block.valid_nodes
	 $valid_nodes_count = $valid_nodes|count()}

{set_defaults( hash('show_title', true()) )}

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
		  {node_view_gui content_node=$valid_nodes[1] view=line}
        </div>
	</div>
	
{elseif $valid_nodes_count|ge(3)}

    <div class="row">
        <div class="col-md-4">
		  {node_view_gui content_node=$valid_nodes[0] view=line}
        </div>
	
	    <div class="col-md-4">
		  {node_view_gui content_node=$valid_nodes[1] view=line}
        </div>
        
        <div class="col-md-4">
		  {node_view_gui content_node=$valid_nodes[2] view=line}
        </div>
    </div>
{/if}
</div>
{if and( $show_title, $block.name|ne('') )}
</div>
{/if}
