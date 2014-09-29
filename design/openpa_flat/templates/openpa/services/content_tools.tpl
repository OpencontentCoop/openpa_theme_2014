<div id="editor_tools" class="panel panel-info">
    <div class="panel-heading">
        <h4 class="panel-title"><i class="fa fa-info-circle"></i> Informazioni per l'editor</h4>
    </div>
    <div class="panel-body">
        <dl class="dl-horizontal">

            <dt>Ultima modifica di:</dt>
            <dd>
              {if $node.creator.main_node}
              <a href={$node.creator.main_node.url_alias|ezurl}>{$node.creator.name}</a> il {$node.object.modified|l10n(shortdatetime)}
              {else}
              ?
              {/if}
            </dd>

            <dt>Creato da:</dt>
            <dd>
              {if and( $node.object.owner, $node.object.owner.main_node )}
              <a href={$node.object.owner.main_node.url_alias|ezurl}>{$node.object.owner.name}</a> il {$node.object.published|l10n(shortdatetime)}
              {else}
              ?
              {/if}
            </dd>

            <dt>Nodo:</dt>
            <dd>{$node.node_id}</dd>

            <dt>Oggetto</dt>
            <dd>{$node.contentobject_id} ({$node.object.remote_id})</dd>

            {if count( $node.object.assigned_nodes )|gt(1)}
                <dt>Collocazioni:</dt>
                <dd>
                    <ul class="list-unstyled">
                    {foreach $node.object.assigned_nodes as $item}
                        <li><a href={$item.url_alias|ezurl()}>{$item.path_with_names}</a> {if $item.node_id|eq($node.object.main_node_id)}(principale){/if}</li>
                    {/foreach}
                    </ul>
                </dd>
            {/if}

            {def $sezione = fetch( 'section', 'object', hash( 'section_id', $node.object.section_id ))}
            <dt>Sezione: </dt>
            <dd>{$sezione.name|wash}</dd>

            <dt>Tipo: </dt>
            <dd>{$node.class_name} ({$node.class_identifier})</dd>

            {if $openpa.content_virtual.folder}
                <dt>Folder virtuale:</dt>
                <dd>
                    {$openpa.content_virtual.folder.classes|implode(', ')}
                    ({foreach $openpa.content_virtual.folder.subtree as $node_id}<a href="{concat( 'content/view/full/', $node_id)|ezurl(no)}">{$node_id}</a>{delimiter}, {/delimiter}{/foreach})
                </dd>
            {/if}

            {if $openpa.content_virtual.calendar}
                <dt>Calendario virtuale:</dt>
                <dd>
                    ({foreach $openpa.content_virtual.calendar.subtree as $node_id}<a href="{concat( 'content/view/full/', $node_id)|ezurl(no)}">{$node_id}</a>{delimiter}, {/delimiter}{/foreach})
                </dd>
            {/if}

            {if and( is_set( $node.data_map.data_iniziopubblicazione ), $node.data_map.data_iniziopubblicazione, $node.data_map.data_iniziopubblicazione.has_content, $node.data_map.data_iniziopubblicazione|gt(0) )}
                <dt>{$node.data_map.data_iniziopubblicazione.contentclass_attribute_name}</dt>
                <dd>{attribute_view_gui attribute=$node.data_map.data_iniziopubblicazione}</dd>
            {/if}

            {if and( is_set( $node.data_map.data_finepubblicazione ), $node.data_map.data_finepubblicazione, $node.data_map.data_finepubblicazione.has_content, $node.data_map.data_finepubblicazione|gt(0) )}
                <dt>{$node.data_map.data_finepubblicazione.contentclass_attribute_name}</dt>
                <dd>{attribute_view_gui attribute=$node.data_map.data_finepubblicazione}</dd>
            {/if}

            {if and( is_set( $node.data_map.data_archiviazione ), $node.data_map.data_archiviazione, $node.data_map.data_archiviazione.has_content, $node.data_map.data_archiviazione|gt(0) )}
                <dt>{$node.data_map.data_archiviazione.contentclass_attribute_name}</dt>
                <dd>{attribute_view_gui attribute=$node.data_map.data_archiviazione}</dd>
            {/if}

            {def $states = $node.object.allowed_assign_state_list}
            {if $states|count}
                <dt>Stati:</dt>
                <dd> {foreach $states as $allowed_assign_state_info}{foreach $allowed_assign_state_info.states as $state}{if $node.object.state_id_array|contains($state.id)}{$allowed_assign_state_info.group.current_translation.name|wash()}/{$state.current_translation.name|wash}{/if}{/foreach}{delimiter}, {/delimiter}{/foreach}</dd>
            {/if}

        </dl>
    </div>
</div>