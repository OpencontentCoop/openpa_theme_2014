{def $children_count = $node.children_count}
<p>
    <span class="glyphicon icon-folder glyphicon-{if $children_count|gt(0)}folder-open{else}file{/if}"></span> 
    <span class="tree-label" id="item-{$node.contentobject_id}-label">
      {if $children_count|gt(0)}
        {if $node.can_edit}
        <strong>{node_view_gui view=text_linked content_node=$node}</strong>        
        {else}
        <strong>{$node.name|wash()}</strong>
        {/if}
      {else}
        {if $node.can_edit}
          {node_view_gui view=text_linked content_node=$node}
        {else}
          {if $node|has_attribute( 'file' )}
            {$node.name|wash()}
          {else}
            {node_view_gui view=text_linked content_node=$node}
          {/if}        
        {/if}        
        {if $node|has_attribute( 'file' )}
          <div class="well well-sm">
            {attribute_view_gui attribute=$node|attribute( 'file' )}
          </div>
        {/if}
      {/if}
    </span>  
</p>
{if $children_count|gt(0)}
<ul role="group" class="tree-branch-children">
{foreach $node.children as $item}  
    <li class="tree-branch tree-open" data-template="treebranch" role="treeitem" aria-expanded="true" aria-labelledby="item-{$node.contentobject_id}-label" id="item-{$item.contentobject_id}">
      {node_view_gui view=tree recursion=$recursion|inc() content_node=$item}	 
    </li> 
{/foreach}
</ul>
{/if}
{undef $children_count}