{*
  $class eZContentClass
  $subtree
  $exclude_attributes array
  $open_advanced
*}

{def $SearchText = cond( ezhttp( 'SearchText','get','hasVariable' ), ezhttp( 'SearchText', 'get' ) )}
{def $Data = cond( ezhttp( 'Data','get','hasVariable' ), ezhttp( 'Data', 'get' ) )}
{def $Sort = cond( ezhttp( 'Sort','get','hasVariable' ), ezhttp( 'Sort', 'get' ) )}
{def $Order = cond( ezhttp( 'Order','get','hasVariable' ), ezhttp( 'Order', 'get' ) )}

{def $attributes = array()
     $facetAttributeIdentifier = array()
     $facetQuery = array()}
{foreach $class.data_map as $attribute}  
	{if and($attribute.is_searchable, $exclude_attributes|contains($attribute.identifier)|not(), $exclude_attributes|contains(concat($class.identifier,'/',$attribute.identifier))|not())}
	  {set $attributes = $attributes|append($attribute)}
	  {if $attribute.data_type_string|eq('ezobjectrelationlist')}
      {set $facetAttributeIdentifier = $facetAttributeIdentifier|append($attribute.identifier)}
      {set $facetQuery = $facetQuery|append(concat($attribute.identifier,'.id|count|100'))}
	  {/if}	  
	{/if}
{/foreach}

{def $availableValues = array()}
{if count($facetQuery)|gt(0)}
  {def $subtreeQuery = ''}
  {if is_array($subtree)}
    {set $subtreeQuery = concat( ' subtree [', $subtree|implode(','), '] ')}
  {/if}  
  {def $searchForFacets = search_query( concat( 'classes ', $class.identifier, ' facets [', $facetQuery|implode(','), ']', $subtreeQuery, 'limit 1' ) )}  
  {if is_set($searchForFacets['SearchExtras'].facet_fields)}
    {foreach $facetAttributeIdentifier as $key => $identifier}
      {if $searchForFacets['SearchExtras'].facet_fields[$key].count|gt(0)}
        {set $availableValues = $availableValues|merge( hash( $identifier, $searchForFacets['SearchExtras'].facet_fields[$key].countList ) )}
      {/if}
    {/foreach}
  {/if}
{/if}

<fieldset>
<div class="form-group">
  <input placeholder="Ricerca libera" class="form-control" type="text" name="SearchText" value="{cond(is_set($SearchText),$SearchText)}"/>
</div>

<a class="btn btn-link btn-sm" data-toggle="collapse" data-target="#OrderSearchPanel">Ordinamento</a>
<a class="btn btn-link btn-sm" data-toggle="collapse" data-target="#AdvancedSearchPanel">Avanzata</a>

<div class="well well-sm clearfix collapse{if $open_advanced} in{/if}" id="OrderSearchPanel">
  <div class="form-group">
  <label for="Sort">Ordina per</label>
  <select class="form-control" id="Sort" name="Sort">
    <option value=""> - Seleziona</option>
    <option {if and( is_set($Sort), $Sort|eq('published') )} selected="selected"{/if} value="published">Data di pubblicazione</option>
    <option {if and( is_set($Sort), $Sort|eq('score'))} selected="selected"{/if} value="score">Rilevanza</option>
    <option {if and( is_set($Sort), $Sort|eq('name'))} selected="selected"{/if} value="name">Nome</option>
    {foreach $attributes as $attribute}
    <option {if and( is_set($Sort), $Sort|eq($attribute.identifier) )} selected="selected"{/if} value="{$attribute.identifier|wash()}">{$attribute.name}</option>
    {/foreach}
  </select>
  </div>
  <div class="form-group">
  <select class="form-control" name="Order" id="Order">
    <option {if and( is_set($Order), $Order|eq('desc') )}selected="selected"{/if} value="desc">Discendente</option>
    <option {if and( is_set($Order), $Order|eq('asc') )}selected="selected"{/if} value="asc">Ascendente</option>
  </select>
  </div>
