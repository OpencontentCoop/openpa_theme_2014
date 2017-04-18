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
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h1>{$node.name|wash()}</h1>
    </div>

    {if $show_left}
        {include uri='design:openpa/full/parts/section_left.tpl'}
    {/if}

    <div class="content-main{if and( $openpa.control_menu.show_extra_menu|not(), $show_left|not() )} wide{elseif and( $show_left, $openpa.control_menu.show_extra_menu )} full-stack{/if}">

        {include uri=$openpa.content_main.template}

        {include uri=$openpa.content_detail.template}

        {def $search_hash = hash(  'limit', 100,
                                   'class_id', array( 'politico' ),
                                   'filter', array( 'or',
                                                    concat( 'submeta_gruppo_politico___id____si:', $node.object.id ),
                                                    concat( 'submeta_gruppo_politico___id_si:', $node.object.id ) ) )
             $search = fetch( ezfind, search, $search_hash )}

        {if $search.SearchCount}
            <div class="row">
                <div class="col-md-3">
                    <strong>Componenti</strong>
                </div>
                <div class="col-md-9">
                    <ul class="list-unstyled">
                        {foreach $search.SearchResult as $child }
                            <li>{node_view_gui view=text_linked content_node=$child}</li>
                        {/foreach}
                    </ul>
                </div>
            </div>
        {/if}

        {include uri=$openpa.content_infocollection.template}

        {include uri=$openpa.control_children.template}

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