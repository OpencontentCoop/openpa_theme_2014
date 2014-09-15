{if $node.class_identifier|eq('link')}
  <a href={$node.data_map.location.content|ezurl()} title="{$node.name|wash()}">{$$node.name|wash()}</a>
{else}
  <a href={$node.url_alias|ezurl()}>{$node.name}</a>
{/if}