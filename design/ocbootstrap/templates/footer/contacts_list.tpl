<ul class="list-unstyled vertical_list">
    {if is_set($pagedata.contacts.telefono)}
        <li>
            {def $tel = strReplace($pagedata.contacts.telefono,array(" ",""))}
            <a href="tel:{$tel}">
                <i class="fa fa-phone-square"></i>
                {$pagedata.contacts.telefono}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.fax)}
        <li>
            {def $fax = strReplace($pagedata.contacts.fax,array(" ",""))}
            <a href="tel:{$fax}">
                <i class="fa fa-fax"></i>
                {$pagedata.contacts.fax}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.email)}
        <li>
            <a href="mailto:{$pagedata.contacts.email}">
                <i class="fa fa-envelope-o"></i>
                {$pagedata.contacts.email}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.pec)}
        <li>
            <a href="mailto:{$pagedata.contacts.pec}">
                <i class="fa fa-envelope"></i>
                {$pagedata.contacts.pec}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.indirizzo)}
        <li>
            <a href="http://maps.google.com/maps?q={$pagedata.contacts.indirizzo|urlencode}">
                <i class="fa fa-building"></i>
                {$pagedata.contacts.indirizzo}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.web)}
        <li>
            <a href="{$pagedata.contacts.web}">
                <i class="fa fa-link"></i>
                {def $linkParts = $pagedata.contacts.web|explode('//')}
                {if is_set( $linkParts[1] )}
                    {$linkParts[1]}
                {/if}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.partita_iva)}
        <li>
            <a href="#">
                <i class="fa fa-credit-card"></i>
                P.IVA {$pagedata.contacts.partita_iva}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.codice_fiscale)}
        <li>
            <a href="#">
                <i class="fa fa-credit-card"></i>
                C.F. {$pagedata.contacts.codice_fiscale}
            </a>
        </li>
    {/if}
    {if is_set($pagedata.contacts.codice_sdi)}
        <li>
            <a href="#">
                <i class="fa fa-file"></i>
                SDI {$pagedata.contacts.codice_sdi}
            </a>
        </li>
    {/if}
</ul>