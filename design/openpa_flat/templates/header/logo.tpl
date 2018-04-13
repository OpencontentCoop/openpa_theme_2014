<div class="header-logo">
  <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">
    {if openpacontext().logo.url}
      <img src={openpacontext().logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" />
    {else}
      <small>{ezini('SiteSettings','SiteName')}</small>
    {/if}
  </a>
</div>