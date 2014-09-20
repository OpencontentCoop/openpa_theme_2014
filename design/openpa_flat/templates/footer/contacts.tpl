{def $contacts = hash(
'telefono', '+39 0461 987139',
'fax', '+39 0461 981978',
'mail', 'info@comunitrentini.it',
'pec', 'consorzio@pec.comunitrentini.it',
'indirizzo', 'TRENTO - Via Torre Verde 23',
)}
<div class="col-lg-3 col-md-3 col-sm-3 m_xs_bottom_30 m_top_20">
    <ul class="list-unstyled vertical_list">
        <li><a href="tel:{$contacts.telefono}">
                <i class="fa fa-phone-square"></i>
                {$contacts.telefono}
            </a>
        </li>
        <li><a href="tel:{$contacts.fax}">
                <i class="fa fa-fax"></i>
                {$contacts.fax}
            </a></li>
        <li><a href="mailto:{$contacts.mail}">
                <i class="fa fa-envelope-o"></i>
                {$contacts.mail}
            </a></li>
        <li><a href="mailto:{$contacts.pec}">
                <i class="fa fa-envelope"></i>
                {$contacts.pec}
            </a></li>
        <li><a href="http://maps.google.com/maps?q={$contacts.indirizzo|urlencode}">
                <i class="fa fa-building"></i>
                {$contacts.indirizzo}
            </a></li>
    </ul>
</div>