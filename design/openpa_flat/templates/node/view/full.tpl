{def $openpa = object_handler($node)}

{if $openpa.control_cache.no_cache}
{set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

<div class="content-view-full class-{$node.class_identifier} row">

    <div class="content-title">

        <h1>
            {$node.name|wash()}
        </h1>

    </div>

    {if $openpa.control_menu.show_side_menu}
        {include uri='design:full/section_left.tpl'}
    {/if}

    <div class="content-main{if $openpa.control_menu.show_side_menu|not()} wide{/if}">

        {include uri=$openpa.content_main.template}

        {include uri=$openpa.content_detail.template}

        {if $openpa.content_date.show_date}
            <p class="pull-right">{include uri=$openpa.content_date.template}</p>
        {/if}

    </div>


</div>
