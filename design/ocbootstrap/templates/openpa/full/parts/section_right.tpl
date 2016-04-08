<div class="content-related">


    {* TODO inserire blocco di ricerca nela caso di view filters *}
    {* {if $openpa.control_children.current_view|eq('filters')}{/if} *}
    
    {* BLOCCO DI RICERCA
        compare solo nei folder e negli oggetti con padre folder
        qualora il campo 'engine' sia valorizzato la ricerca viene estesa a tutto il database *}
    {def $virtualFolder = $openpa.content_virtual.folder}
    {if and( $virtualFolder|not(), $node.parent )}
        {def $parentOpenpa = object_handler( $node.parent )}
        {set $virtualFolder = $parentOpenpa.content_virtual.folder}
    {/if}
    {if $virtualFolder}
        {include name=searchbox
                node=cond(is_set($parentOpenpa), $node.parent, $node )
                subtree=$virtualFolder.subtree
                class_filters=$virtualFolder.classes
                open_advanced = cond(is_set($parentOpenpa), false(), true() )
                uri='design:parts/search_class_and_attributes.tpl' }
    {/if}


    {def $classification = $openpa.content_related.classification}
    {if count($classification)|gt(0)}
        <h2><i class="fa fa-info"></i> Informazioni</h2>
        <div class="widget">
            <div class="widget_content">
                <ul class="list-unstyled">
                    {foreach $classification as $className => $objects}
                        <li>
                            <strong>{$className}: </strong>
                            {foreach $objects as $object}{node_view_gui content_node=$object.main_node view='text_linked'}{delimiter}, {/delimiter}{/foreach}
                        </li>
                    {/foreach}
                </ul>
            </div>
        </div>
    {/if}
    {undef $classification}


    {if $openpa.content_facets.has_data}
        <h2><i class="fa fa-archive"></i> Riferibili a {$node.name|wash()}</h2>
        <div class="widget">
            <div class="widget_content">
                {foreach $openpa.content_facets.items as $item}
                    <ul class="list-unstyled">
                        {foreach $item as $data}
                            <li>                                
                                <a href="{concat( "content/advancedsearch?Data[",$data.attribute_identifier,"][]=", $node.contentobject_id|urlencode, '&ClassArray[]=', $data.class_id)|ezurl(no)}"
                                   title="Link a {$data.class_name|wash}">{$data.class_name|wash} {if count($item)|gt(1)}
                                        <small>{$data.attribute_name}</small>{/if} <span
                                            class="badge">{$data.value}</span></a>
                            </li>
                        {/foreach}
                    </ul>
                {/foreach}
            </div>
        </div>
    {/if}

    {* COLONNA DEFINITA NEL EZFLOW DEL FOLDER *}
    {if $node|has_attribute('layout')}
        {if and($node|attribute('layout').content.zone_layout|eq('1ZonesLayoutFolder'), $node.depth|gt(2))}
            <div class="extrainfo-box data_map_layout">
                {attribute_view_gui attribute=$node.data_map.layout}
            </div>
        {/if}
    {/if}

    {if $openpa.content_globalinfo.has_content}        
        {attribute_view_gui attribute=$openpa.content_globalinfo.object.data_map.page}    
    {/if}

    {if count($openpa.content_related.info)|gt(0)}
        <h2><i class="fa fa-link"></i> Vedi anche</h2>
        <div class="widget">
            <div class="widget_content">
                {foreach $openpa.content_related.info as $class_name => $infos}
                    <ul class="list-unstyled">
                        {foreach $infos as $info}
                            <li>                                
                                <strong>{$info.content_class.name|wash()}:</strong>
								{node_view_gui content_node=$info view=text_linked}
                            </li>
                        {/foreach}
                    </ul>
                {/foreach}
            </div>
        </div>
    {/if}
    
    {*OGGETTI INVERSAMENTE CORRELATI*}
    {include name = reverse_related_objects 
             node = $node 
             title = 'Riferimenti'
             uri = 'design:parts/reverse_related_objects.tpl'}


</div>