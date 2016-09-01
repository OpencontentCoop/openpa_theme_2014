{if $openpa.content_contacts.has_content}
    <div class="content-detail well m_top_20">
        {if $openpa.content_contacts.show_label}
            <h4><strong>{$openpa.content_contacts.label}</strong></h4>
        {/if}
        <div class="row">
            {foreach $openpa.content_contacts.attributes as $openpa_attribute}
                {if $openpa_attribute.full.show_label}
                <div class="col-md-2"><strong>{$openpa_attribute.label}: </strong></div>
                {/if}
                <div class="col-md-{if $openpa_attribute.full.show_label}10{else}12{/if}">
                    {attribute_view_gui attribute=$openpa_attribute.contentobject_attribute href=cond($openpa_attribute.full.show_link|not, 'no-link', '')}
                </div>
            {/foreach}
        </div>
    </div>
{/if}