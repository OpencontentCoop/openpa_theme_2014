{set_defaults( hash('show_title', true()) )}
{def $valid_node = $block.valid_nodes[0]
     $show_link = true()}

{if and( $valid_node|not(), is_set( $block.custom_attributes.source ) )}
    {set $valid_node = fetch( content, node, hash( node_id, $block.custom_attributes.source ) )}
{/if}

{if $valid_node|not()}
    {set $valid_node = fetch( content, node, hash( node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
         $show_link = false()}
{/if}

{def $calendarDataDay = fetch( openpa, calendario_eventi, hash( 'calendar', $valid_node, 'params', hash( 'interval', 'PT1439M' ) ) )}
{if is_set( $block.custom_attributes )}
    {def $calendarDataOther = fetch( openpa, calendario_eventi, hash( 'calendar', $valid_node, 'params', $block.custom_attributes ) )}
{else}
    {def $calendarDataOther = false()}
{/if}
{*debug-log var=$calendarDataDay.fetch_parameters msg='Blocco eventi fetch oggi'*}

{def $day_events = $calendarDataDay.events
     $day_events_count = $calendarDataDay.search_count
     $prossimi = array()
     $prossimi_count = 0}

{if $calendarDataOther}
    {*debug-log var=$calendarDataOther.fetch_parameters msg='Blocco eventi fetch secondo tab'*}
    {set $prossimi = $calendarDataOther.events
         $prossimi_count = $calendarDataOther.search_count}
{/if}

{if and( $prossimi_count|eq(0), $day_events_count|eq(0) )}

    {editor_warning( "Nessun evento in programma" )}

{else}

{if $show_title}
<div class="widget {$block.view}">

    <div class="widget_title">
        <h3>{$block.name|wash()}</h3>
    </div>
    <div class="widget_content">
{/if}

        {if $prossimi_count|gt(0)}
        <ul class="nav nav-tabs" role="tablist">

            {if $day_events_count|ne(0)}
                <li class="active eventi-oggi">
                    <a href="#oggi">
                        Oggi
                    </a>
                </li>
            {/if}

            {if $prossimi_count|gt(0)}
                <li class="{if $day_events_count|eq(0)}active{/if} eventi-{$block.custom_attributes.tab_title|slugize}">
                    <a href="#{$block.custom_attributes.tab_title|slugize}">
                        {$block.custom_attributes.tab_title}
                    </a>
                </li>
            {/if}

        </ul>

        <div class="tab-content">
        {/if}

            {if $day_events_count|ne(0)}
                <div class="tab-pane active" id="oggi">
                    <ul class="list-unstyled">
                        {foreach $day_events as $index => $child}
                            <li>{node_view_gui content_node=$child.node view=line}</li>
                        {/foreach}
                    </ul>
                </div>
            {/if}

        {if $prossimi_count|gt(0)}
                <div id="{$block.custom_attributes.tab_title|slugize}" class="tab-pane {if $day_events_count|eq(0)}active{/if} no-js-hide">
                    <ul class="list-unstyled">
                        {foreach $prossimi as $index => $child}
                            <li>{node_view_gui content_node=$child.node view=line}</li>
                        {/foreach}
                    </ul>
                </div>


        </div>

        {/if}
{if $show_title}
    </div>
</div>
{/if}

{/if}
    
