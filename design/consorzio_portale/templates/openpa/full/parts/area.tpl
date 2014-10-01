{if count( $openpa.content_ruoli_comune.ruoli.struttura )}
  <div class="widget">
	<div class="widget_title">
	  <h3>Riferimenti</h3>
	</div>
	<div class="widget_content">
	  <ul class="list-unstyled">			
	  {foreach $openpa.content_ruoli_comune.ruoli.struttura as $ruolo}
		<li class="m_bottom_10">
		  {attribute_view_gui attribute=$ruolo.data_map.utente node_view=line}
		</li>
	  {/foreach}
	  </ul>
	</div>
  </div>
{/if}