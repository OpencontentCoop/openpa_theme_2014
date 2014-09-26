<div class="nav-section">

        {def $tree_menu = tree_menu( hash(
            'root_node_id', $openpa.control_menu.side_menu.root_node.node_id,
            'user_hash', $openpa.control_menu.side_menu.user_hash,
            'scope', 'side_menu'
        ))}

        <div class="widget">
            {if $node.node_id|ne($openpa.control_menu.side_menu.root_node.node_id)}
            <div class="widget_title">
                <h3>{$openpa.control_menu.side_menu.root_node.name|wash()}</h3>
            </div>
            {/if}
            <div class="widget_content">
                <ul class="side_menu">
                    {foreach $tree_menu.children as $menu_item}
                        {include name=side_menu uri='design:menu/side_menu_item.tpl' menu_item=$menu_item current_node=$node}
                    {/foreach}
               </ul>
            </div>
        </div>

        {if count( $openpa.content_ruoli_comune.struttura )}
          <div class="widget">
            <div class="widget_title">
              <h3>Riferimenti</h3>
            </div>
            <div class="widget_content">
            </div>
          </div>
        {/if}

</div>