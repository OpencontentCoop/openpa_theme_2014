{def $Classes             = cond( ezhttp( 'ClassArray','get','hasVariable' ), ezhttp( 'ClassArray', 'get' ), array() )     
     $Subtree             = cond( ezhttp( 'SubTreeArray','get','hasVariable' ), ezhttp( 'SubTreeArray', 'get' ), array( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) )
     $isSingleClassSearch = cond( $Classes|count()|eq(1), $Classes[0], false() )
     $isSubtreeSearch     = cond( and( $Subtree, $Subtree[0]|ne( ezini( 'NodeSettings', 'RootNode', 'content.ini' ) ) ), true(), false() )     
     $Class               = cond( $isSingleClassSearch, fetch( 'content', 'class', hash( 'class_id', $isSingleClassSearch ) ), false() )
     $RootNode            = cond( $Subtree, fetch( content, node, hash( node_id, $Subtree[0] ) ), false())
     $Sort                = cond( ezhttp( 'Sort','get','hasVariable' ), ezhttp( 'Sort', 'get' )|wash(), false() )
     $Order               = cond( ezhttp( 'Order','get','hasVariable' ), ezhttp( 'Order', 'get' )|wash() )
     $Anno                = cond( ezhttp( 'Anno','get','hasVariable' ), ezhttp( 'Anno', 'get' ) )
     $Logic               = cond( ezhttp( 'Logic','get','hasVariable' ), ezhttp( 'Logic', 'get' ) )}
     
{def $anni = openpaini( 'MotoreDiRicerca', 'RicercaAvanzataSelezionaAnni', array() )
     $link_istruzioni_ricerca = fetch('content','node',hash('node_id', openpaini('LinkSpeciali', 'NodoIstruzioniRicerca', 0) ))
     $limit = 20
     $search = search_query(
        hash( 'SearchOffset', $view_parameters.offset,                          
              'SearchLimit', $limit,                          
              'Facet', array( hash( 'field', 'class', 'name', 'Tipologia di contenuto', 'limit', 1000 ) ) ) )     
     $not_available_facets = search_exclude_class_facets()}

{def $count         = $search['SearchCount']
     $results       = $search['SearchResult']
     $stop_words    = $search['StopWordArray']     
     $search_extras = $search['SearchExtras']
     $uri_suffix    = $search['UriSuffix']}

