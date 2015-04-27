<div class="info">
{if or( is_set($pagedata.contacts.telefono), is_set($pagedata.contacts.email) )}
  <dl>
    <dd>
      <b>{$pagedata.contacts.telefono}</b>
      <a href="mailto:{$pagedata.contacts.email}"><b><small>{$pagedata.contacts.email}</small></b></a>
    </dd>
  </dl>
{/if}
</div>