{def $valid_nodes = $block.valid_nodes
    $children = array()
    $subchildren = array()
    $children_count = 0    
	$col-width = 4
	$modulo = 3    
    $classi_da_escludere = openpaini( 'GestioneClassi', 'classi_da_escludere_dai_blocchi_ezflow' )}

{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="widget_tabs {$block.view}">
    <ul class="nav nav-tabs" role="tablist">
        {foreach $valid_nodes as $index => $node}
            <li{if $index|eq(0)} class="active"{/if}>
                <a href="#{$node.name|slugize()}" role="tab" data-toggle="tab">
                    {$node.name|wash()}
                </a>
            </li>
        {/foreach}
    </ul>
    <div class="tab-content">
        {foreach $valid_nodes as $index => $node}
            <div class="tab-pane{if $index|eq(0)} active{/if}" id="{$node.name|slugize()}">
                {set $children = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                                    'class_filter_type', 'exclude',
                                                                    'class_filter_array', $classi_da_escludere,
                                                                    'sort_by', $node.sort_array,
                                                                    'limit', 20 ) )
                $subchildren = array()
                $children_count = $children|count()}
				<div class="row">
                {foreach $children as $i => $child}
                  <div class="col-md-{$col-width}">
                    <h4><a title="Informazioni su {$child.name|wash}" href={$child.object.main_node.url_alias|ezurl()}>{$child.name|wash()}</a></h4>
                    {set $subchildren=fetch( 'content', 'list', hash( 'parent_node_id', $child.node_id,
                                                                        'class_filter_type', 'exclude',
                                                                        'class_filter_array', $classi_da_escludere,
                                                                        'sort_by', $node.sort_array,
                                                                        'limit', 10 ) )}
                    {if $subchildren|count()|gt(0)}
                      {foreach $subchildren as $subchild}<a title="Informazioni su {$subchild.name|wash}" href={$subchild.object.main_node.url_alias|ezurl()}>{$subchild.name|wash()}</a>{delimiter}, {/delimiter}{/foreach}
                    {else}
					  {if $child.data_map.has_abstract()}
						{$child|abstract()}                        
					  {/if}
                    {/if}
				  </div>
                {delimiter modulo=$modulo}</div><div class="row">{/delimiter}
                {/foreach}
				</div>
            </div>
        {/foreach}
    </div>
</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}