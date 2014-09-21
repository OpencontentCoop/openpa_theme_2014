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
        {include uri='design:openpa/full/parts/section_left.tpl'}
    {/if}

    <div class="content-main{if $openpa.control_menu.show_side_menu|not()} wide{/if}">

        {include uri=$openpa.content_main.template}

        {if $node|has_attribute( 'page' )}
            {def $zones = $node|attribute( 'page' ).content.zones
                 $unique_zone = $zones[0]}

        <div class="widget_tabs">
            <ul class="nav nav-tabs" role="tablist">
            {foreach $unique_zone.blocks as $index => $block}
                <li{if $index|eq(0)} class="active"{/if}><a href="#{$block.name|slugize()}" role="tab" data-toggle="tab">{$block.name|wash()}</a></li>
            {/foreach}
            </ul>

            <div class="tab-content">
            {foreach $unique_zone.blocks as $index => $block}
                <div class="tab-pane{if $index|eq(0)} active{/if}" id="{$block.name|slugize()}">
                    {block_view_gui block=$block show_title=false()}
                </div>
            {/foreach}
        </div>
        {undef $zones $unique_zone}
        {/if}

        {if $openpa.content_date.show_date}
            <p class="pull-right">{include uri=$openpa.content_date.template}</p>
        {/if}

    </div>


</div>
