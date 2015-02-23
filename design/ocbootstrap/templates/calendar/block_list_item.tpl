{if is_set( $item.from )}
  {def $from = $item.from|datetime( 'custom', '%M' )
	   $to = $item.from|datetime( 'custom', '%j' )
	   $node = $item.node}	
{else}
  {def $from = $item.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )
	     $to = $item.data_map.from_time.content.timestamp|datetime( 'custom', '%j' )
	     $node = $item}
{/if}

<div class="row event-item">
    <div class="col-xs-4 col-sm-3 calendar-date">
        <span class="month">{$from}</span>
        <span class="day">{$to}</span>
    </div>
    <div class="col-xs-8 col-sm-9">
        {node_view_gui content_node=$node view=text_linked shorten=80}
    </div>
</div>