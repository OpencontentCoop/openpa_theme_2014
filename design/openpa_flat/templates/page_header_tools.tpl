{if fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'dashboard' ) )}
<div class="header-top-left">
  <ul>
    <li><a href={"/content/dashboard/"|ezurl} title="Pannello strumenti">Pannello strumenti</a></li>
  </ul>
</div>
{/if}
