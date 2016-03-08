{def $foldersClasses = array( 'folder', 'pagina_sito' )}

{if and( is_set($block.custom_attributes.node_id), $block.custom_attributes.node_id|gt(0) )}
    {def $node_id = $block.custom_attributes.node_id}
    {def $subtreearray = array( $block.custom_attributes.node_id )}
{else}
    {def $node_id = ezini( 'NodeSettings', 'RootNode', 'content.ini' )}
    {def $subtreearray = array( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) )}
{/if}

{if $block.custom_attributes.class|ne('')}    
    {def $class_filter = $block.custom_attributes.class|explode(',')}
{/if}

{def $limit=10}

{def $node = fetch(content,node,hash(node_id,$node_id))
     $attributi_da_escludere_dalla_ricerca = openpaini( 'GestioneAttributi', 'attributi_da_escludere_dalla_ricerca' )
     $anni = openpaini( 'MotoreDiRicerca', 'RicercaAvanzataSelezionaAnni', array())}


{set-block variable=$open}

{/set-block}

{set-block variable=$close}

{/set-block}

{ezscript_require(array( 'ezjsc::jquery', 'ui-widgets.js', 'ui-datepicker-it.js' ) )}
{ezcss_require( array( 'datepicker.css' ) )}
<script type="text/javascript">
{literal}
$(function() {
    $( ".from_picker" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        changeYear: true,
        dateFormat: "dd-mm-yy",
        numberOfMonths: 1

    });
    $( ".to_picker" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        changeYear: true,
        dateFormat: "dd-mm-yy",
        numberOfMonths: 1
    });
});
{/literal}
</script>
{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="widget {$block.view}">
<div class="widget_title">
  <h3>{$block.name|wash()}</h3>
</div>
<div class="widget_content">
    <form action="{'content/search'|ezurl('no')}" method="get">
			
        <input placeholder="Ricerca libera" class="form-control" id="search-string" type="text" name="SearchText" value="" />

        <button type="button" class="btn btn-link btn-sm" data-toggle="collapse"
                data-target="#OrderSearchPanel">
            Ordinamento
        </button>

        <button type="button" class="btn btn-link btn-sm" data-toggle="collapse"
                data-target="#AdvancedSearchPanel">
            Avanzata
        </button>
        
        {if is_set( $class_filter[0] )}
        <div class="well well-sm clearfix collapse" id="OrderSearchPanel">
            
            {def $class = fetch( 'content', 'class', hash( 'class_id', $class_filter[0] ) )}
            
            {def $sorters = array()
                 $filter_string = ''}
            
            {foreach $class.data_map as $attribute}
            {if and($attribute.is_searchable, $attribute.identifier|ne('errors'), $attributi_da_escludere_dalla_ricerca|contains($attribute.identifier)|not())}
                {switch match=$attribute.data_type_string}
                    {case in=array('ezstring','eztext')}
                           {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', solr_field($attribute.identifier,'string') ) )}
                    {/case}
                    {case in=array('ezdate', 'ezdatetime')}
                        {set $filter_string = solr_field($attribute.identifier,'date')}
                        {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', $filter_string ) )}
                    {/case}
                    {case in=array('ezinteger')}
                        {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', solr_field($attribute.identifier,'sint') ) )}
                    {/case}
                    {case}
                    {/case}
                {/switch}
            {/if}
            {/foreach}
        
            <div class="form-group">
                <label for="Sort">Ordina per</label>
                <select class="form-control" id="Sort" name="Sort">
                    <option value=""> - Seleziona</option>
                    <option value="published">Data di pubblicazione</option>
                    <option value="score">Rilevanza</option>                
                    {foreach $sorters as $sorter}
                        {if and( $sorter.name|ne( 'Nome' ), $sorter.name|ne( 'Rilevanza' ), $sorter.name|ne( 'Tipologia di contenuto' ), $sorter.name|ne( 'Data di pubblicazione' ) )}
                            <option value="{$sorter.value}">{$sorter.name}</option>
                        {/if}
                    {/foreach}
                </select>
            </div>

            <div class="form-group">
                <label for="Order">Ordinamento</label>
                <select class="form-control" name="Order" id="Order">
                    <option value="desc">Discendente</option>
                    <option value="asc">Ascendente</option>
                    {foreach $sorters as $sorter}
                        {if and( $sorter.name|ne( 'Nome' ), $sorter.name|ne( 'Rilevanza' ), $sorter.name|ne( 'Tipologia di contenuto' ), $sorter.name|ne( 'Data di pubblicazione' ) )}
                            <option value="{$sorter.value}">{$sorter.name}</option>
                        {/if}
                    {/foreach}
                </select>
            </div>
        </div>
        <div class="well well-sm clearfix collapse" id="AdvancedSearchPanel">
            
            {def $facets = array()
                 $filterParameter = false()}                        
                
            {foreach $class.data_map as $attribute}
            {if and($attribute.is_searchable, $attribute.identifier|ne('errors'), $attributi_da_escludere_dalla_ricerca|contains($attribute.identifier)|not())}
                {switch match=$attribute.data_type_string}
                    
                    {case in=array('ezstring','eztext')}
                    {set $filterParameter = getFilterParameter( solr_field($attribute.identifier,'text') )}
                    {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', solr_field($attribute.identifier,'text') ) )}
                        <div class="form-group">
                            <label for="{$attribute.identifier}">{$attribute.name}</label>
                            <input class="form-control" id="{$attribute.identifier}" type="text" name="filter[{solr_field($attribute.identifier,'text')}]" value="{if is_set($filterParameter[0])}{$filterParameter[0]}{/if}" />
                        </div>
                    {/case}
                    
                    {case in=array('ezobjectrelationlist')}
                        {set $facets = $facets|append( hash( 'field', solr_field($attribute.identifier,'string'), 'name', $attribute.name, 'limit', 10 ) )}
                    {/case}
                    
                    {case in=array('ezdate', 'ezdatetime')}
                        {set $filter_string = solr_field($attribute.identifier,'date')}
                        {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', $filter_string ) )}
                        {if $attribute.identifier|eq('data_archiviazione')|not()}
                            <div class="form-group">
                                <span class="help-block"><strong>{$attribute.name}:</strong></span>
                                <label for="from">Dalla data: <small class="no-js-show"> (GG-MM-AAAA)</small>
                                <input type="text" class="from_picker form-control" name="from_attributes[{$filter_string}]" title="Dalla data" value="" /></label>
                                <label for="to">Alla data: <small class="no-js-show"> (GG-MM-AAAA)</small>
                                <input class="to_picker form-control" type="text" name="to_attributes[{$filter_string}]" title="Alla data" value="" /></label>
                            </div>
                        {/if}                    
                    {/case}
                    
                    {case}
                    {/case}
                    
                    {case in=array('ezinteger')}
                        <div class="form-group">
                        {if $attribute.identifier|eq('annoxxx')}
                            <label for="{$attribute.identifier}">{$attribute.name}</label>
                            <select class="form-control" id="{$attribute.identifier}" name="anno_s[]">
                                    <option value="">Qualsiasi anno</option>
                                    {foreach $anni as $anno}
                                    <option {if $anno|eq($anno_s[0])} class="marked" selected="selected"{/if} value="{$anno}">{$anno}</option>
                                    {/foreach}
                            </select>
                        {else}
                            {set $filterParameter = getFilterParameter( solr_field($attribute.identifier,'sint') )}
                            <label for="{$attribute.identifier}">{$attribute.name}</label>
                            <input class="form-control" id="{$attribute.identifier}" size="5" type="text" name="filter[{solr_field($attribute.identifier,'sint')}]" value="{if is_set($filterParameter[0])}{$filterParameter[0]}{/if}" />
                        {/if}
                        </div>
                        {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', solr_field($attribute.identifier,'sint') ) )}
                    {/case}                
                {/switch}
            {/if}
            {/foreach}
            
            <fieldset>
              <legend>Data di pubblicazione:</legend>
              <div class="col-xs-6  form-group">
                <label for="from">Dalla data: <small class="no-js-show"> (GG-MM-AAAA)</small>
                <input type="text" class="from_picker form-control" name="from" title="Dalla data" value="" /></label>
              </div>
              <div class="col-xs-6  form-group">
                <label for="to">Alla data: <small class="no-js-show"> (GG-MM-AAAA)</small>
                <input class="to_picker form-control" type="text" name="to" title="Alla data" value="" /></label>
              </div>
            </fieldset>
            
            <input name="filter[]" value="contentclass_id:{$class.id}" type="hidden" />
            <input name="OriginalNode" value="{$node.node_id}" type="hidden" />
            {if is_array($subtreearray)}
                {set $subtreearray = $subtreearray|unique()} 
                {foreach $subtreearray as $sta}
                    <input name="SubTreeArray[]" type="hidden" value="{$sta}" />
                {/foreach}
            {else}
            <input name="SubTreeArray[]" type="hidden" value="{$subtreearray}" />
            {/if}
            
            {if count($facets)}
                {def $filters_parameters = getFilterParameters()
                     $cleanFilterParameters = array()
                     $tempFilter = false()}
                
                {def $query = cond( ezhttp( 'SearchText','get','hasVariable' ), ezhttp( 'SearchText', 'get' ), '' )}
                {if count( $subtreearray )|eq(0)}
                    {set $subtreearray = array( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) )}
                {/if}
                {def $filters_hash = hash( 'query', $query,
                                              'class_id', array( $class.id ),
                                              'limit', 1,
                                              'subtree_array', $subtreearray,
                                              'sort_by', hash( 'score', 'desc' ),
                                              'facet', $facets,
                                              'filter', $filters_parameters
                                             )
                     $filters_search = fetch( ezfind, search, $filters_hash )
                     $filters_search_extras = $filters_search['SearchExtras']
                }
                
                {def $nameList = array()}
                
                {def $baseURI=concat( '/content/advancedsearch?', 'OriginalNode=', $node.node_id, '&SubTreeArray[]=', $subtreearray|implode( '&SubTreeArray[]=' ) )}
                {def $uriSuffix = $filters_parameters|getFilterUrlSuffix()}
        
                {if $class}
                    {set $uriSuffix = concat( $uriSuffix, '&filter[contentclass_id]=', $class.id )}
                {/if}
        
                {def $activeFacetParameters = array()}
                {if ezhttp_hasvariable( 'activeFacets', 'get' )}
                    {set $activeFacetParameters = ezhttp( 'activeFacets', 'get' )}
                {/if}
                {foreach $activeFacetParameters as $facetField => $facetValue}
                    {set $uriSuffix = concat( $uriSuffix, '&activeFacets[', $facetField, ']=', $facetValue )}
                {/foreach}                
        
                {foreach $facets as $key => $facet}
                    {if $filters_search_extras.facet_fields.$key.nameList|count()|gt(1)}
                       <fieldset>
                           <legend>{$facet['name']}</legend>

                           {if count($filters_search_extras.facet_fields.$key.nameList)|gt(5)}
                               <div class="form-group">
                                   <select class="form-control" name="filter[]">
                                       <option value=""> - Seleziona</option>
                                       {foreach $filters_search_extras.facet_fields.$key.nameList as $key2 => $facetName}
                                           {if ne( $key2, '' )}
                                               {def $filterName = $filters_search_extras.facet_fields.$key.queryLimit[$key2]|explode(':')
                                                    $filterValue = getFilterParameter( $filterName[0] )}
                                               <option {if or( $filterValue|contains( $facetName ), $filterValue|contains( concat('"',$facetName,'"' ) ))} selected="selected" {/if} value="{$filters_search_extras.facet_fields.$key.queryLimit[$key2]|addQuoteOnFilter()|wash()}">{$facetName} ({$filters_search_extras.facet_fields.$key.countList[$key2]})</option>
                                               {undef $filterName $filterValue}
                                           {/if}
                                       {/foreach}
                                   </select>
                               </div>
                           {else}
                               {foreach $filters_search_extras.facet_fields.$key.nameList as $key2 => $facetName}
                                   {if ne( $key2, '' )}
                                       {def $filterName = $filters_search_extras.facet_fields.$key.queryLimit[$key2]|explode(':')
                                       $filterValue = getFilterParameter( $filterName[0] )}
                                       <div class="checkbox">
                                           <label>
                                               <input {if or( $filterValue|contains( $facetName ), $filterValue|contains( concat('"',$facetName,'"' ) ))} checked="checked" {/if} class="inline" type="checkbox" name="filter[]" value="{$filters_search_extras.facet_fields.$key.queryLimit[$key2]|addQuoteOnFilter()|wash()}" /> {$facetName} ({$filters_search_extras.facet_fields.$key.countList[$key2]})
                                           </label>
                                       </div>
                                       {undef $filterName $filterValue}
                                   {/if}
                               {/foreach}
                           {/if}
                       </fieldset>
                    {else}
                        {def $filterValue = getFilterParameter( $facet.field )}
                        {if count( $filterValue )|gt(0)}
                            <fieldset>
                                <legend>{$facet['name']}</legend>
                                <div class="checkbox">
                                    <label>
                                        <input checked="checked" class="inline" type="checkbox" name="filter[]" value='{concat( $facet.field, ':', $filterValue[0] )}' /> {$filterValue[0]}
                                    </label>
                                </div>
                            </fieldset>
                        {/if}
                        {undef $filterValue}
                    {/if}

                {/foreach}
                
            {/if}
            
        </div>
        {/if}
        
        <div class="form-group m_top_5 clearfix">
            <input id="search-button-button" class="btn btn-primary pull-right" type="submit" name="SearchButton" value="Cerca" />
        </div>
    
</form>

</div>
</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}