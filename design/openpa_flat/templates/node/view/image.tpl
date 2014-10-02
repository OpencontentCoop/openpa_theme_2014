{if $node.data_map.image.content[$image_class]}
<div class="relative">
    {def $image = $node.data_map.image.content[$image_class]}
    <img src={$image.url|ezroot} width="{$image.width}" height="{$image.height}" alt="{$node.name|wash}" class="img-responsive"/>
    {undef $image}
</div>
{/if}
