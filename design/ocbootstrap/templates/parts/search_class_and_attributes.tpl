{*
	BLOCCO di ricerca

	node			ID nodo del folder, a cui limitare la ricerca
	class_filters		array di classi a cui limitare la ricerca
	servizi			array di servizi
	anno_s			array di anni
	argomenti		array di argomenti
	subfilter_arr		array dei campi valorizzati e ricercabili
	search_text		testo contenente la ricerca aperta
	folder			nome del contenitore
	search_included		esiste se il template è incluso in search.tpl
	sub_tree		array sottoalbero a cui limitare la ricerca

*}

{if is_set($search_included)|not()}{def $search_included=false()}{/if}
{if is_set($search_text)|not()}{def $search_text = ''}{/if}
{if is_set($anno_s)|not()}{def $anno_s=hash(0, 'none')}{/if}
{def $Sort = cond( ezhttp( 'Sort','get','hasVariable' ), ezhttp( 'Sort', 'get' ) )
    $Order = cond( ezhttp( 'Order','get','hasVariable' ), ezhttp( 'Order', 'get' ) )
    $from = cond( ezhttp( 'from','get','hasVariable' ), ezhttp( 'from', 'get' ) )
    $to = cond( ezhttp( 'to','get','hasVariable' ), ezhttp( 'to', 'get' ) )}

{def $filterParameter = array()
    $SubTreeArray = cond( ezhttp( 'SubTreeArray','get','hasVariable' ), ezhttp( 'SubTreeArray', 'get' ), array() )}

{def $subtreearray = array(ezini( 'NodeSettings', 'RootNode', 'content.ini' )) }

{if is_set($subtree)}
    {set $subtreearray = $sub_tree}
{/if}

{if $SubTreeArray}
    {if and( is_array( $SubTreeArray )|not(), $SubTreeArray|ne('') )}
        {set $SubTreeArray = array( $SubTreeArray )}
    {else}
        {def $tempSta = array()}
        {foreach $SubTreeArray as $sta}
            {if and( $sta|ne(ezini( 'NodeSettings', 'RootNode', 'content.ini' )), $sta|ne('') )}
                {set $tempSta = $tempSta|append($sta)}
            {/if}
        {/foreach}
        {set $subtreearray = $tempSta}
    {/if}
{/if}

{if and( $subtreearray|contains(ezini( 'NodeSettings', 'RootNode', 'content.ini' )), count($subtreearray)|gt(1) )}
    {def $tempSta = array()}
    {foreach $subtreearray as $sta}
        {if and( $sta|ne(ezini( 'NodeSettings', 'RootNode', 'content.ini' )), $sta|ne('') )}
            {set $tempSta = $tempSta|append($sta)}
        {/if}
    {/foreach}
    {set $subtreearray = $tempSta}
{/if}

{def $foldersClasses = array( 'folder', 'pagina_sito' )}

{if $foldersClasses|contains( $node.class_identifier )}
    {if $node.data_map.classi_filtro.has_content}
        {def $related_nodes = fetch('content','related_objects', hash('object_id', $node.contentobject_id, 'attribute_identifier', concat( $node.class_identifier, '/subfolders' ) ))}
        {if $related_nodes|count()|gt(1)}
            {set $folder = false()}
        {elseif $related_nodes|count()|gt(0)}
            {set $subtreearray=$related_nodes[0].main_node_id
            $folder = $related_nodes[0].name|wash()}
        {elseif is_area_tematica()}
            {set $subtreearray=is_area_tematica().node_id}
        {/if}
    {/if}
{elseif $foldersClasses|contains( $node.parent.class_identifier )}
    {if $node.parent.data_map.classi_filtro.has_content}
        {def $related_nodes = fetch('content','related_objects', hash('object_id', $node.parent.contentobject_id, 'attribute_identifier', concat( $node.parent.class_identifier, '/subfolders' ) ))}
        {if $related_nodes|count()|gt(1)}
            {set $folder = false()}
        {elseif $related_nodes|count()|gt(0)}
            {set $subtreearray=$related_nodes[0].main_node_id
            $folder = $related_nodes[0].name|wash()}
        {elseif is_area_tematica()}
            {set $subtreearray=is_area_tematica().node_id}
        {/if}
    {else}
        {if is_area_tematica()}
            {set $subtreearray=is_area_tematica().node_id}
        {/if}
    {/if}
{elseif is_area_tematica()}
    {set $subtreearray=is_area_tematica().node_id}
{/if}

