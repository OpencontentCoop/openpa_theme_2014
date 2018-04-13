{def $openpa = object_handler($node)}
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
        <h1>{$node.name|wash()}</h1>
    </div>

    {if $show_left}
        {include uri='design:openpa/full/parts/section_left.tpl'}
    {/if}

    <div class="content-main{if and( $openpa.control_menu.show_extra_menu|not(), $show_left|not() )} wide{elseif and( $show_left, $openpa.control_menu.show_extra_menu )} full-stack{/if}">

        {include uri=$openpa.content_main.template}

        {if $openpa.content_detail.has_content}
            <div class="content-detail">
                {foreach $openpa.content_detail.attributes as $openpa_attribute}
                    {if $openpa_attribute.identifier|begins_with( 'resource' )}
                        {skip}
                    {/if}
                    <div class="row">
                        {if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label|not() )}
                            <div class="col-md-3">
                                <strong>{$openpa_attribute.label}</strong>
                            </div>
                        {/if}
                        <div class="col-md-{if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label|not() )}9{else}12{/if}">
                            {if and( $openpa_attribute.full.show_label, $openpa_attribute.full.collapse_label )}
                                <strong>{$openpa_attribute.label}</strong>
                            {/if}
                            {attribute_view_gui attribute=$openpa_attribute.contentobject_attribute href=cond($openpa_attribute.full.show_link|not, 'no-link', '')}
                        </div>
                    </div>
                {/foreach}
            </div>
        {/if}
    
        {* ATTRIBUTI BASE: mostra i contenuti del nodo *}
        {include name = attributi_base
                 uri = 'design:parts/opendata_resources.tpl'
                 node = $node}

        {include uri=$openpa.content_infocollection.template}

        {include uri=$openpa.control_children.template}

    </div>

    {if $openpa.control_menu.show_extra_menu}
      {include uri='design:openpa/full/parts/section_right.tpl'}
    {/if}

</div>


{if $openpa.content_date.show_date}
  <div class="row"><div class="col-md-12">
    <p class="pull-right">{include uri=$openpa.content_date.template}</p>
  </div></div>
{/if}


{ezpagedata_set('current_main_style', $openpa.content_pagestyle.main_style)}

{def $homepage = fetch('openpa', 'homepage')}

{if $homepage.node_id|eq($node.node_id)}
    {ezpagedata_set('is_homepage', true())}
{/if}
{if $openpa.control_area_tematica.is_area_tematica}
    {ezpagedata_set('is_area_tematica', $openpa.control_area_tematica.area_tematica.contentobject_id)}
{/if}

{ezpagedata_set('current_main_style', $openpa.content_pagestyle.main_style)}

<div id="valuation-container">
    <div class="container">
        <div class="row">
            <div class="col-xs-12">
                {include name=valuation node_id=$node.node_id uri='design:openpa/valuation.tpl'}
            </div>
        </div>
    </div>
</div>

{include uri='design:parts/load_website_toolbar.tpl' current_user=fetch(user, current_user)}