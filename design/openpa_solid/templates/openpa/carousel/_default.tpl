{if $node.data_map.image.content[$image_class]}
    {def $bg_url = $node.data_map.image.content[$image_class].url|ezroot(no)}
{else}
    {def $bg_url = 'placeholder.png'|ezimage(no)}
{/if}

<div class="relative">
<div class="carousel-image" style="background-image:url({$bg_url});"></div>
<div class="carousel-caption">
    <h3>	
      <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>	
    </h3>
    <p>{$node|abstract()|oc_shorten(400)}</p>
</div>
</div>
