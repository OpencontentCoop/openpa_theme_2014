<nav role="navigation">
    {if is_area_tematica()}

        {include uri=concat('design:menu/area_tematica_top.tpl')}

    {else}

        <ul class="horizontal_list main_menu clearfix">
            {def $top_menu_node_ids = openpaini( 'TopMenu', 'NodiCustomMenu', array() )}
            {if openpaini( 'TopMenu', 'NodiCustomMenu', false() )|not()}
                {def $root_node=fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node) )
                     $top_menu_items=fetch( 'content', 'list', hash( 'parent_node_id', $pagedata.root_node,
                                            'sort_by', $root_node.sort_array,
                                            'class_filter_type', 'include',
                                            'load_data_map', false(),
                                            'class_filter_array', openpaini( 'TopMenu', 'IdentificatoriMenu' ),
                                            'limit', openpaini( 'TopMenu', 'LimitePrimoLivello', 4 ) ) )}
                {foreach $top_menu_items as $node}
                    {set $top_menu_node_ids = $top_menu_node_ids|append( $node.node_id )}
                {/foreach}
            {/if}

            <li class="menu-item firstli {if $current_node_id|eq(ezini( 'NodeSettings', 'RootNode', 'content.ini' ))}current{/if}">
                <a title="Link a homepage" href={'/'|ezurl()}><b>Home</b></a>
            </li>

            {def $top_menu_node_ids_count = $top_menu_node_ids|count()
                 $position = array()}

            {if $top_menu_node_ids_count}
                {foreach $top_menu_node_ids as $key => $id}
                    {set $position = array()}
                    {if $key|eq(0)}
                        {set $position = $position|append( "firstli" )}
                    {/if}
                    {if $top_menu_node_ids_count|eq( $key|inc )}
                        {set $position = $position|append( "lastli" )}
                    {/if}

                    {include uri='design:menu/cached/topmenu.tpl' root_node_id=$id position=$position}
                    {*top_menu_cached( hash( 'root_node_id', $id, 'position', $position ) )*}

                {/foreach}
            {/if}

            {include uri=concat('design:menu/topmenu_extra_item.tpl')}

        </ul>

    {/if}
</nav>