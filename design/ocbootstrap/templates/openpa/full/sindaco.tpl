{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{if $openpa.control_menu.side_menu.root_node}
    {def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
         $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}
{else}
    {def $show_left = false()}
{/if}

{def $show_extra_menu = $node.data_map.sindaco.has_content}

<div class="content-view-full class-{$node.class_identifier} row">

    <div class="content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h1>{$node.name|wash()}</h1>
    </div>

    {if $show_left}
        {include uri='design:openpa/full/parts/section_left.tpl'}
    {/if}

    <div class="content-main{if and( $show_extra_menu|not(), $show_left|not() )} wide{elseif and( $show_left, $show_extra_menu )} full-stack{/if}">

        {include uri=$openpa.content_main.template}

        {include uri=$openpa.content_detail.template}

        {include uri=$openpa.content_infocollection.template}

        {include uri=$openpa.control_children.template}

    </div>


    {if $show_extra_menu}
    <div class="content-related">
        <div class="panels-container">
            {node_view_gui content_node=$node.data_map.sindaco.content.main_node view=panel}
        </div>
    </div>
    {/if}


</div>


{if $openpa.content_date.show_date}
    <div class="row">
        <div class="col-md-12">
            <p class="pull-right">{include uri=$openpa.content_date.template}</p>
        </div>
    </div>
{/if}