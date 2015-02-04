<div class="relative">
{if $node.data_map.image.content[$image_class]}
    {def $image = $node.data_map.image.content[$image_class]}
    <img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" alt="{$node.name|wash}" class="img-responsive mw_mxs_none mw_xs_none"/>
    {undef $image}
{else}
  <img src={'placeholder.png'|ezimage} width="1200" height="800" alt="{$node.name|wash}" class="img-responsive mw_mxs_none mw_xs_none"/>    
{/if}


<div class="carousel-caption">
    <h3>
      {def $openpa=$node|object_handler()}
      <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>	
    </h3>
    {if $node|has_attribute('subtitle')}
      <p>{$node|attribute('subtitle').content|wash()|oc_shorten(400)}</p>
    {/if}
</div>
</div>
