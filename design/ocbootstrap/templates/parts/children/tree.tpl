{set_defaults( hash(  
  'view', 'line',
  'delimiter', '',
  'exclude_classes', openpaini( 'ExcludedClassesAsChild', 'FromFolder', array( 'image', 'infobox', 'global_layout' ) ),
  'include_classes', array(),
  'type', 'exclude'
))}

{if $type|eq( 'exclude' )}
  {def $params = hash( 'class_filter_type', 'exclude', 'class_filter_array', $exclude_classes )}
{else}
  {def $params = hash( 'class_filter_type', 'include', 'class_filter_array', $include_classes )}
{/if}

{def $children_count = fetch( openpa, 'list_count', hash( 'parent_node_id', $node.node_id )|merge( $params ) )
     $children = fetch( openpa, 'list', hash( 'parent_node_id', $node.node_id,'sort_by', $node.sort_array )|merge( $params ) ) }

{ezcss_require( array( 'fuelux.css' ) )}
<div class="content-view-children fuelux panel">    
  <ul class="tree tree-folder-select" role="tree" style="border:none">    
      {foreach $children as $child }
        {def $child_children_count = $child.children_count}
        <li class="tree-branch" data-template="treebranch" role="treeitem" aria-expanded="true" data-nodeid="{$child.node_id}">          
          <i class="fa fa-{if $children_count|eq(0)}file{else}folder{/if}"></i> 
          {node_view_gui view=text_linked content_node=$child}
        </li>  
        {undef $child_children_count}
      {/foreach} 
  </ul>    
</div>

{ezscript_require(array('ezjsc::jquery','ezjsc::jqueryio'))}
{literal}
<script>
  $(document).ready(function(){
    $(document).on('click','.tree-branch a',function(e){                  
      var container = $(this).parent();      
      var icon = container.find('i');      
      if (icon.hasClass('fa-folder')) {
        var children = container.find('ul.tree-branch-children');        
        icon.toggleClass('fa-folder-open');
        children.toggle();        
        if (children.length == 0){            
          var tree = $('<ul role="group" class="tree-branch-children"></ul>');
          icon.addClass('fa-spinner').addClass('fa-spin');
          $.get('/openpa/data/tree?parent='+container.data('nodeid'), function(response){
            $.each(response, function(){
              var item = $('<li class="tree-branch" data-template="treebranch" role="treeitem" aria-expanded="true" data-nodeid="'+this.main_node_id+'" />');
              if (parseInt( this.children_count ) > 0) {
                item.append('<i class="fa fa-folder" />');
              }else{
                item.append('<i class="fa fa-file" />');
              }
              
              if (this.data_map.file && this.data_map.file.content != '') {
                var filenameParts = this.data_map.file.content.split('|');
                var filename = filenameParts[1];
                item.append('<a title="Scarica il file" href="/content/download/'+this.contentobject_id+'/'+this.data_map.file.id+'/file/'+filename+'"><span title="'+filename+'"> '+this.name+' <i class="fa fa-download"></i></span></a>');
              }else{
                item.append('<a href="/'+this.url_alias+'"> '+this.name+'</a>');
              }
              tree.append(item);
              icon.removeClass('fa-spinner').removeClass('fa-spin');
            });
            container.append(tree);
          });
        }
        e.preventDefault();
      }
    });
  });
</script>
{/literal}