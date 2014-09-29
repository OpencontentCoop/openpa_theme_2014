<div class="nav-section">

    {if count($tree_menu.children)|gt(0)}
      <div class="widget">
          {if $node.node_id|ne($openpa.control_menu.side_menu.root_node.node_id)}
          <div class="widget_title">
              <h3>
				{node_view_gui content_node=$openpa.control_menu.side_menu.root_node view=text_linked}
			  </h3>
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
    {/if}

    {if count( $openpa.content_ruoli_comune.ruoli.struttura )}
      <div class="widget">
        <div class="widget_title">
          <h3>Riferimenti</h3>
        </div>
        <div class="widget_content">
          <ul class="list-unstyled">
          {foreach $openpa.content_ruoli_comune.ruoli.struttura as $ruolo}
            <li>
              {attribute_view_gui attribute=$ruolo.data_map.utente node_view=line}
            </li>
          {/foreach}
          </ul>
        </div>
      </div>
    {/if}

</div>