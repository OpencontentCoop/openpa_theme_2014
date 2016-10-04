{def $valore = ''}
<tr class="{$sequence}">

    <td>

        <h4>
            <a href={$node.url_alias|ezurl()}>{$node.name|wash}</a>
            <small>{$node.class_name}</small>
        </h4>

        {if $node|has_attribute('oggetto')}
            {if $node.data_map.oggetto.data_type_string|eq('ezstring')}
                <p>{attribute_view_gui attribute=$node.data_map.oggetto}</p>
            {else}
                {attribute_view_gui attribute=$node.data_map.oggetto}
            {/if}
        {elseif $node|has_abstract()}
        <p>
            {$node|abstract()|oc_shorten(250)}
        </p>
        {/if}

        <p><a href={$node.url_alias|ezurl()}>
                <small>{$node.path_with_names}</small>
            </a>
        </p>


        <ul class="list-unstyled">
            {if $node|has_attribute('incarico')}
                <li>
                    <strong>Incarico: </strong>
                    {attribute_view_gui href=nolink attribute=$node.data_map.incarico}
                </li>
            {/if}

            {if $node|has_attribute('servizio')}
                <li>
                    <strong>Servizio: </strong>
                    {attribute_view_gui href=nolink attribute=$node.data_map.servizio}
                </li>
            {/if}

            {if $node|has_attribute('ufficio')}
                <li>
                    <strong>Ufficio: </strong>
                    {attribute_view_gui href=nolink attribute=$node.data_map.ufficio}
                </li>
            {/if}

            {if $node|has_attribute('organo_competente')}
                <li>
                    <strong>Competenza: </strong>
                    {attribute_view_gui href=nolink attribute=$node.data_map.organo_competente}
                </li>
            {/if}

            {if $node|has_attribute('circoscrizione')}
                <li>
                    <strong>Circoscrizione: </strong>
                    {attribute_view_gui href=nolink attribute=$node.data_map.circoscrizione}
                </li>
            {/if}

            {if $node|has_attribute('struttura')}
                <li>
                    <strong>Struttura: </strong>
                    {attribute_view_gui href=nolink attribute=$node.data_map.struttura}
                </li>
            {/if}

            {if $node|has_attribute('lista_elettorale')}
                <li>
                    <strong>Lista: </strong>
                    {attribute_view_gui href=nolink attribute=$node.data_map.lista_elettorale}
                </li>
            {/if}

            {if $node|has_attribute('argomento')}
                <li>
                    <strong>Argomento: </strong>
                    {attribute_view_gui href=nolink attribute=$node.data_map.argomento}
                </li>
            {/if}

            {if is_set($node.data_map.file)}
                {if and($node.data_map.file.has_content, $node.class_identifier|eq('file_pdf'))}
                    <li>{attribute_view_gui attribute=$node.data_map.file icon_size='medium' icon_title=$node.name icon='yes'}</li>
                {/if}
            {/if}

        </ul>
    </td>


    <td>
        {$node.object.published|l10n(date)}
    </td>

</tr>
