{if not( is_set($show_link) )}
  {def $show_link = true()}
{/if}
{if $node|has_attribute( 'struttura_di_riferimento' )}
  {attribute_view_gui attribute=$node.data_map.titolo} {attribute_view_gui attribute=$node.data_map.struttura_di_riferimento show_link=$show_link}
{/if}
