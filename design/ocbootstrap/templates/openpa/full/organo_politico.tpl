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

        <div class="content-view-children">        
        {if $node.name|downcase()|contains('sindaco')}
          {foreach $node|attribute( 'membri' ).content.relation_list as $relation_item}
            {if is_set($relation_item.node_id)}
              {node_view_gui view=line content_node=fetch(content,node,hash(node_id,$relation_item.node_id)) image_class='small'}
            {/if}
          {/foreach}
        {else}
          {def $attributi_politici = array( 'presidente', 'vicepresidente', 'membri', 'segretario')}        
          {foreach $attributi_politici as $identifier}
            {if $node|has_attribute( $identifier )}
              <h2>{$node|attribute( $identifier ).contentclass_attribute.name|wash()}</h2>
              {foreach $node|attribute( $identifier ).content.relation_list as $relation_item}
                {if is_set($relation_item.node_id)}
                  {node_view_gui view=line content_node=fetch(content,node,hash(node_id,$relation_item.node_id)) image_class='small'}
                {/if}
              {/foreach}
            {/if}
          {/foreach}
        {/if}
        </div>
        
        {if or( $openpa.content_attachment.has_content, $openpa.content_attachment.children_count )}
          <h2>Allegati</h2>
          {include uri=$openpa.content_attachment.template}
        {/if}

        {include uri=$openpa.content_infocollection.template}
        
        {*include uri=$openpa.control_children.template*}
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