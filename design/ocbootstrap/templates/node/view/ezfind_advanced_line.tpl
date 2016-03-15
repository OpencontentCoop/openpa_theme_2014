{def $valore = ''}
<tr class="{$sequence}">

  <td>
  
      <h4>
          <a href={$node.url_alias|ezurl()}>{$node.name|wash}</a>
          <small>{$node.class_name}</small>
      </h4>
      <a href={$node.url_alias|ezurl()}><small>{$node.path_with_names}</small></a>
  
      {if $node|has_attribute('incarico')}
        <p>
            <strong>Incarico: </strong></strong>
            {attribute_view_gui href=nolink attribute=$node.data_map.incarico}
        </p>
      {/if}
      
      {if $node|has_attribute('servizio')}
        <p>
            <strong>Servizio: </strong>
            {attribute_view_gui href=nolink attribute=$node.data_map.servizio}
        </p>
      {/if}
  
      
      {if $node|has_attribute('ufficio')}
        <p>
            <strong>Ufficio: </strong>
            {attribute_view_gui href=nolink attribute=$node.data_map.ufficio}
        </p>
      {/if}
      
  
      {if $node|has_attribute('organo_competente')}
        <p>
            <strong>Competenza: </strong>
            {attribute_view_gui href=nolink attribute=$node.data_map.organo_competente}
        </p>
      {/if}
  
      {if $node|has_attribute('circoscrizione')}
        <p>
            <strong>Circoscrizione: </strong></strong>
            {attribute_view_gui href=nolink attribute=$node.data_map.circoscrizione}
        </p>
      {/if}
  
      {if $node|has_attribute('struttura')}
        <p>
            <strong>Struttura: </strong>
            {attribute_view_gui href=nolink attribute=$node.data_map.struttura}
        </p>
      {/if}
  
      {if $node|has_attribute('lista_elettorale')}
          <p>
              <strong>Lista: </strong>
              {attribute_view_gui href=nolink attribute=$node.data_map.lista_elettorale}
          </p>
      {/if}
  
      {if $node|has_attribute('argomento')}
        <p>
            <strong>Argomento: </strong>
            {attribute_view_gui href=nolink attribute=$node.data_map.argomento}
        </p>
      {/if}
  
      {if is_set($node.data_map.file)}
          {if and($node.data_map.file.has_content, $node.class_identifier|eq('file_pdf'))}
              {attribute_view_gui attribute=$node.data_map.file icon_size='medium' icon_title=$node.name icon='yes'}
          {/if}
      {/if}
  
  </td>
  
  
  <td>
      {$node.object.published|l10n(date)}
  </td>

</tr>
