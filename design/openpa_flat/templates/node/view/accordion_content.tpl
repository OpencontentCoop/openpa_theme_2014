{def $item_openpa = object_handler($node)}

{include uri=$item_openpa.content_main.template openpa=$item_openpa node=$node}

<p class="link">
    <a href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">
        Vai a {$node.name|wash()}
    </a>
</p>