</div>

<div class="well well-sm clearfix collapse{if $open_advanced} in{/if}" id="AdvancedSearchPanel">
  {foreach $attributes as $attribute}
  {switch match=$attribute.data_type_string}
    
    {case in=array('ezdate', 'ezdatetime')}
    <fieldset>
      <p>{$attribute.name}</p>
      <div class="col-xs-6 form-group" style="padding: 0">
      <label for="{$attribute.identifier}_from">Dalla data:
        <input type="text" class="from_picker form-control" placeholder="GG-MM-AAAA"
           id="{$attribute.identifier}_from"
           name="Data[{$attribute.identifier}][]" title="Dalla data"
           value="{cond(is_set($Data[$attribute.identifier]),$Data[$attribute.identifier][0])}"/>
      </label>
      </div>
      <div class="col-xs-6 form-group" style="padding: 0">
        <label for="{$attribute.identifier}_to">Alla data:
          <input class="to_picker form-control" type="text" placeholder="GG-MM-AAAA"
             id="{$attribute.identifier}_to"
             name="Data[{$attribute.identifier}][]" title="Alla data"
             value="{cond(is_set($Data[$attribute.identifier]),$Data[$attribute.identifier][1])}"/>
        </label>
      </div>
    </fieldset>
    {/case}
    
    {case in=array('ezobjectrelationlist')}
    {if is_set( $availableValues[$attribute.identifier] )}
      <div class="form-group">			
      <label for="{$attribute.identifier}">{$attribute.name}</label>
      <select class="form-control" name="Data[{$attribute.identifier}][]" id="{$attribute.identifier}">
        <option value=""> - Seleziona</option>
        {foreach $availableValues[$attribute.identifier] as $name => $count}
        <option value="{$name|wash()}" {if and(is_set($Data[$attribute.identifier]),$Data[$attribute.identifier]|contains($name))}selected="selected"{/if}>{api_read($name).metadata.name['ita-IT']} ({$count})</option>
        {/foreach}
      </select>			
      </div>
    {/if}
    {/case}
    
    {case in=array('ezstring','eztext','ezinteger')}
    <div class="form-group">
      <label for="{$attribute.identifier}">{$attribute.name}</label>
      <input id="{$attribute.identifier}"
         type="text"
         class="form-control"
         name="Data[{$attribute.identifier}]"
         value="{cond(is_set($Data[$attribute.identifier]),$Data[$attribute.identifier])}"/>
    </div>
    {/case}
    
    {case}{/case}
    
  {/switch}
  {/foreach}
  
  <fieldset>
  <p>Data di pubblicazione</p>
  <div class="col-xs-6  form-group" style="padding: 0">
    <label for="published_from">Dalla data:</label>
    <input id="published_from"
       type="text"
       class="from_picker form-control"
       name="Data[published][]"
       title="Dalla data"
       placeholder="GG-MM-AAAA"
       value="{cond(is_set($Data['published']),$Data['published'][0])}"/>
  </div>
  <div class="col-xs-6  form-group" style="padding: 0">
    <label for="published_to">Alla data:</label>
    <input id="published_to"
       type="text"
       class="to_picker form-control"
       name="Data[published][]"
       title="Dalla data"
       placeholder="GG-MM-AAAA"
       value="{cond(is_set($Data['published']),$Data['published'][1])}"/>
  </div>
  </fieldset>
  
</div>

<p><input id="search-button-button" class="defaultbutton btn btn-primary pull-right" type="submit" name="SearchButton" value="Cerca"/></p>


{foreach $subtree as $value}
  <input name="SubTreeArray[]" type="hidden" value="{$value|wash()}"/>
{/foreach}

<input name="ClassArray[]" type="hidden" value="{$class.id|wash()}"/>


<script type="text/javascript">
  {literal}
  $(function () {
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

</fieldset>
