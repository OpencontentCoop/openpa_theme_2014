{if is_set( $event.from )}
  {def $from = $event.from|datetime( 'custom', '%M' )
      $to = $event.from|datetime( 'custom', '%j' )}
{else}
  {def $from = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%M' )
      $to = $node.data_map.from_time.content.timestamp|datetime( 'custom', '%j' )}
{/if}

<div class="media-panel events {$node|access_style}">
  {if $node|has_attribute('image')}
      <figure {if $node|has_attribute('image_full')}class="bg-contain"{/if} style="background: url( {$node|attribute('image').content.imagefull.full_path|ezroot(no)} )"></figure>
  {/if}

  <div class="media{if $node|has_attribute('image')} has-image{/if}">
    <div class="caption">
      <h4 class="fw_medium color_dark">
          <a href="{$openpa.content_link.full_link}" title="{$node.name|wash()}">
            {if $node|has_attribute('titolo')}
              {$node.data_map.titolo.content|wash()}
            {elseif $node|has_attribute('short_title')}
              {$node.data_map.short_title.content|wash()}
            {else}
              {$node.name|wash()}
            {/if}
          </a>
          {if and($node|has_attribute( 'short_title' ), $node|has_attribute('titolo'))}
            <br /><small style="text-transform: none;">{attribute_view_gui attribute=$node.data_map.short_title}</small>
          {/if}
      </h4>
      {if is_set($is_program)|not()}
	  <div class="row">
        <div class="col-xs-4 calendar-date">
          <span class="month">{$from}</span>
          <span class="day">{$to}</span>
        </div>
        <div class="col-xs-8">
	  {/if}
          

      <div class="abstract" style="line-height: 1.5;">
        {if $node|has_attribute( 'indirizzo' )}
            {attribute_view_gui attribute=$node.data_map.indirizzo}
          {/if}          
          {if $node|has_attribute( 'comune' )}
            {attribute_view_gui attribute=$node.data_map.comune}
          {/if}
        {$node|abstract()|openpa_shorten(270)}
        {if $node|has_attribute( 'luogo_svolgimento' )}
          <p style="line-height: 1;margin-top: 10px;"><small style="text-transform: none;"><i class="fa fa-map-marker"></i> {attribute_view_gui attribute=$node.data_map.luogo_svolgimento}</small></p>
        {/if}
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
