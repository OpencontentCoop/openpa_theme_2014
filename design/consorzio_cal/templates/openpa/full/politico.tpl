{if $openpa.control_cache.no_cache}
    {set-block scope=root variable=cache_ttl}0{/set-block}
{/if}

{if $openpa.content_tools.editor_tools}
    {include uri=$openpa.content_tools.template}
{/if}

{def $tree_menu = tree_menu( hash( 'root_node_id', $openpa.control_menu.side_menu.root_node.node_id, 'user_hash', $openpa.control_menu.side_menu.user_hash, 'scope', 'side_menu' ))
     $show_left = and( $openpa.control_menu.show_side_menu, count( $tree_menu.children )|gt(0) )}


<div class="content-view-full class-{$node.class_identifier} row">

    <div class="content-title">
        <h1>{$node.name|wash()}</h1>        
    </div>
        
    <div class="nav-section">
      {if is_set( $openpa.content_main.parts.image )}
        {include uri='design:atoms/image.tpl' item=$node image_class=large image_css_class="media-object tr_all_long_hover"}
    {/if}  
    </div>
    
    <div class="content-main full-stack">        
      <ul class="fa-ul">
        <li><i class="fa-li fa fa-user"></i> {attribute_view_gui attribute=$node.data_map.ruolo_attuale href="no-link"}</li>
        <li><i class="fa-li fa fa-institution"></i> Rappresentante {attribute_view_gui attribute=$node.data_map.rappresentante href="no-link"}</li>
        <li><i class="fa-li fa fa-institution"></i> {attribute_view_gui attribute=$node.data_map.ruolo2 href="no-link"}</li>
      
        {def $search_materie = fetch( ezfind, search, hash( class_id, array( 'materia' ), filter, array( concat( 'submeta_referente_politico___id_si:', $node.contentobject_id ) ) ) )}
        {if $search_materie.SearchCount}      
        <li><i class="fa-li fa fa-tag"></i> <strong>Referente politico per le materie:</strong>
        <ul class="list-unstyled">
        {foreach $search_materie.SearchResult as $item}
          <li>{$item.name|wash()}</li>
        {/foreach}
        </ul>
        </li>
        {/if}
        
      </ul>
    </div>
      
    <div class="content-related">
      
      <h2>Attività</h2>
      <div class="widget">
        
      {ezscript_require( array( 'ezjsc::jquery', 'highcharts_presenze_utente.js', 'highcharts.js' ) )}
      <div class="presenze_utente_pie_container"
           data-title="Presenze 2015"
           data-userid="{$node.contentobject_id}"
           data-url="{'openpa/data/percentuale_presenze_seduta'|ezurl(no)}"
           style="min-width: 262px; height: 200px; max-width: 600px; margin: 0 auto">            
      </div>  
        
      <div class="widget_content">
      
      <ul class="list-unstyled">
        {def $search_osservazioni = fetch( ezfind, search, hash( class_id, array( 'seduta' ), filter, array( concat( 'submeta_presenti___id_si:', $node.contentobject_id ), 'subattr_organo___name____s:Consiglio' ) ) )}
        <li>{$search_osservazioni.SearchCount} sedute di Consiglio</li>
        {def $search_osservazioni = fetch( ezfind, search, hash( class_id, array( 'seduta' ), filter, array( concat( 'submeta_presenti___id_si:', $node.contentobject_id ), 'submeta_presenti___id_si:Giunta' ) ) )}
        <li>{$search_osservazioni.SearchCount} sedute di Giunta</li>
        {def $search_osservazioni = fetch( ezfind, search, hash( class_id, array( 'osservazione' ), filter, array( concat( 'meta_owner_id_si:', $node.contentobject_id ) ) ) )}
        <li>{$search_osservazioni.SearchCount} osservazioni scritte</li>
        {def $search_audizioni = fetch( ezfind, search, hash( class_id, array( 'osservazione' ), filter, array( concat( 'submeta_referente_politico___id_si:', $node.contentobject_id ) ) ) )}
        <li>{$search_audizioni.SearchCount} audizioni</li>
      </ul>
      
      </div>
      </div>
      
    </div>                    
</div>

{if $openpa.content_date.show_date}
  <div class="row"><div class="col-md-12">
    <p class="pull-right">{include uri=$openpa.content_date.template}</p>
  </div></div>
{/if}