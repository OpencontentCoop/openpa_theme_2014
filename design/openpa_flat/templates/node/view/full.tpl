{def $openpa = object_handler($node)}

{if $openpa.control_cache.no_cache}
{set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

<div class="content-view-full class-{$node.class_identifier} row">

    <div class="content-title">

        <h1>{$node.name|wash()}</h1>

        {if $openpa.content_date.show_date}
            {include uri=$openpa.content_date.template}
        {/if}

    </div>

    {if $openpa.control_menu.show_side_menu}
        {include uri='design:full/section_left.tpl'}
    {/if}

    <div class="content-main{if $openpa.control_menu.show_side_menu|not()} wide{/if}">




    </div>

    {* Per visualizzare l'extrainfo: aggiungi la classe "full-stack" al primo div e scommenta la seguenta inclusione *}
    {*include uri='design:parts/content-related.tpl'*}

</div>
