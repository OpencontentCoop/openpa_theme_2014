{* variabili attese:
    $root_node_id int
    $position array(first|last) array
*}

{def $item = fetch( 'content', 'node', hash( 'node_id', $root_node_id ) )
     $top_menu_class_filter = openpaini( 'TopMenu', 'IdentificatoriMenu', array() )
     $custom_aree = openpaini( 'TopMenu', 'NodiAreeCustomMenu', array() )
     $custom_extend = openpaini( 'TopMenu', 'NodiEstesiCustomMenu', array( '6062' ) )
     $main_styles = openpaini( 'Stili', 'Nodo_NomeStile', array() )
     $hide_children = openpaini( 'TopMenu', 'NodiSoloPrimoLivello', array() )
     $item_class = array()
     $level_2_items_count = 0
     $level_2_items = 0
     $item_class_2 = array()
     $level_3_items= array()}

{* nel cached menu vengono mostate tutte le aree tematiche anche quelle non accessibili all'anonimo *}
{def $limitations = hash( 'limitation', false() )}
{if $custom_aree|contains( $item.node_id )}
    {set $limitations = hash( 'limitation', array() )}
{/if}

{if $hide_children|contains( $item.node_id )|not()}
    {set $level_2_items = fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
                                                          'sort_by', $item.sort_array,
                                                          'limit', cond( $custom_aree|contains( $item.node_id ), 50, openpaini( 'TopMenu', 'LimiteSecondoLivello', 4 ) ),
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $top_menu_class_filter )|merge( $limitations ) )}
{/if}

{set $item_class = $item_class|merge( $position)}

{foreach $main_styles as $style}
    {set $style = $style|explode(';')}
    {if $style[0]|eq($item.node_id)}
        {set $item_class = $item_class|append( $style[1]|slugize() )}
        {break}
    {/if}
{/foreach}

<li class="menu-item{if $item_class} {$item_class|implode(" ")}{/if}">

    {include uri='design:menu/cached/topmenu_item.tpl' node=$item b=true()}

    {if $level_2_items|count()}

        {if $custom_aree|contains( $item.node_id )}

            <div class="sub_menu_wrap">
                <ul class="sub_menu">{foreach $level_2_items as $key => $item2}<li>{include uri='design:menu/cached/topmenu_item.tpl' node=$item2}</li>{/foreach}</ul>
            </div>

        {elseif $custom_extend|contains( $item.node_id )}

            <div class="sub_menu_wrap items-{count($level_2_items)}">
            {foreach $level_2_items as $key => $item2}
                <div class="sub_menu-item">
                    {include uri='design:menu/cached/topmenu_item.tpl' node=$item2 b=true() b_class="color_dark m_left_20 m_bottom_5 m_top_5 d_inline_b"}
                    {set $level_3_items = fetch( 'content', 'list', hash( 'parent_node_id', $item2.node_id,
                                                                          'sort_by', $item2.sort_array,
                                                                          'limit', openpaini( 'TopMenu', 'LimiteTerzoLivello', 10 ),
                                                                          'class_filter_type','include',
                                                                          'class_filter_array', $top_menu_class_filter ) )}
                    {if $level_3_items|count()|gt(0)}
                        <ul class="sub_menu">{foreach $level_3_items as $item3}<li>{include uri='design:menu/cached/topmenu_item.tpl' node=$item3}</li>{/foreach}</ul>
                    {/if}
                </div>
            {/foreach}
            </div>

        {else}

            <div class="sub_menu_wrap">
                <ul class="sub_menu">{foreach $level_2_items as $key => $item2}<li>{include uri='design:menu/cached/topmenu_item.tpl' node=$item2}</li>{/foreach}</ul>
            </div>

        {/if}

    {/if}
</li>

{undef}

