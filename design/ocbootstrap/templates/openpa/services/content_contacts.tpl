{if $openpa.content_contacts.has_content}
    <div class="content-detail panel panel-default m_top_20">
        {if $openpa.content_contacts.show_label}
            <div class="panel-heading">
                <h4 class="panel-title"><strong>{$openpa.content_contacts.label}</strong></h4>
            </div>
        {/if}
        <div class="panel-body">
            {foreach $openpa.content_contacts.attributes as $openpa_attribute}
                <div class="row">
                    {if $openpa_attribute.full.show_label}
                        <div class="col-md-2"><strong>{$openpa_attribute.label}: </strong></div>
                    {/if}
                    <div class="col-md-{if $openpa_attribute.full.show_label}10{else}12{/if}">
                        {attribute_view_gui attribute=$openpa_attribute.contentobject_attribute href=cond($openpa_attribute.full.show_link|not, 'no-link', '')}
                    </div>
                </div>
            {/foreach}
        </div>
    </div>
{/if}