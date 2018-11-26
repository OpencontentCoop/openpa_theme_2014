{def $openpa = object_handler($node)
     $current_user = fetch(user, current_user)}
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

      {attribute_view_gui attribute=$node|attribute( 'survey' )}

    </div>

    {if $openpa.control_menu.show_extra_menu}
      {include uri='design:openpa/full/parts/section_right.tpl'}
    {/if}

</div>

{ezpagedata_set('current_main_style', $openpa.content_pagestyle.main_style)}

{def $homepage = fetch('openpa', 'homepage')}

{if $homepage.node_id|eq($node.node_id)}
    {ezpagedata_set('is_homepage', true())}
{/if}
{if $openpa.control_area_tematica.is_area_tematica}
    {ezpagedata_set('is_area_tematica', $openpa.control_area_tematica.area_tematica.contentobject_id)}
{/if}

{ezpagedata_set('current_main_style', $openpa.content_pagestyle.main_style)}

{include uri='design:parts/load_website_toolbar.tpl' current_user=fetch(user, current_user)}
