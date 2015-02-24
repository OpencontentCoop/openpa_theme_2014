{def $valid_node = cond( is_set( $block.valid_nodes[0] ), $block.valid_nodes[0], false() )
     $show_link = true()}

{if and( $valid_node|not(), is_set( $block.custom_attributes.source ) )}
    {set $valid_node = fetch( content, node, hash( node_id, $block.custom_attributes.source ) )}
{/if}

{if $valid_node|not()}
    {set $valid_node = fetch( content, node, hash( node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
         $show_link = false()}
{/if}

{def $calendarDataDay = fetch( openpa, calendario_eventi, hash( 'calendar', $valid_node, 'params', hash( 'interval', 'PT1439M' ) ) )}
{if $block.custom_attributes.tab_title|ne('')}
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

{if fetch( 'user', 'has_access_to', hash( 'module', 'openpa', 'function', 'editor_tools' ) )}
{editor_warning( "Nessun evento in programma" )}
{/if}

{else}
{*
    {ezscript_require( array( 'ezjsc::jquery', 'plugins/owl-carousel/owl.carousel.min.js', "plugins/blueimp/jquery.blueimp-gallery.min.js" ) )}
    {ezcss_require( array( 'plugins/owl-carousel/owl.carousel.css', 'plugins/owl-carousel/owl.theme.css', "plugins/blueimp/blueimp-gallery.css" ) )}
    
    <script>
        $(document).ready(function() {ldelim}
            $("#first-event-carousel, #second-event-carousel").owlCarousel({ldelim}
                items : 1,                
                autoPlay: false,
                navigation: true,
                pagination: false,
                navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
            {rdelim});
        {rdelim});        
    </script>
*}

    {if $block.name|ne('')}
    <div class="widget events {$block.view}">
        <div class="widget_title">
            
            {if $show_link}
              <a class="pull-right" href="{$valid_node.url_alias|ezurl(no)}" title="Vai al calendario"><i class="fa fa-calendar f_size_ex_large"></i></a>
            {/if}
            
            <h3>
              {$block.name|wash()}              
            </h3>
        </div>
        <div class="widget_content">


    {else}

    <div class="widget_tabs events {if $prossimi_count|gt(0)}subnav{/if} {$block.view}">

    {/if}

        {if and( $day_events_count|gt(0), $prossimi_count|gt(0) )}
        <ul class="list-inline events-tabs" role="tablist">
            {if $day_events_count|ne(0)}
                <li class="active eventi-oggi">
                    <a href="#oggi" data-toggle="tab">
                        Oggi
                    </a>
                </li>
            {/if}
            {if $prossimi_count|gt(0)}
                <li class="{if $day_events_count|eq(0)}active{/if} eventi-{$block.custom_attributes.tab_title|slugize}">
                    <a href="#{$block.custom_attributes.tab_title|slugize}" data-toggle="tab">
                        {$block.custom_attributes.tab_title}
                    </a>
                </li>
            {/if}
        </ul>
        {/if}

        <div class="tab-content">


            {if $day_events_count|ne(0)}
                <div class="tab-pane active" id="oggi">
                  <div class="event-carousel" id="first-event-carousel">
                    <div class="events">
                      {foreach $day_events as $i => $child max 10}                    
                        {include uri="design:calendar/block_list_item.tpl" item=$child}
                        {delimiter modulo=4}</div><div class="events">{/delimiter}
                      {/foreach}
                    </div>
                  </div>
                </div>
            {/if}

            {if $prossimi_count|gt(0)}
            <div id="{$block.custom_attributes.tab_title|slugize}" class="tab-pane {if $day_events_count|eq(0)}active{/if} no-js-hide event-carousel">
              <div class="event-carousel" id="second-event-carousel">
                <div class="events">
                  {foreach $prossimi as $i => $child max 10}                  
                    {include uri="design:calendar/block_list_item.tpl" item=$child}
                    {delimiter modulo=4}</div><div class="events">{/delimiter}
                  {/foreach}
                </div>
              </div>
            </div>
        {/if}


        </div>

    {if $block.name|ne('')}
    </div>
    {/if}

</div>


{/if}
