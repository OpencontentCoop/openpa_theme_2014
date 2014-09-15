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
</ul>