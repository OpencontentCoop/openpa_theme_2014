{set_defaults( hash(  
  'view', 'line',
  'delimiter', '',
  'exclude_classes', openpaini( 'ExcludedClassesAsChild', 'FromFolder', array( 'image', 'infobox', 'global_layout' ) ),
  'include_classes', array(),
  'type', 'exclude',
  'fetch_type', 'list',
  'parent_node', $node,  
))}

{if $type|eq( 'exclude' )}
{def $params = hash( 'class_filter_type', 'exclude', 'class_filter_array', $exclude_classes )}
{else}
{def $params = hash( 'class_filter_type', 'include', 'class_filter_array', $include_classes )}
{/if}

{def $children_count = fetch( openpa, concat( $fetch_type, '_count' ), hash( 'parent_node_id', $parent_node.node_id )|merge( $params ) )
   $children = fetch( openpa, $fetch_type, hash( 'parent_node_id', $parent_node.node_id,                                                  
                                                  'sort_by', $parent_node.sort_array )|merge( $params ) ) }


{if $children_count}
{ezcss_require( array( 'fuelux.css' ) )}
  <div class="content-view-children fuelux panel">    
    <ul class="tree tree-folder-select" role="tree" id="tree-{$parent_node.node_id}"  style="border:none">
      <li class="tree-branch tree-open" data-template="treebranch" role="treeitem" aria-expanded="true" id="item-{$node.contentobject_id}">
        {foreach $children as $child }
          {node_view_gui view=tree recursion=0 content_node=$child}	  
        {/foreach}
      </li>
    </ul>    
  </div>
{/if}
{*
<div class="fuelux">
<ul class="tree tree-folder-select" role="tree" id="myTree">
  <li class="tree-branch hide" data-template="treebranch" role="treeitem" aria-expanded="false">
    <div class="tree-branch-header">      
      <button class="tree-branch-name">
        <span class="glyphicon icon-folder glyphicon-folder-close"></span>
        <span class="tree-label"></span>
      </button>
    </div>
    <ul class="tree-branch-children" role="group"></ul>
    <div class="tree-loader" role="alert">Loading...</div>
  </li>
  <li class="tree-item hide" data-template="treeitem" role="treeitem">
    <button class="tree-item-name">
      <span class="glyphicon icon-item fueluxicon-bullet"></span>
      <span class="tree-label"></span>
    </button>
  </li>
</ul>
</div>

{ezscript_require( array( 'fuelux.js' ) )}
{ezcss_require( array( 'fuelux.css' ) )}
<script>
{literal}
  $('#myTree').tree({
    dataSource: function (options, callback) {
      console.log(options);
      callback({
        data: [
          {
            name: 'Ascending and Descending',
            type: 'folder',
            dataAttributes: {
              id: 'folder1'
            }
          }            
        ]
      });
    },
    multiSelect: true,
    cacheItems: true,
    folderSelect: false,
  });
{/literal}  
</script>

*}