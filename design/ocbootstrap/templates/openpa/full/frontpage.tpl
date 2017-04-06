{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $side_menu_root_node = $openpa.control_menu.side_menu.root_node
     $show_left = false()}

{if $side_menu_root_node}
  {def $tree_menu = tree_menu( hash( 'root_node_id', $side_menu_root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))}
  {set $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}
{/if}
<div class="content-view-full class-{$node.class_identifier} row">

    
    {if $show_left}
      <div class="content-title">
          {include uri='design:openpa/full/parts/node_languages.tpl'}
          <h1>{$node.name|wash()}</h1>
      </div>
    
      {include uri='design:openpa/full/parts/section_left.tpl'}
    {/if}

    <div class="content-main{if $show_left|not()} wide{/if}">

      {if $node.data_map.page.has_content}
        {attribute_view_gui attribute=$node.data_map.page}
      {else}
        {node_view_gui content_node=$node view=children view_parameters=$view_parameters}
      {/if}

    </div>

</div>
