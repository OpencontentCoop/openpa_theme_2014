{if array('event', 'iniziativa', 'luogo', 'associazione')|contains($node.class_identifier)}

{def $event_data_map = fetch('content', 'class', hash( 'class_id', 'event' )).data_map
     $iniziativa = false()
     $associazione = cond(and($node.class_identifier|eq('associazione'), is_set($event_data_map['associazione'])), true(), false())
     $luogo = cond(and($node.class_identifier|eq('luogo'), is_set($event_data_map['servizio_sul_territorio'])), true(), false())
     $root = fetch( content, node, hash( node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )}

{if and( is_set($node.data_map.iniziativa), $node.data_map.iniziativa.has_content )}
  {set $iniziativa = fetch( 'content', 'node', hash( 'node_id', $node.data_map.iniziativa.content.relation_list[0].node_id ) )}
  {def $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $node.parent, 'params', hash( 'interval', 'P6M',
                                                                                                         'filter', array( concat( '-meta_id_si:', $node.contentobject_id ) ),
                                                                                                         'Manifestazione', concat( $iniziativa.name ) )|merge( $view_parameters ) ) )}
{elseif $associazione}
    {def $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $root, 'params', hash( 'interval', 'P6M',
                                                                                                    'filter', array(
                                                                                                        concat( '-meta_id_si:', $node.contentobject_id ),
                                                                                                        concat( solr_meta_subfield('associazione','id'), ':', $node.contentobject_id )
                                                                                                    ) )|merge( $view_parameters ) ) )}
{elseif $luogo}
    {def $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $root, 'params', hash( 'interval', 'P6M',
                                                                                                    'filter', array(
                                                                                                        concat( '-meta_id_si:', $node.contentobject_id ),
                                                                                                        concat( solr_meta_subfield('servizio_sul_territorio','id'), ':', $node.contentobject_id )
                                                                                                    ) )|merge( $view_parameters ) ) )}
{else}
  {def $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $root, 'params', hash( 'interval', 'P6M',
                                                                                                  'filter', array( concat( '-meta_id_si:', $node.contentobject_id ) ),
                                                                                                  'Manifestazione', concat( $node.name ) )|merge( $view_parameters ) ) )}
{/if}
{*debug-log var=$calendarData msg='object contents'*}
{if $calendarData.search_count|gt(0)}


  {if and( $iniziativa, $iniziativa.contentobject_id|ne( $node.contentobject_id ) )}
    <p>Questo evento fa parte della manifestazione <a href="{$iniziativa.url_alias|ezurl(no)}" title="Vedi il dettaglio di {$iniziativa.name|wash()}">{$iniziativa.name|wash()}</a></p>
    <h3>{$iniziativa.name|wash()}: i prossimi appuntamenti</h3>
  {else}
    <h2>I prossimi appuntamenti in programma</h2>
  {/if}


  {foreach $calendarData.day_by_day as $calendarDay}
    {if $calendarDay.count|gt(0)}
      <div class="calendar-day-program float-break row events" id="day-{$calendarDay.identifier}">

          <div class="calendar-date col-xs-4 col-sm-3 col-md-2"{if $calendarDay.is_today} id="today"{/if}>
            <span class="month">{$calendarDay.start|datetime( 'custom', '%M' )}</span>
            <span class="day">{$calendarDay.start|datetime( 'custom', '%j' )}</span>
          </div>

          <div class="calendar-date col-xs-8 col-sm-9 col-md-10">
            <div class="row panels-container">
              {foreach $calendarDay.events as $event}
                <div class="col-md-6">
                  {node_view_gui view=panel content_node=$event.node image_class=small is_program=true()}
                </div>
                {delimiter modulo=2}</div><div class="row panels-container">{/delimiter}
              {/foreach}
            </div>
        </div>
      </div>
    {/if}
  {/foreach}

{elseif and( $iniziativa, $iniziativa.contentobject_id|ne( $node.contentobject_id ) )}
  <p>Questo evento fa parte della manifestazione <a href={$iniziativa.url_alias|ezurl()} title="Vedi il dettaglio di {$iniziativa.name|wash()}">{$iniziativa.name|wash()}</a></p>
{/if}
{undef $iniziativa $associazione $luogo}
{/if}