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

    <li class="relative f_xs_none m_xs_bottom_5">
        {include uri='design:menu/cached/topmenu_item.tpl' node=$aree_tematiche a_class="tr_delay_hover color_light tt_uppercase" b_class=" "}
        {if $aree_tematiche_level_2|count()}
            <div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
                <ul class="sub_menu">{foreach $aree_tematiche_level_2 as $key => $item2}<li>{include uri='design:menu/cached/topmenu_item.tpl' node=$item2 a_class="color_dark tr_delay_hover" b_class=false()}</li>{/foreach}</ul>
            </div>
        {/if}
    </li>

    <li class="relative f_xs_none m_xs_bottom_5 current">
        {include uri='design:menu/cached/topmenu_item.tpl' node=is_area_tematica() a_class="tr_delay_hover color_light tt_uppercase" b_class=" "}
    </li>

</ul>