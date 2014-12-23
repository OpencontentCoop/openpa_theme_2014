<div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30 m_top_20">
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
                {$pagedata.contacts.email}
            </a></li>
        {/if}
		{if is_set($pagedata.contacts.pec)}
		<li><a href="mailto:{$pagedata.contacts.pec}">
                <i class="fa fa-envelope"></i>
                {$pagedata.contacts.pec}
            </a></li>
        {/if}
		{if is_set($pagedata.contacts.indirizzo)}
		<li><a href="http://maps.google.com/maps?q={$pagedata.contacts.indirizzo|urlencode}">
                <i class="fa fa-building"></i>
                {$pagedata.contacts.indirizzo}
            </a></li>
		{/if}		
    </ul>
</div>