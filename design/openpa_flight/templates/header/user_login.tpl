<div class="header-top-center">
  {if fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'dashboard' ) )}
    <ul><li><a href={"/content/dashboard/"|ezurl} title="Pannello strumenti">Pannello strumenti</a></li></ul>
  {/if}
</div>