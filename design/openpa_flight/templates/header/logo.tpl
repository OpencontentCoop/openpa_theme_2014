<div class="header-logo">
  <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">
    {if $pagedata.header.logo.url}
      <img class="img-responsive center-block" src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" />    
    {/if}
  </a>
</div>
<div class="header-title">
  <h1><a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">{ezini('SiteSettings','SiteName')}</a></h1>
</div>