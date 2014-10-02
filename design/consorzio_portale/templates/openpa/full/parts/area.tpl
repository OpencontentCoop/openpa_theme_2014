{if count( $openpa.content_ruoli_comune.ruoli.struttura )}
<div class="widget">
	<div class="widget_title">    
    {if $node.node_id|eq($openpa.control_menu.side_menu.root_node.node_id)}
      <h3>Riferimenti</h3>
    {else}
      <h3>{node_view_gui content_node=$openpa.control_menu.side_menu.root_node view=text_linked}</h3>
      <small>Riferimenti</small>
    {/if}
	</div>
	<div class="widget_content">
    {def $exclude_users_filter = array()}
	  
    {foreach $openpa.content_ruoli_comune.ruoli.struttura as $ruolo}
		{if $ruolo.name|eq("Responsabile")}
        <h3>Responsabile</h3>        
			  {foreach $ruolo.data_map.utente.content.relation_list as $user}
          {content_view_gui
            view=dipendente_struttura
            content_object=fetch( content, object, hash( object_id, $user.contentobject_id ) )
            struttura=fetch( content, object, hash( object_id, $ruolo.data_map.struttura_di_riferimento.content.relation_list[0].contentobject_id ) )
            hide_link_struttura=cond( $ruolo.data_map.struttura_di_riferimento.content.relation_list[0].contentobject_id|eq($node.contentobject_id), true(), false() )}
          {set $exclude_users_filter = $exclude_users_filter|append( concat( '-meta_id_si:', $user.contentobject_id ) )}
        {/foreach}
			{/if}
	  {/foreach}
    
    {def $staff = fetch( ezfind, search, hash( subtree_array, array( $node.node_id ), class_id, array( 'dipendente' ), filter, cond( count($exclude_users_filter)|gt(0), $exclude_users_filter, null() ), sort_by, hash( 'extra_priority_si', desc ) ) )}
    {if $staff['SearchCount']|gt(0)}
      <h3>Staff</h3>      
      {foreach $staff['SearchResult']  as $item}
        {content_view_gui view=dipendente_ruoli content_object=$item.object}
        {delimiter}<br />{/delimiter}
      {/foreach}
    {/if}
    
    {undef $exclude_users_filter $staff}
	</div>
</div>
{/if}

{if count( $openpa.contacts.data )|gt(0)}
<div class="widget">
	<div class="widget_title">
	  <h3>Contatti</h3>
	</div>
	<div class="widget_content">
	  {include uri="design:parts/contacts.tpl" data=$openpa.contacts.data}
	</div>
</div>
{/if}

{def $news = fetch( ezfind, search, hash( subtree_array, array( $node.node_id ), class_id, array( 'avviso' ), limit, 3, sort_by, hash( published, desc ) ) )}
{if $news['SearchCount']|gt(0)}
<div class="widget">
  <div class="widget_title">
	<h3>Ultime notizie</h3>
  </div>
  <div class="widget_content">
    <ul class="list-unstyled">
    {foreach $news['SearchResult']  as $item}
    <li class="media">
      {if $item|has_attribute( 'image' )}
        <a class="pull-left" href="{$item.url_alias|ezurl(no)}">
          {attribute_view_gui attribute=$item|attribute('image') image_class=squaremini css_class=false() image_css_class="m_left_20 d_inline_middle"}
        </a>        
      {/if}
      <div class="media-body">
        <small>{$item.object.published||l10n(date)}</small>
        {node_view_gui content_node=$item view=text_linked}
      </div>
    </li>
    {/foreach}
    </ul>
  </div>
</div>
{/if}
{undef $news}