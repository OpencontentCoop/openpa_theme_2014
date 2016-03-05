<div class="panel panel-info">
    <div class="panel-body">
        {if $global_layout}
            {if or( $global_layout.object.can_edit, $global_layout.object.can_remove )}

                {if $global_layout.parent_node_id|ne( $node.node_id )}
                    <p>
                        <small>
                            Questo blocco di contenuti &egrave; ereditato da <a
                                    href={$global_layout.parent.url_alias|ezurl()}>{$global_layout.parent.name|wash()}</a><br/>
                            <strong>Attenzione:</strong> le modifiche apportate a questo menu interverrando anche nel
                            menu dgli oggetti genitori. Per creare un menu dedicato usa il bottone "Crea un menu
                            dedicato"
                        </small>
                    </p>
                    {if fetch( 'content', 'access', hash( 'access', 'create', 'contentclass_id', 'global_layout', 'contentobject', $context_node ) )}
                        <form method="post" action="{"content/action"|ezurl(no)}" class="pull-left">
                            <input type="hidden" name="HasMainAssignment" value="1"/>
                            <input type="hidden" name="ContentObjectID" value="{$context_node.object.id}"/>
                            <input type="hidden" name="NodeID" value="{$context_node.node_id}"/>
                            <input type="hidden" name="ContentNodeID" value="{$context_node.node_id}"/>
                            <input type="hidden" name="ContentLanguageCode" value="ita-IT"/>
                            <input type="hidden" name="ContentObjectLanguageCode" value="ita-IT"/>
                            <input type="hidden" value="global_layout" name="ClassIdentifier"/>
                            <input type="submit" class="btn btn-xs btn-info" value="Crea un menu dedicato"
                                   name="NewButton"/>
                            <input type="hidden" name="RedirectIfDiscarded" value="{$context_node.url_alias}"/>
                            <input type="hidden" name="RedirectURIAfterPublish" value="{$context_node.url_alias}"/>
                        </form>
                    {/if}
                {/if}
                <form action="{"/content/action"|ezurl(no)}" method="post">
                    {if $global_layout.object.can_edit}
                        <input type="submit" name="EditButton" value="Modifica menu" class="btn btn-xs btn-info"
                               title="Modifica {$global_layout.name|wash()}"/>
                        <input type="hidden" name="ContentObjectLanguageCode"
                               value="{$global_layout.object.current_language}"/>
                    {/if}
                    {if $global_layout.object.can_remove}
                        <input type="submit" class="btn btn-xs btn-danger" name="ActionRemove" value="Elimina menu"
                               alt="Elimina {$global_layout.name|wash()}" title="Elimina {$global_layout.name|wash()}"/>
                    {/if}
                    <input type="hidden" name="ContentObjectID" value="{$global_layout.object.id}"/>
                    <input type="hidden" name="NodeID" value="{$global_layout.node_id}"/>
                    <input type="hidden" name="ContentNodeID" value="{$global_layout.node_id}"/>
                    <input type="hidden" name="RedirectIfDiscarded" value="{$context_node.url_alias}"/>
                    <input type="hidden" name="RedirectURIAfterPublish" value="{$context_node.url_alias}"/>
                </form>
            {/if}
        {else}
            <form method="post" action="{"content/action"|ezurl(no)}" class="pull-left">
                <input type="hidden" name="HasMainAssignment" value="1"/>
                <input type="hidden" name="ContentObjectID" value="{$context_node.object.id}"/>
                <input type="hidden" name="NodeID" value="{$context_node.node_id}"/>
                <input type="hidden" name="ContentNodeID" value="{$context_node.node_id}"/>
                <input type="hidden" name="ContentLanguageCode" value="ita-IT"/>
                <input type="hidden" name="ContentObjectLanguageCode" value="ita-IT"/>
                <input type="hidden" value="global_layout" name="ClassIdentifier"/>
                <input type="submit" class="btn btn-xs btn-info" value="Crea un menu dedicato" name="NewButton"/>
            </form>
        {/if}
    </div>
</div>