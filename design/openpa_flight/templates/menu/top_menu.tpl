<div class="main-nav" role="navigation">
    {if is_area_tematica()}

        {include uri=concat('design:menu/area_tematica_top.tpl')}

    {else}
        <ul class="horizontal_list main_menu clearfix">
            {def $top_menu_node_ids = openpaini( 'TopMenu', 'NodiCustomMenu', array() )}
            {def $top_menu_node_ids_count = $top_menu_node_ids|count()}
            {if $top_menu_node_ids_count}
                {foreach $top_menu_node_ids as $id}
                    {def $tree_menu = tree_menu( hash( 'root_node_id', $id, 'scope', 'top_menu'))}
                    <li class="menu-item">
                        {include name=top_menu uri='design:menu/top_menu_item.tpl' menu_item=$tree_menu bold=true()}
                        {if $tree_menu.has_children}
                            {if $tree_menu.max_recursion|eq(1)}
                                <div class="sub_menu_wrap">
                                    <ul class="sub_menu">{foreach $tree_menu.children as $child}
                                            <li>{include name="top_sub_menu" uri='design:menu/top_menu_item.tpl' menu_item=$child}</li>{/foreach}
                                    </ul>
                                </div>
                            {else}
                                <div class="sub_menu_wrap items-{count($tree_menu.children)}">
                                    {foreach $tree_menu.children as $child}
                                        <div class="sub_menu-item">{include name="top_sub_menu" uri='design:menu/top_menu_item.tpl' menu_item=$child bold=true()}
                                            {if $child.has_children}
                                                <ul class="sub_menu">{foreach $child.children as $sub_child}
                                                <li>{include name="top_sub_menu" uri='design:menu/top_menu_item.tpl' menu_item=$sub_child}</li>{/foreach}
                                                </ul>{/if}
                                        </div>
                                    {/foreach}
                                </div>
                            {/if}
                        {/if}
                    </li>
                    {undef $tree_menu}
                {/foreach}
            {/if}
        </ul>
    {/if}
</div>