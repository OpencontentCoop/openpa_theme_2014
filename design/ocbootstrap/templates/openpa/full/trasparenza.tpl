{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}


<div class="content-view-full class-{$node.class_identifier} row">

    <div class="content-title">
        <h1>{$node.name|wash()}</h1>        
    </div>

    {if $show_left}
        {include uri='design:openpa/full/parts/section_left.tpl'}
    {/if}

    <div class="content-main{if and( $openpa.control_menu.show_extra_menu|not(), $show_left|not() )} wide{elseif and( $show_left, $openpa.control_menu.show_extra_menu )} full-stack{/if}">

        {include uri=$openpa.content_main.template}

        {include uri=$openpa.content_detail.template}

        {def $nota = fetch( 'content', 'list', hash( 'parent_node_id', $node.node_id,
                                                     'class_filter_type', 'include',
                                                     'class_filter_array', array( 'nota_trasparenza' ),
                                                     'sort_by', array( 'published', false() ),
                                                     'limit', 1 ) )}

        {* Nota: una sola nota *}
        {if $nota|count()|gt(0)}
            <div class="block">
                <em>{attribute_view_gui attribute=$nota[0].data_map.testo_nota}</em>
                {include uri="design:parts/toolbar/node_trash.tpl" current_node=$nota[0]}
                {include uri="design:parts/toolbar/node_edit.tpl" current_node=$nota[0]}
            </div>
        {/if}

        {include uri=$openpa.content_infocollection.template}

    </div>

    {if $openpa.control_menu.show_extra_menu}
      {include uri='design:openpa/full/parts/section_right.tpl'}
    {/if}

</div>


{if $openpa.content_date.show_date}
  <div class="row"><div class="col-md-12">
    <p class="pull-right">{include uri=$openpa.content_date.template}</p>
  </div></div>
{/if}