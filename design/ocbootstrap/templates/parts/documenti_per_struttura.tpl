{*

	classe_filtro classe per cui cercare con ezfind gli oggetti correlati, con facette
	node= nodo di provenienza

*}

{def $items = fetch( 'openpa', 'faccette_classi_oggetti_correlati_inversi', hash( 'object', $node.object,
                                                                                     'class_filter_type', 'exclude',
                                                                                     'class_filter_array', openpaini( 'GestioneClassi', 'classi_da_escludere_da_blocco_ezfind', array() )
                                                                                    ) )}

{if count( $items )|gt(0)}
<h2><i class="fa fa-archive"></i> Riferibili a {$node.name|wash()}</h2>
  <div class="widget">
	  <div class="widget_content">
        <ul class="list-unstyled">
		{foreach $items as $item}
            {foreach $item as $data}
                <li>
                    <a href={concat( "content/advancedsearch?", concat("filter[]=submeta_", $data.attribute_identifier, "___main_node_id_si", ':', $node.node_id, '&filter[]=contentclass_id:', $data.class_id, "&SearchButton=Cerca" )|urlencode )|ezurl()} title="Link a {$data.class_name|wash}">{$data.class_name|wash} {if count($item)|gt(1)}<small>{$data.attribute_name}</small>{/if} ({$data.value})</a>
                </li>
            {/foreach}
        {/foreach}
    </ul>
</div>
{/if}
