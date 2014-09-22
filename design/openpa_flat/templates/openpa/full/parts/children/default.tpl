{set_defaults( hash(
  'page_limit', 10,
  'view', 'line',
  'delimiter', '',
  'exclude_classes', appini( 'ContentViewChildren', 'ExcludeClasses', array( 'image', 'video' ) ),
  'include_classes', array(),
  'type', 'exclude',
  'fetch_type', 'list',
  'parent_node', $node,
  'image_class', 'squaremini'
))}

{if and( is_set( $node.data_map.classi_filtro ), $node.data_map.classi_filtro.has_content )}
            
  {def $classes = $node.data_map.classi_filtro.content|explode(',')
	   $virtual_classes = array()}
  {foreach $classes as $class}
	  {set $virtual_classes = $virtual_classes|append( $class|trim() )}
  {/foreach}
  
  {if $node.data_map.subfolders.has_content}
	  {def $virtual_subtree = array()}
	  {foreach $node.data_map.subfolders.content.relation_list as $relation}
		  {set $virtual_subtree = $virtual_subtree|append( $relation.node_id )}
	  {/foreach}
  {else}
	  {def $virtual_subtree = array( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) )}
  {/if}
  
  {def $sortArray = $node.object.main_node.sort_array
	   $order = $sortArray[0][0]}
  {if array( 'published', 'name' )|contains( $order )|not()}
	 {set $order = 'published'}
  {/if}
  {if $sortArray[0][1]|eq( 1 )}
	  {def $sortHash = hash( $order, 'asc' )}
  {else}
	  {def $sortHash = hash( $order, 'desc' )}
  {/if}
  
  {def $search_hash = hash( 'subtree_array', $virtual_subtree,
							'offset', $view_parameters.offset,
							'limit', $page_limit,
							'class_id', $virtual_classes,
							'sort_by', $sortHash
							)
	   $search = fetch( ezfind, search, $search_hash )}
	   
  {def $children = $search['SearchResult']
	   $children_count = $search['SearchCount']}
{else}
  
  {if $type|eq( 'exclude' )}
	{def $params = hash( 'class_filter_type', 'exclude', 'class_filter_array', $exclude_classes )}
  {else}
	{def $params = hash( 'class_filter_type', 'include', 'class_filter_array', $include_classes )}
  {/if}
  
  {def $children_count = fetch( content, concat( $fetch_type, '_count' ), hash( 'parent_node_id', $parent_node.node_id )|merge( $params ) )
	   $children = fetch( content, $fetch_type, hash( 'parent_node_id', $parent_node.node_id,
													  'offset', $view_parameters.offset,
													  'sort_by', $parent_node.sort_array,											
													  'limit', $page_limit )|merge( $params ) ) }

{/if}

{if $children_count}
  <div class="content-view-children">  
	{foreach $children as $child }
	  {node_view_gui view=$view content_node=$child image_class=$image_class}
	  {delimiter}{$delimiter}{/delimiter}
	{/foreach}
  </div>

  {include name=navigator
		   uri='design:navigator/google.tpl'
		   page_uri=$node.url_alias
		   item_count=$children_count
		   view_parameters=$view_parameters
		   item_limit=$page_limit}

{/if}