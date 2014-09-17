<div class="header-searchbox">
  <div class="row clearfix">

    {include uri='design:page_header_info.tpl'}

    <div class="search{* no-info*}">
      <form action={"/content/search"|ezurl} role="search">
        <fieldset>
          <legend class="hide">Strumenti di ricerca</legend>
          {if $pagedata.is_edit}
            <input disabled="disabled" type="text" placeholder="Cerca nel sito" name="search" />
            <button disabled="disabled"><i class="fa fa-search"></i></button>
          {else}
            <input type="text" placeholder="{'Search'|i18n('design/ezwebin/pagelayout')}" name="SearchText">
            <input id="facet_field" name="facet_field" value="class" type="hidden" />
            <input type="hidden" value="Cerca" name="SearchButton" />
            <button name="SearchButton" type="submit"><i class="fa fa-search"></i></button>
            {if eq( $ui_context, 'browse' )}
              <input name="Mode" type="hidden" value="browse" />
            {/if}
            {if is_area_tematica()}
              <input type="hidden" value="{is_area_tematica().node_id}" name="SubTreeArray[]" />
            {/if}
          {/if}
        </fieldset>
      </form>
    </div>

  </div
</div>
