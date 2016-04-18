{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}


<div class="content-view-full class-{$node.class_identifier} row">

    <div class="content-title">
        {include uri='design:openpa/full/parts/node_languages.tpl'}
        <h1>{$node.name|wash()}</h1>
    </div>

    {if $show_left}
        {include uri='design:openpa/full/parts/section_left.tpl'}
    {/if}

    <div class="content-main{if $show_left} full-stack{/if}">

        {include uri=$openpa.content_main.template}

        {include uri=$openpa.content_detail.template}

        {include uri=$openpa.content_infocollection.template}

        {include uri=$openpa.control_children.template}
        
      {def $iniziativa = false()}
      {if and( is_set($node.data_map.iniziativa), $node.data_map.iniziativa.has_content )}        
          {set $iniziativa = fetch( 'content', 'node', hash( 'node_id', $node.data_map.iniziativa.content.relation_list[0].node_id ) )}
          {def $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $node.parent, 'params', hash( 'interval', 'P6M',
                                                                                                                 'filter', array( concat( '-meta_id_si:', $node.contentobject_id ) ),
                                                                                                                 'Manifestazione', concat( $iniziativa.name ) )|merge( $view_parameters ) ) )}
      {else}
          {def $root = fetch( content, node, hash( node_id, ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
               $calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $root, 'params', hash( 'interval', 'P6M',
                                                                                                                 'filter', array( concat( '-meta_id_si:', $node.contentobject_id ) ),
                                                                                                                 'Manifestazione', concat( $node.name ) )|merge( $view_parameters ) ) )}
      {/if}    
      {*debug-log var=$calendarData msg='object contents'*}
      {if $calendarData.search_count|gt(0)}
          
          
          {if and( $iniziativa, $iniziativa.contentobject_id|ne( $node.contentobject_id ) )}
            <p>Questo evento fa parte della manifestazione <a href={$iniziativa.url_alias|ezurl()} title="Vedi il dettaglio di {$iniziativa.name|wash()}">{$iniziativa.name|wash()}</a></p>
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
                        <div class="col-md-12">
                          {node_view_gui view=panel content_node=$event.node image_class=small is_program=true()}
                        </div>                        
                      {/foreach}
                    </div>
                </div>
              </div>
            {/if}
          {/foreach}          
          
      {elseif and( $iniziativa, $iniziativa.contentobject_id|ne( $node.contentobject_id ) )}          
          <p>Questo evento fa parte della manifestazione <a href={$iniziativa.url_alias|ezurl()} title="Vedi il dettaglio di {$iniziativa.name|wash()}">{$iniziativa.name|wash()}</a></p>          
      {/if}

    </div>

    {include uri='design:openpa/full/parts/event/section_right.tpl'}

</div>


{if $openpa.content_date.show_date}
  <div class="row"><div class="col-md-12">
    <p class="pull-right">{include uri=$openpa.content_date.template}</p>
  </div></div>
{/if}