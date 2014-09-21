{def $openpa = object_handler($node)}
<a href="{$openpa.content_link.full_link}">
    {if is_set( $text )}
        {$text|wash()}
    {else}
        {$node.name|wash()}
    {/if}
</a>