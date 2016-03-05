{if is_set( $event.from )}
  {def $from = $event.from|datetime( 'custom', '%M' )
      $to = $event.from|datetime( 'custom', '%j' )}
{else}
  {def $from = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )
      $to = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%j' )}
{/if}

<div class="media-panel events">
  {if $node|has_attribute('image')}
      <figure {if $node|has_attribute('image_full')}class="bg-contain"{/if} style="background: url( {$node|attribute('image').content.imagefull.full_path|ezroot(no)} )"></figure>
  {/if}

  <div class="media{if $node|has_attribute('image')} has-image{/if}">
    <div class="caption">
      <h4 class="fw_medium color_dark">
          <a href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">{$node.name|openpa_shorten(60)|wash()}</a>
      </h4>
      {if is_set($is_program)|not()}
	  <div class="row">
        <div class="col-xs-4 calendar-date">
          <span class="month">{$from}</span>
          <span class="day">{$to}</span>
        </div>
        <div class="col-xs-8">
	  {/if}
          {if $node|has_attribute( 'indirizzo' )}
            {attribute_view_gui attribute=$node.data_map.indirizzo}
          {/if}
          {if $node|has_attribute( 'luogo_svolgimento' )}
            {attribute_view_gui attribute=$node.data_map.luogo_svolgimento}
          {/if}
          {if $node|has_attribute( 'comune' )}
            {attribute_view_gui attribute=$node.data_map.comune}
          {/if}

      <div class="abstract">
        {$node|abstract()|openpa_shorten(270)}
      </div>

      {if is_set($is_program)|not()}
		</div>
      </div>
	  {/if}
      <p class="link">
        <a href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">Leggi</a>
      </p>

    </div>
  </div>
</div>