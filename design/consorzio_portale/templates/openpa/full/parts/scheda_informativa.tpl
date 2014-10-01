{def $area = $node|find_first_parent( 'area' )}


<div class="widget">
  <div class="widget_title">
	<h3>Riferimenti</h3>
  </div>
  <div class="widget_content">
	<ul class="list-unstyled">			
	{if $area}
	  {def $area_openpa = object_handler($area)}
		{if count( $area_openpa.content_ruoli_comune.ruoli.struttura )}
		  {foreach $area_openpa.content_ruoli_comune.ruoli.struttura as $ruolo}
			{if $ruolo.name|eq("Responsabile")}
			<li class="m_bottom_10">
			  {attribute_view_gui attribute=$ruolo.data_map.utente node_view=line}
			</li>
			{/if}
		  {/foreach}
		{/if}
	  {undef $area_openpa}
	{/if}
	{if count( $openpa.content_ruoli_comune.ruoli.struttura )}
	  {foreach $openpa.content_ruoli_comune.ruoli.struttura as $ruolo}
		<li class="m_bottom_10">
		  {attribute_view_gui attribute=$ruolo.data_map.utente node_view=line}
		</li>
	  {/foreach}
	{/if}
	</ul>
	
	{if $node|has_attribute( 'consulente' )}
	  <h3>Consulenti</h3>
	  <p>{attribute_view_gui attribute=$node|attribute( 'consulente' ) show_newline=true()}</p>
	{/if}
	
  </div>
</div>