{if and( is_set( $node.data_map.subfolders ), $node.data_map.subfolders.has_content )}
    {set $subtreearray = array()}
    {foreach $node.data_map.subfolders.content.relation_list as $relation}
        {set $subtreearray = $subtreearray|append( $relation.node_id )}
    {/foreach}
{/if}

{if is_array( $subtreearray )|not}
    {set $subtreearray = array( $subtreearray )}
{/if}


<script type="text/javascript">
    {literal}
    $(function () {
        $(".block-search-advanced-link p").click(function () {
            $(this).toggleClass('open');
            $(this).next().slideToggle("slow");
        });
        $(".from_picker").datepicker({
            defaultDate: "+1w",
            changeMonth: true,
            changeYear: true,
            dateFormat: "dd-mm-yy",
            numberOfMonths: 1

        });
        $(".to_picker").datepicker({
            defaultDate: "+1w",
            changeMonth: true,
            changeYear: true,
            dateFormat: "dd-mm-yy",
            numberOfMonths: 1
        });
    });
    {/literal}
</script>

{def $class = false()
    $attributi_da_escludere_dalla_ricerca  = openpaini( 'Attributi', 'EscludiDaRicerca', array())
    $anni = openpaini( 'MotoreDiRicerca', 'RicercaAvanzataSelezionaAnni', array() )}




