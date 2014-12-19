<div class="header-logo">
  <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">
    {if $pagedata.header.logo.url}
      <img src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" />
    {else}
      <small>{ezini('SiteSettings','SiteName')}</small>
    {/if}
  </a>
</div>