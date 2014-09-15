<header role="banner">
    <section class="header-top">
        <div class="container">
            <div class="row clearfix">
                <div class="header-top-left">
                    <p><a href="javascript:window.print()" title="Stampa la pagina corrente">Versione stampabile</a></p>
                </div>
                <nav class="header-top-center">
                    {include uri='design:page_header_user_login.tpl'}
                </nav>
                <div class="header-top-right">
                    {include uri='design:page_header_links.tpl'}
                </div>
            </div>
        </div>
    </section>
  <section class="header-bottom container">
    <div class="clearfix row">
      <div class="header-logo">
        <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">
          <img src="{$pagedata.header.logo.url|ezroot(no)}" alt="{ezini('SiteSettings','SiteName')}">
        </a>
      </div>
      <div class="col-lg-6 col-md-6 col-sm-8 m_top_20">
        <div class="row clearfix m_top_20">
          <div class="col-lg-6 col-md-6 col-sm-6 t_align_r t_xs_align_c m_xs_bottom_15">
            <dl class="l_height_medium">
              <dd class="f_size_ex_large color_dark"><b>+39 0461 987139</b> <a class="color_dark" href="mailto:info@comunitrentini.it"><b>info@comunitrentini.it</b></a>
              </dd>
            </dl>
          </div>
          <div class="col-lg-6 col-md-6 col-sm-6">
            <form class="relative type_2" role="search">
              <input type="text" placeholder="Cerca nel sito" name="search"
                     class="r_corners f_size_medium full_width">
              <button class="f_right search_button tr_all_hover f_xs_none">
                <i class="fa fa-search"></i>
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
</header>