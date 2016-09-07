{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, is_set( $tree_menu.children ), count( $tree_menu.children )|gt(0) )}

<div class="content-view-full class-{$node.class_identifier} row">

    <div class="content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h1>{$node.name|wash()}</h1>
    </div>

    {if $show_left}
      {include uri='design:openpa/full/parts/section_left.tpl'}
    {/if}

    <div class="content-main{if and( $openpa.control_menu.show_extra_menu|not(), $show_left|not() )} wide{elseif and( $show_left, $openpa.control_menu.show_extra_menu )} full-stack{/if}">

        {include uri=$openpa.content_main.template}

        {include uri=$openpa.content_contacts.template}

        {include uri=$openpa.content_detail.template}

        {if $node|find_first_parent( 'pagina_trasparenza' )}
          {include uri='design:openpa/full/parts/amministrazione_trasparente/children_table.tpl' nodes=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,'sort_by', $node.sort_array, 'load_data_map', false() ) ) nodes_count=fetch_alias( 'children_count', hash( 'parent_node_id', $node.node_id ) ) class=''}
        {elseif and( is_set( $openpa.content_albotelematico ), $openpa.content_albotelematico.is_container )}
          {include uri=$openpa.content_albotelematico.container_template}
        {else}
            {node_view_gui content_node=$node view=children view_parameters=$view_parameters}
        {/if}

        {include name=reverse_related_objects_specific_class_and_attribute
                node=$node
                classe='pagina_sito'
                attrib='riferimento'
                title="Riferimenti:"
                uri='design:parts/reverse_related_objects_specific_class_and_attribute.tpl'}


    </div>
    
    {if $openpa.control_menu.show_extra_menu}
      {include uri='design:openpa/full/parts/section_right.tpl'}
    {/if}


</div>
