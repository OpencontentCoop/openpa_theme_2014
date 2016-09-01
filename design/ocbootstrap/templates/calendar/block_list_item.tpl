{if is_set( $item.from )}
  {def $month = $item.from|datetime( 'custom', '%M' )
	   $day = $item.from|datetime( 'custom', '%j' )
       $sameDay = $item.to|sub($item.from)|le(86400)
	   $node = $item.node}	
{else}
  {def $month = $item.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )
       $day = $item.data_map.from_time.content.timestamp|datetime( 'custom', '%j' )
       $sameDay = $item.data_map.to_time.content.timestamp|sub($item.data_map.from_time.content.timestamp)|le(86400)
	   $node = $item}
{/if}

<div class="row event-item">
    <div class="col-xs-4 col-sm-3 calendar-date">
        <span class="month">{$month}</span>
        <span class="day">{if $sameDay|not()}<small>dal </small>{/if}{$day}</span>
    </div>
    <div class="col-xs-8 col-sm-9">
        {node_view_gui content_node=$node view=text_linked shorten=80}
    </div>
</div>