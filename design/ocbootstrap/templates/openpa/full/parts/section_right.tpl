<div class="content-related">
  
  {if $openpa.content_gallery.has_images}
    <h2><i class="fa fa-camera"></i> Immagini</h2>
    <div class="widget">
      <div class="widget_content">
        {include uri='design:atoms/gallery.tpl' items=$openpa.content_gallery.images}
      </div>
    </div>
  {/if}
  
  {def $classification = $openpa.content_related.classification}
  {if count($classification)|gt(0)}  
    <h2><i class="fa fa-info"></i> Informazioni</h2>    
    <div class="widget">
      <div class="widget_content">
        <dl>
          {foreach $classification as $className => $objects}
          <dt>{$className}:</dt>
          <dd>{foreach $objects as $object}{node_view_gui content_node=$object.main_node view='text_linked'}{delimiter}, {/delimiter}{/foreach}</dd>
          {/foreach}
        </dl>
      </div>
    </div>
  {/if}
  {undef $classification}
  
  {if $openpa.content_facets.has_data}
    <h2><i class="fa fa-archive"></i> Documenti</h2>    
    <div class="widget">
      <div class="widget_content">
        {foreach $openpa.content_facets.items as $item}
          <ul class="list-unstyled">        
            {foreach $item as $data}
                <li>
                    <a href={concat( "content/advancedsearch?filter[]=submeta_", $data.attribute_identifier, "___main_node_id_si", ':', $node.node_id|urlencode, '&filter[]=contentclass_id:', $data.class_id, "&SearchButton=Cerca")|ezurl()} title="Link a {$data.class_name|wash}">{$data.class_name|wash} {if count($item)|gt(1)}<small>{$data.attribute_name}</small>{/if} <span class="badge">{$data.value}</span></a>
                </li>
            {/foreach}          
          </ul>
        {/foreach}
      </div>
    </div>
  {/if}
  
</div>