<ul class="horizontal_list main_menu clearfix">
    {def $aree_tematiche = is_area_tematica().parent}
    {def $aree_tematiche_level_2 = fetch('content', 'list', hash( 'parent_node_id', $aree_tematiche.node_id,
                                         'sort_by', $aree_tematiche.sort_array, 'limit', 20,
                                         'class_filter_type', 'include',
                                         'limitation', array(),
                                         'class_filter_array',  openpaini( 'TopMenu', 'IdentificatoriMenu', array() ) ) )
         $aree_tematiche_level_2_class = array()
         $aree_tematiche_level_2_count=0
         $current_node_in_path_2 = first_set($pagedata.path_array[2].node_id, 0  )}

    <li class="menu-item context-menu firstli">
        {include uri='design:menu/cached/topmenu_item.tpl' node=$aree_tematiche b=true()}
        {if $aree_tematiche_level_2|count()}
            <div class="sub_menu_wrap">
                <ul class="sub_menu">{foreach $aree_tematiche_level_2 as $key => $item2}<li>{include uri='design:menu/cached/topmenu_item.tpl' node=$item2}</li>{/foreach}</ul>
            </div>
        {/if}
    </li>

    <li class="menu-item lastli current">
        {include uri='design:menu/cached/topmenu_item.tpl' node=is_area_tematica()}
    </li>

</ul>