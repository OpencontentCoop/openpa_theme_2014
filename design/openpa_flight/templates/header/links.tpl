<div class="header-top-right">
  <ul>
  {if is_area_tematica()}
    {def $area_tematica_links = fetch( 'content', 'related_objects', hash( 'object_id', is_area_tematica().contentobject_id, 'attribute_identifier', 'area_tematica/link' ))}
    {if $area_tematica_links|count()}
      {foreach $area_tematica_links as $link}
        <li>{node_view_gui content_node=$link view="text_linked"}</li>
      {/foreach}
    {/if}
  {else}
    {foreach $pagedata.header.links as $link}
      <li>{node_view_gui content_node=$link view="text_linked"}</li>
    {/foreach}
  {/if}
  {if is_set( $pagedata.contacts.telefono )}
    <li><a href="tel:{$pagedata.contacts.telefono}"><i class="fa fa-phone-square"></i> {$pagedata.contacts.telefono}</a></li>
  {/if}
  
  {if is_set( $pagedata.contacts.email )}
    <li><a href="mailto:{$pagedata.contacts.email}"><i class="fa fa-envelope-o"></i> {$pagedata.contacts.email}</a></li>
  {/if}

  {*<li><a href="javascript:window.print()" title="Stampa la pagina corrente">Versione stampabile</a></li>*}

  </ul>
</div>