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
          {if or($show_title|not(), $block.name|eq('') )}<div class="widget"><div class="widget_content">{/if}
            <h4>{node_view_gui content_node=$valid_nodes[0] view=text_linked}</h4>
            {node_view_gui content_node=$valid_nodes[0] view=accordion_content image_class=small}        
            <p class="link"><a href="{object_handler($valid_nodes[0]).content_link.full_link}" title="{$valid_nodes[0].name|wash()}">Leggi</a></p>
          {if or($show_title|not(), $block.name|eq('') )}  </div></div>{/if}
        </div>
	
	    <div class="col-md-6">
        {if or($show_title|not(), $block.name|eq('') )}<div class="widget"><div class="widget_content">{/if}
          <h4>{node_view_gui content_node=$valid_nodes[1] view=text_linked}</h4>
          {node_view_gui content_node=$valid_nodes[1] view=accordion_content image_class=small}        
          <p class="link"><a href="{object_handler($valid_nodes[1]).content_link.full_link}" title="{$valid_nodes[1].name|wash()}">Leggi</a></p>         
        {if or($show_title|not(), $block.name|eq('') )}  </div></div>{/if}
      </div>  
	</div>
	
{elseif $valid_nodes_count|ge(3)}    
    {def $col-width=6 $modulo=2}
    {if and( $valid_nodes_count|eq(3), mod( 12, $valid_nodes_count )|eq(0) )}
      {set $col-width=4 $modulo=3}
    {/if}
    <div class="row"> 
    {foreach $valid_nodes as $__valid_node}
      <div class="col-md-{$col-width}">
        {if or($show_title|not(), $block.name|eq('') )}<div class="widget"><div class="widget_content">{/if}
          <h4>{node_view_gui content_node=$__valid_node view=text_linked}</h4>
          {node_view_gui content_node=$__valid_node view=accordion_content image_class=small}        
          <p class="link"><a href="{object_handler($__valid_node).content_link.full_link}" title="{$__valid_node.name|wash()}">Leggi</a></p>         
        {if or($show_title|not(), $block.name|eq('') )}  </div></div>{/if}
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