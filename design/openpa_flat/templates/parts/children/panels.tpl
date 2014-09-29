{set_defaults( hash(
  'page_limit', 24,  
  'delimiter', '',
  'exclude_classes', appini( 'ContentViewChildren', 'ExcludeClasses', array( 'image', 'video' ) ),
  'include_classes', array(),
  'type', 'exclude',
  'fetch_type', 'list',
  'parent_node', $node
))}


{if $type|eq( 'exclude' )}
{def $params = hash( 'class_filter_type', 'exclude', 'class_filter_array', $exclude_classes )}
{else}
{def $params = hash( 'class_filter_type', 'include', 'class_filter_array', $include_classes )}
{/if}

{def $children_count = fetch( openpa, concat( $fetch_type, '_count' ), hash( 'parent_node_id', $parent_node.node_id )|merge( $params ) )
	 $children = fetch( openpa, $fetch_type, hash( 'parent_node_id', $parent_node.node_id,
												  'offset', $view_parameters.offset,
                                                  'sort_by', $parent_node.sort_array,
                                                  'limit', $page_limit )|merge( $params ) ) }
{if $children_count}
  <div class="content-view-children">  
	{foreach $children as $i => $child }
	  {if $i|eq(0)}
		<div class="row">
	  {/if}
	  <div class="col-md-4">
		{node_view_gui content_node=$child view=panel}
	  </div>
	  {if eq(sum($i,1)|mod(3),0)}
		</div>
		<div class="row">
	  {/if}
	  {if $i|eq($page_limit|sub(1))}
		</div>
	  {/if}	 
	{/foreach}
  </div>

  {include name=navigator
		   uri='design:navigator/google.tpl'
		   page_uri=$node.url_alias
		   item_count=$children_count
		   view_parameters=$view_parameters
		   item_limit=$page_limit}

{/if}