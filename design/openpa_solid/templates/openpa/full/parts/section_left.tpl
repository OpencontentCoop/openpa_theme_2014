<div class="nav-section">

    {if count($tree_menu.children)|gt(0)}
        <div class="widget">
            {if and( $openpa.control_menu.side_menu.root_node, $node.node_id|ne($openpa.control_menu.side_menu.root_node.node_id) )}
                <div class="widget_title">
                    <h3>{$openpa.control_menu.side_menu.root_node.name|wash()}</h3>
                    <button class="navbar-toggle" data-target="#side-menu" data-toggle="collapse" type="button"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
                </div>
            {/if}
            <div class="widget_content navbar-collapse collapse" id="side-menu">
                <ul class="side_menu">
                    {foreach $tree_menu.children as $menu_item}
                        {include name=side_menu uri='design:menu/side_menu_item.tpl' menu_item=$menu_item current_node=$node}
                    {/foreach}
                </ul>
            </div>
        </div>
    {/if}
</div>
