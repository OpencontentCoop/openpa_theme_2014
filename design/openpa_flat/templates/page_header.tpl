<header role="banner">

  {if $pagedata.is_login_page|not()}
  <section class="header-top">
    <div class="container">
        <div class="row clearfix">
          {include uri='design:page_header_tools.tpl'}
          {include uri='design:page_header_user_login.tpl'}
          {include uri='design:page_header_links.tpl'}
        </div>
    </div>
  </section>
  {/if}

  <section class="header-bottom container">
    <div class="clearfix row">
      {include uri='design:page_header_logo.tpl'}
      {if $pagedata.is_login_page|not()}
        {include uri='design:page_header_searchbox.tpl'}
      {/if}
    </div>
  </section>

</header>