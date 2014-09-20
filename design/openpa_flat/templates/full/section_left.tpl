<div class="nav-section">

        {def $tree_menu = tree_menu( hash(
            'root_node_id', $openpa.control_menu.side_menu_root_node.node_id,
            'user_hash', $openpa.control_menu.side_menu_user_hash,
            'scope', 'side_menu'
        ))}

        <div class="widget shadow r_corners wrapper m_bottom_30">
            <div class="widget_content">
                <ul class="side_menu">
                    {foreach $tree_menu.children as $menu_item}
                        {include uri='design:menu/side_menu_item.tpl' menu_item=$menu_item}
                    {/foreach}
               </ul>
            </div>
        </div>

</div>