<div class="row">
  <form action="{'/content/advancedsearch/'|ezurl(no)}" id="ezfindsearch" method="get">
	
    <div class="col-md-{if $isSingleClassSearch}8{else}9{/if}">
      <h2>
          Cerca          
          {if $isSubtreeSearch}
            in "<a href="{$RootNode.url_alias|ezurl(no)}" title='Vai alla pagina "{$RootNode.name|wash}"'>{$RootNode.name|wash}</a>"          
          {else}
            in tutto il sito
          {/if}          
          {if $isSingleClassSearch}
            solo tra informazioni di tipo "{$Class.name}"
          {/if}
      </h2>
      
      <fieldset>
        
        {if $isSingleClassSearch|not()}
        
        {* RICERCA LIBERA *}
        <legend class="sr-only">{"Search"|i18n("design/ezwebin/content/search")}</legend>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <input placeholder="Ricerca libera" class="form-control input-lg" type="text" name="SearchText" id="Search" value="{$search_text|wash}" />
              <span class="input-group-btn">
                <button type="submit" name="SearchButton" class="btn-primary btn btn-lg" title="{'Search'|i18n('design/ezwebin/content/search')}">
                  <span class="glyphicon glyphicon-search"></span>
                </button>
              </span>
            </div>
            {if $isSingleClassSearch|not()}
            <button type="button" class="btn btn-link btn-xs" value="ricerca avanzata" data-toggle="collapse" data-target="#AdvancedSearchPanel">
                Ricerca avanzata
            </button>
            {/if}
          </div>
        </div>

        {* RICERCA AVANZATA *}
        <div class="collapse{if or($Sort,$Order,$Anno,$Logic)} in{/if}" id="AdvancedSearchPanel">
          <div class="well well-sm clearfix">
              <div class="col-xs-3">
                <div class="form-group">
                  <label for="Sort">Ordina per</label>
                  <select class="form-control" id="Sort" name="Sort">
                    <option value=""> - Seleziona</option>
                    <option {if $Sort|eq('score')} selected="selected"{/if} value="score">Rilevanza</option>
                    <option {if $Sort|eq('published')} selected="selected"{/if} value="published">Data di pubblicazione</option>
                    <option {if $Sort|eq('class_name')} selected="selected"{/if} value="class_name">Tipologia di contenuto</option>
                    <option {if $Sort|eq('name')} selected="selected"{/if} value="name">Nome</option>
                  </select>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group">
                  <label for="Order">Ordinamento</label>
                  <select class="form-control" {if $Order}class="marked"{/if} name="Order" id="Order">
                    <option value=""> - Seleziona</option>
                    <option {if $Order|eq('desc')} selected="selected"{/if} value="desc">Discendente</option>
                    <option {if $Order|eq('asc')} selected="selected"{/if} value="asc">Ascendente</option>
                  </select>
                </div>
              </div>
              <div class="col-xs-3">
                <div class="form-group">
                  <label for="anno_s">Anno</label>
                  <select class="form-control" {if is_set($Anno)}class="marked"{/if} id="anno_s" name="Anno">
                    <option value="">Qualsiasi anno</option>
                    {foreach $anni as $anno}
                      <option {if and( is_set($Anno), $anno|eq($Anno))} selected="selected"{/if} value="{$anno}">{$anno}</option>
                    {/foreach}
                  </select>
                </div>
              </div>
              <div class="col-xs-3">
                  <legend>Condizioni logiche</legend>
                  <label>
                    <input type="radio" id="radio_and" name="Logic" title="AND" value="AND" {if $Logic|eq('AND')}checked="checked"{/if} /> AND
                  </label>
                  <label>
                    <input type="radio" id="radio_or" name="Logic" title="OR" value="OR" {if $Logic|eq('OR')}checked="checked"{/if} /> OR
                  </label>
              </div>
          </div>
        </div>
        {/if}
      
      </fieldset>
      
      {* FORSE CERCAVI... *}
      {if $search_extras.spellcheck_collation}
          {def $spell_url=concat('content/advancedsearch/',$search_text|count_chars()|gt(0)|choose('',concat('?SearchText=',$search_extras.spellcheck_collation|urlencode)))|ezurl}
          <p>
            <small>
              Forse intendevi cercare per <a href='{$spell_url}'><strong>{$search_extras.spellcheck_collation}</strong></a> ?
            </small>
          </p>
      {/if}
  
      {* PAROLE ESCLUSE *}
      {if $stop_word_array}
          <p>
            <small>{"The following words were excluded from the search"|i18n("design/base")}:
            {foreach $stop_word_array as $stopWord}
                {$stopWord.word|wash}
                {delimiter}, {/delimiter}
            {/foreach}
            </small>
          </p>
      {/if}
      
      {switch name=feedback match=$count}
        {case match=0}
            <div class="warning">
                {if $search_text|ne('')}
                    <strong>{'No results were found when searching for "%1".'|i18n("design/ezwebin/content/search",,array($search_text|wash))}</strong>
                    {if $search_extras.hasError}{$search_extras.error|wash}{/if}
                    <p>{'Search tips'|i18n('design/ezwebin/content/search')}</p>
                    <ul>
                        <li>{'Check spelling of keywords.'|i18n('design/ezwebin/content/search')}</li>
                        <li>{'Try changing some keywords (eg, "car" instead of "cars").'|i18n('design/ezwebin/content/search')}</li>
                        <li>{'Try searching with less specific keywords.'|i18n('design/ezwebin/content/search')}</li>
                        <li>{'Reduce number of keywords to get more results.'|i18n('design/ezwebin/content/search')}</li>
                    </ul>
                {else}
                    <strong>Nessun risultato ottenuto</strong>
                    {if $search_extras.hasError}{$search_extras.error|wash}{/if}
                    <p>{'Search tips'|i18n('design/ezwebin/content/search')}</p>
                    <ul>
                        <li>Riduci il numero di filtri applicati</li>
                    </ul>
                {/if}
            </div>
        {/case}
        {case}
            <div class="message-feedback">
            {if $search_text|ne('')}
                <strong>{'Search for "%1" returned %2 matches'|i18n("design/ezwebin/content/search",,array($search_text|wash,$count))}</strong>
            {else}
                <strong>La ricerca ha prodotto {$count} risultati</strong>
            {/if}
            </div>
        {/case}
    {/switch}
      
      {if $count|gt(0)}
      <div class="table-responsive">
        <table class="table table-compressed table-striped advanced_search">
            <thead>
                <tr>
                <th>Risultato della ricerca</th>
                <th>Data</th>
                </tr>
            </thead>
            <tbody>
              {foreach $results as $result}
               {node_view_gui view=ezfind_advanced_line sequence=false() content_node=$result}
              {/foreach}
            <tr>
                <td colspan="2">
                  {include name=Navigator
                           uri='design:navigator/google.tpl'
                           page_uri='content/advancedsearch'
                           page_uri_suffix=$uri_suffix
                           item_count=$count
                           view_parameters=$view_parameters
                           item_limit=$limit}                  
                </td>
            </tr>
            </tbody>
        </table>
      </div>
      {/if}
      
    </div>
        
    <div class="col-md-{if $isSingleClassSearch}4{else}3{/if}">

      {if $link_istruzioni_ricerca}
      <a class="btn btn-xs btn-block" href={$link_istruzioni_ricerca.url_alias|ezurl()} title="Link a {$link_istruzioni_ricerca.name|wash()}">
          {$link_istruzioni_ricerca.name|wash()}
      </a>
      {/if}

      
      {if $isSingleClassSearch}
      
        <ul class="pager">
          <li class="previous"><a href={concat( "/content/advancedsearch/", cond( is_area_tematica(), concat( '?SubTreeArray[]=', is_area_tematica().node_id ), '' ) )|ezurl()}>&larr; Ricerca generale</a></li>
        </ul>
        
        <div class="widget_content">
          {include name = searchform
             uri = 'design:parts/class_search_form.tpl'
             class = $Class			   			   
             subtree = $Subtree
             open_advanced = true()
             exclude_attributes = openpaini( 'GestioneAttributi', 'attributi_da_escludere_dalla_ricerca', array() )}
        </div>
      
      {else}
        
        <div class="widget_title">
          <h3>
            {if $Classes|count()|gt(1)}
                Stai filtrando per:                
            {else}                
                Restringi la ricerca a:
            {/if}
          </h3>
        </div>
        
        {def $faccette = $search_extras.facet_fields.0.nameList}        
        {set $faccette = $faccette|asort()}        
        {foreach $faccette as $classId => $name}          
          {if $not_available_facets.ids|contains($classId)|not()}
            <div class="checkbox">
              <label>                
                <input value="{$classId}" title="{$name|wash}" name="ClassArray[]" type="checkbox" {if and( $Classes, $Classes|contains($classId) )} checked="checked"{/if}/> {$name|wash} ({$search_extras.facet_fields.0.countList[$classId]})
             </label>
            </div>
          {/if}
        {/foreach}
        <div class="form-group clearfix">
          <input class="btn btn-primary pull-right" name="SearchButton" type="submit" value="{'Search'|i18n('design/ezwebin/content/search')}" />
        </div>
      {/if}
      
    </div>
  
  </form>
</div>