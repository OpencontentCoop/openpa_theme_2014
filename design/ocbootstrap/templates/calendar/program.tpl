{def $currentInterval = 'P1M'
$calendarData = fetch( openpa, calendario_eventi, hash( 'calendar', $node,
'params', hash( 'interval', $currentInterval, 'view', 'program' )|merge( $view_parameters ) ) )}

<form class="calendar-tools" method='GET' action={concat('openpa/calendar/', $node.node_id)|ezurl}>
    <input type='hidden' name="UrlAlias" value="{$node.url_alias}" />
    <input type='hidden' name="View" value="program" />
    <input type='hidden' name="CurrentInterval" value="{$calendarData.parameters.interval}" />
    <input type="hidden" name="SearchDate" value="{$calendarData.parameters.picker_date}" />

    <div class="navigation-calendar hidden-xs pull-right">
        <div class="btn-group">
            <input type="submit" name="PrevMonthCalendarButton" class="btn btn-default" value="&laquo;" />
            <input type="submit" name="ViewCalendarButton" class="btn btn-default" value="Calendario" />
            <input type="submit" name="ViewProgramButton" class="btn btn-primary" value="Lista" />
            <input type="submit" name="NextMonthCalendarButton" class="btn btn-default " value="&raquo;" />
        </div>
    </div>

    <h2 class="widget_title">{$calendarData.parameters.timestamp|datetime( custom, '%F' )|upfirst()}&nbsp;{$temp_year}</h2>

    {foreach $calendarData.day_by_day as $calendarDay}
        {if $calendarDay.count|gt(0)}

            <div class="calendar-day-program float-break carousel-top-control" id="day-{$calendarDay.identifier}">

                <h3 class="widget_title">
                    {if $calendarDay.is_today}Oggi - {$calendarDay.start|l10n( 'date' )}
                    {elseif $calendarDay.is_tomorrow}Domani - {$calendarDay.start|l10n( 'date' )}
                    {elseif and( $calendarDay.is_in_week, $calendarDay.is_in_month )}{*$calendarDay.start|datetime( 'custom', '%l' )*}{$calendarDay.start|l10n( 'date' )}
                    {else}{$calendarDay.start|l10n( 'date' )}
                    {/if}
                </h3>

                {def $items = array()}
                {foreach $calendarDay.events as $event}
                    {set $items = $items|append($event.node)}
                {/foreach}

                {include uri='design:atoms/carousel.tpl'
                        css_id=concat( 'carousel-day-', $calendarDay.identifier )
                        items=$items
                        root_node=$node
                        i_view=line
                        autoplay=0
                        image_class=squaremini
                        items_per_row=2}

                {undef $items}

            </div>
        {/if}
    {/foreach}

    <div class="calendar-more">
        <input type="submit" name="AddIntervalButton" class="defaultbutton pull-right" value="Mostra altri eventi" />
    </div>

</form>