<div class="widget search_box">
    {if and( is_array($subtreearray), count($subtreearray)|eq(1), $subtreearray|contains(ezini( 'NodeSettings', 'RootNode', 'content.ini' )) )}
    <h2>Cerca</h2>
    {else}
        {if $folder|ne( false() )}
            <h2>Cerca in {$folder}</h2>
        {else}
            <h2>Cerca</h2>
        {/if}
    {/if}
    <div class="widget_content">
        <form id="search-form-box" action="{'content/advancedsearch'|ezurl('no')}" method="get">
            <fieldset>

                {if is_array($subtreearray)}
                    {foreach $subtreearray as $sta}
                        <input name="SubTreeArray[]" type="hidden" value="{$sta}"/>
                    {/foreach}
                {else}
                    <input name="SubTreeArray[]" type="hidden" value="{$subtreearray}"/>
                {/if}

                <div class="form-group">
                    <input placeholder="Ricerca libera" class="form-control" type="text" name="SearchText" value="{$search_text}"/>
                </div>


                {if $foldersClasses|contains( $node.class_identifier )}
                    {set $class_filters = $node.data_map.classi_filtro.content|explode(',')}
                {/if}
                {foreach $class_filters as $class_filter}
                    {set $class = fetch( 'content', 'class', hash( 'class_id', $class_filter ) )}
                {/foreach}

                {if $class_filters[0]|ne('')}

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
                {/if}

                <button type="button" class="btn btn-link btn-sm" data-toggle="collapse"
                        data-target="#OrderSearchPanel">
                    Ordinamento
                </button>

                <button type="button" class="btn btn-link btn-sm" data-toggle="collapse"
                        data-target="#AdvancedSearchPanel">
                    Avanzata
                </button>

                <div class="well well-sm clearfix collapse" id="OrderSearchPanel">
                    <div class="form-group">
                        <label for="Sort">Ordina per</label>
                        <select class="form-control" id="Sort" name="Sort">
                            <option value=""> - Seleziona</option>
                            <option {if $Sort|eq('published')} class="marked" selected="selected"{/if}
                                    value="published">Data di
                                pubblicazione
                            </option>
                            <option {if $Sort|eq('score')} class="marked" selected="selected"{/if} value="score">
                                Rilevanza
                            </option>
                            {*<option {if $Sort|eq('class_name')} class="marked" selected="selected"{/if} value="class_name">Tipologia di contenuto</option>*}
                            {foreach $sorters as $sorter}
                                {if and( $sorter.name|ne( 'Nome' ), $sorter.name|ne( 'Rilevanza' ), $sorter.name|ne( 'Tipologia di contenuto' ), $sorter.name|ne( 'Data di pubblicazione' ) )}
                                    <option {if $Sort|eq($sorter.value)} class="marked" selected="selected"{/if}
                                            value="{$sorter.value}">{$sorter.name}</option>
                                {/if}
                            {/foreach}
                        </select>
                    </div>

                    <div class="form-group">
                        <select class="form-control" {if $Order}class="marked"{/if} name="Order" id="Order">
                            <option {if $Order|eq('desc')} class="marked" selected="selected"{/if} value="desc">
                                Discendente
                            </option>
                            <option {if $Order|eq('asc')} class="marked" selected="selected"{/if} value="asc">Ascendente
                            </option>
                            {foreach $sorters as $sorter}
                                {if and( $sorter.name|ne( 'Nome' ), $sorter.name|ne( 'Rilevanza' ), $sorter.name|ne( 'Tipologia di contenuto' ), $sorter.name|ne( 'Data di pubblicazione' ) )}
                                    <option {if $Sort|eq($sorter.value)} class="marked" selected="selected"{/if}
                                            value="{$sorter.value}">{$sorter.name}</option>
                                {/if}
                            {/foreach}
                        </select>
                    </div>
                </div>


                {if count( $class_filters )|eq( 1 )}

                <div class="well well-sm clearfix collapse" id="AdvancedSearchPanel">

                    {foreach $class_filters as $class_filter}
                        {set $class = fetch( 'content', 'class', hash( 'class_id', $class_filter ) )}
                        {break}
                    {/foreach}

                    {def $facets = array()}
                    {set $sorters = array()}

                    {foreach $class.data_map as $__position => $attribute}
                        {if and($attribute.is_searchable, $attribute.identifier|ne('errors'), $attributi_da_escludere_dalla_ricerca|contains($attribute.identifier)|not())}

                            {switch match=$attribute.data_type_string}

                            {case in=array('ezstring','eztext')}
                                {set $filterParameter = getFilterParameter( solr_field($attribute.identifier,'text') )}
                                {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', solr_field($attribute.identifier,'text') ) )}

                                <div class="form-group">
                                    <label for="{$attribute.identifier}">{$attribute.name}</label>
                                    <input id="{$attribute.identifier}" type="text"
                                           class="form-control"
                                           name="filter[{solr_field($attribute.identifier,'text')}]"
                                           value="{if is_set($filterParameter[0])}{$filterParameter[0]}{/if}"/>
                                </div>
                            {/case}

                            {case in=array('ezobjectrelationlist')}
                                {set $facets = $facets|append( hash( 'field', solr_meta_subfield($attribute.identifier,'main_node_id'), 'name', $attribute.name, 'limit', 10 ) )}
                            {/case}

                            {case in=array('ezdate', 'ezdatetime')}
                                {set $filter_string = solr_field($attribute.identifier,'date')}
                                {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', $filter_string ) )}
                                {if $attribute.identifier|eq('data_archiviazione')|not()}
                                    <fieldset>
                                        <legend>{$attribute.name}:</legend>
                                        <div class="col-xs-6 form-group">
                                            <label for="attr-{$attribute.id}_1">Dalla data:
                                                <input type="text" class="from_picker form-control" placeholder="GG-MM-AAAA"
                                                       id="attr-{$attribute.id}_1"
                                                       name="from_attributes[{$filter_string}]" title="Dalla data"
                                                       value="{if is_set($from_attributes[$filter_string])}{$from_attributes[$filter_string]}{/if}"/></label>
                                        </div>
                                        <div class="col-xs-6 form-group">
                                            <label for="attr-{$attribute.id}_2">Alla data:
                                                <input class="to_picker form-control" type="text" placeholder="GG-MM-AAAA"
                                                       id="attr-{$attribute.id}_2"
                                                       name="to_attributes[{$filter_string}]" title="Alla data"
                                                       value="{if is_set($to_attributes[$filter_string])}{$to_attributes[$filter_string]}{/if}"/></label>
                                        </div>
                                    </fieldset>
                                {/if}
                            {/case}

                            {case}
                            {/case}

                            {case in=array('ezinteger')}
                                {if $attribute.identifier|eq('annoxxx')}
                                    <div class="form-group">
                                        <label for="{$attribute.identifier}">{$attribute.name}</label>
                                        <select class="form-control" id="{$attribute.identifier}" name="anno_s[]">
                                            <option value="">Qualsiasi anno</option>
                                            {foreach $anni as $anno}
                                                <option {if $anno|eq($anno_s[0])} class="marked" selected="selected"{/if}
                                                        value="{$anno}">{$anno}</option>
                                            {/foreach}
                                        </select>
                                    </div>
                                {else}
                                    <div class="form-group">
                                        {set $filterParameter = getFilterParameter( solr_field($attribute.identifier,'sint') )}
                                        <label for="{$attribute.identifier}">{$attribute.name}</label>
                                        <input class="form-control" id="{$attribute.identifier}" size="5" type="text"
                                               name="filter[{solr_field($attribute.identifier,'sint')}]"
                                               value="{if is_set($filterParameter[0])}{$filterParameter[0]}{/if}"/>
                                    </div>
                                {/if}
                                {set $sorters = $sorters|append( hash( 'name', $attribute.name, 'value', solr_field($attribute.identifier,'sint') ) )}
                            {/case}


                            {/switch}
                        {/if}
                    {/foreach}

                    <fieldset>
                        <legend>Data di pubblicazione:</legend>
                        <div class="col-xs-6  form-group">
                            <label for="from_{$__position}">Dalla data:</label>
                            <input id="from_{$__position}" type="text" class="from_picker form-control" name="from" title="Dalla data" placeholder="GG-MM-AAAA" value="{if $from}{$from}{/if}"/>
                        </div>
                        <div class="col-xs-6  form-group">
                            <label for="to_{$__position}">Alla data:</label>
                            <input id="to_{$__position}" class="to_picker form-control" type="text" name="to" title="Alla data" placeholder="GG-MM-AAAA" value="{if $to}{$to}{/if}"/>
                        </div>
                    </fieldset>

                    <input name="filter[]" value="contentclass_id:{$class.id}" type="hidden"/>
                    <input name="OriginalNode" value="{$node.node_id}" type="hidden"/>
                    {if is_array($subtreearray)}
                        {set $subtreearray = $subtreearray|unique()}
                        {foreach $subtreearray as $sta}
                            <input name="SubTreeArray[]" type="hidden" value="{$sta}"/>
                        {/foreach}
                    {else}
                        <input name="SubTreeArray[]" type="hidden" value="{$subtreearray}"/>
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
                                                    'filter', $filters_parameters )
                                                    $filters_search = fetch( ezfind, search, $filters_hash )
                                                    $filters_search_extras = $filters_search['SearchExtras']}

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
                        {set $uriSuffix = concat( $uriSuffix, "&Sort=",$Sort,"&Order=",$Order,"&from=",$from,"&to=",$to )}

                        {foreach $facets as $key => $facet}
                            {if $filters_search_extras.facet_fields.$key.nameList|count()}
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
                                                        <option {if $filterValue|contains( $facetName )} selected="selected" {/if}
                                                                value='{$filters_search_extras.facet_fields.$key.queryLimit[$key2]}'>{if fetch( 'content', 'node', hash( 'node_id', $facetName ))}{fetch( 'content', 'node', hash( 'node_id', $facetName )).name|wash()}{else}{$facetName}{/if}
                                                            ({$filters_search_extras.facet_fields.$key.countList[$key2]}
                                                            )
                                                        </option>
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
                                                        <input {if $filterValue|contains( $facetName )} checked="checked" {/if}
                                                                class="inline" type="checkbox" name="filter[]"
                                                                value='{$filters_search_extras.facet_fields.$key.queryLimit[$key2]}'/> {if fetch( 'content', 'node', hash( 'node_id', $facetName ))}{fetch( 'content', 'node', hash( 'node_id', $facetName )).name|wash()}{else}{$facetName}{/if}
                                                        ({$filters_search_extras.facet_fields.$key.countList[$key2]}
                                                        )
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
                                                <input checked="checked" class="inline" type="checkbox"
                                                       name="filter[]"
                                                       value='{concat( $facet.field, ':', $filterValue[0] )}'/> {if fetch( 'content', 'node', hash( 'node_id', $filterValue[0] ))}{fetch( 'content', 'node', hash( 'node_id', $filterValue[0] )).name|wash()}{else}{$filterValue[0]}{/if}
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

                <p><input id="search-button-button" class="defaultbutton btn btn-primary pull-right" type="submit" name="SearchButton" value="Cerca"/></p>
            </fieldset>
        </form>
    </div>
</div>
