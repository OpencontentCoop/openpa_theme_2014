<footer id="footer">
  {if and( $ui_context|ne( 'edit' ), $ui_context|ne( 'browse' ), $pagedata.is_login_page|not() )}

    {def $footer_notes = fetch( 'openpa', 'footer_notes' )}


    <div class="footer_top_part">
    <div class="container">
      <div class="row clearfix">

        <div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30">
          <h3 class="color_light_2 m_bottom_20">{ezini('SiteSettings','SiteName')}</h3>
          {if $footer_notes}
            <div class="block">{attribute_view_gui attribute=$footer_notes}</div>
          {/if}
        </div>

        <div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30 m_top_20">
          <ul class="list-unstyled vertical_list">
            <li><a href="progetto.html">
                <i class="fa fa-phone-square"></i>
                +39 0461 987139
              </a>
            </li>
            <li><a href="progetto.html">
                <i class="fa fa-fax"></i>
                +39 0461 981978
              </a></li>
            <li><a href="progetto.html">
                <i class="fa fa-envelope-o"></i>
                info@comunitrentini.it
              </a></li>
            <li><a href="progetto.html">
                <i class="fa fa-envelope"></i>
                consorzio@pec.comunitrentini.it
              </a></li>
            <li><a href="progetto.html">
                <i class="fa fa-building"></i>
                TRENTO - Via Torre Verde 23
              </a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30 m_top_20">
          {def $footer_links = fetch( 'openpa', 'footer_links' )}
          {if count( $footer_links )}
          <ul class="list-unstyled vertical_list">
            {foreach $footer_links as $item}
              {def $href = $item.url_alias|ezurl(no)}
              {if eq( $ui_context, 'browse' )}
                {set $href = concat("content/browse/", $item.node_id)|ezurl(no)}
              {elseif $pagedata.is_edit}
                {set $href = '#'}
              {elseif and( is_set( $item.data_map.location ), $item.data_map.location.has_content )}
                {set $href = $item.data_map.location.content}
              {/if}
                 <li><a href="{$href}" title="Leggi {$item.name|wash()}">{$item.name|wash()}<i class="fa fa-angle-right"></i></a></li>
              {undef $href}
            {/foreach}
          </ul>
          {/if}
        </div>

        <div class="col-lg-3 col-md-3 col-sm-3 text-center">
          <h2 class="color_light_2 m_bottom_20">Newsletter</h2>

          <p class="f_size_medium m_bottom_15">
            Iscriviti alla newsletter, rimani aggiornato sulle ultime
            novità!</p>

          <a href="#" class="btn btn-lg btn-primary">Iscrivi ora</a>
        </div>
      </div>
    </div>
  </div>
  {/if}
  <!--copyright part-->
  <div class="footer_bottom_part">
    <div class="container clearfix t_mxs_align_c">
      <p class="f_left f_mxs_none m_mxs_bottom_10">&copy; 2014 <span class="color_light">Consorzio dei Comuni Trentini</span>
        powered by <a href="http://www.innovazione.comunitrentini.tn.it/Progetti/ComunWEB" title="Progetto ComunWEB - Consorzio dei Comuni Trentini">ComunWEB</a> con il supporto di <a href="http://www.opencontent.it" title="OpenContent - Free Software Solutions">OpenContent Scarl</a>
      </p>
    </div>
  </div>
</footer>