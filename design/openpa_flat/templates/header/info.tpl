<div class="info">
{if or( is_set($pagedata.contacts.telefono), is_set($pagedata.contacts.email) )}
  <dl>
  	<dt><b>{$pagedata.contacts.telefono}</b></dt>
    <dd>
      <a href="mailto:{$pagedata.contacts.email}"><b><small>{$pagedata.contacts.email}</small></b></a>
    </dd>
  </dl>
{/if}
</div>