<ul class="list-unstyled vertical_list">
  {if is_set($pagedata.contacts.telefono)}
    <li><a href="tel:{$pagedata.contacts.telefono}">
        <i class="fa fa-phone-square"></i>
        {$pagedata.contacts.telefono}
      </a>
    </li>
  {/if}
  {if is_set($pagedata.contacts.fax)}
    <li><a href="tel:{$pagedata.contacts.fax}">
        <i class="fa fa-fax"></i>
        {$pagedata.contacts.fax}
      </a></li>
  {/if}
  {if is_set($pagedata.contacts.email)}
    <li><a href="mailto:{$pagedata.contacts.email}">
        <i class="fa fa-envelope-o"></i>
        <small>{$pagedata.contacts.email}</small>
      </a></li>
  {/if}
  {if is_set($pagedata.contacts.pec)}
    <li><a href="mailto:{$pagedata.contacts.pec}">
        <i class="fa fa-envelope"></i>
        <small>{$pagedata.contacts.pec}</small>
      </a></li>
  {/if}
  {if is_set($pagedata.contacts.indirizzo)}
    <li><a href="http://maps.google.com/maps?q={$pagedata.contacts.indirizzo|urlencode}">
        <i class="fa fa-building"></i>
        {$pagedata.contacts.indirizzo}
      </a></li>
  {/if}
  {if is_set($pagedata.contacts.web)}
    <li><a href="{$pagedata.contacts.web}">
        <i class="fa fa-link"></i>
        {def $linkParts = $pagedata.contacts.web|explode('//')}
        {if is_set( $linkParts[1] )}
          {$linkParts[1]}
        {/if}
      </a></li>
  {/if}
</ul>