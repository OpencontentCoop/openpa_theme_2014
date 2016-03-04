{set_defaults(hash('image_class', 'small'))}
<div class="class-{$node.class_identifier} media">

    {if $node|has_attribute( 'image' )}
        <a class="pull-left" href="{if is_set( $node.url_alias )}{$node.url_alias|ezurl('no')}{else}#{/if}">
            {attribute_view_gui attribute=$node|attribute( 'image' ) href=false() image_class=$image_class css_class="media-object"}
        </a>
    {/if}
    <div class="media-body">
        <h3 class="media-heading">
            <a href="{$openpa.content_link.full_link}">{$node.name|wash()}</a>
        </h3>
        {$node|abstract()}

        {*********}
        {* PIER: *}
        {*********}
        {if $node|has_attribute( 'ruolo' )}
            {$node.data_map.ruolo.content|wash()}
        {/if}

        {if $node|has_attribute( 'competenze')}
            {attribute_view_gui attribute=$node.data_map.competenze}
        {/if}

        {if $node|has_attribute( 'capogruppo' )}
            {attribute_view_gui attribute=$node.data_map.capogruppo}
        {/if}

        {if and(
                $node|has_attribute( 'data' ),
                $node.class_identifier|ne('modulo')
            )
        }
            {$node.data_map.data.data_int|l10n( 'date', 'ita-IT' )}
        {/if}

        {if $node|has_attribute( 'oggetto' )}
            {attribute_view_gui attribute=$node.data_map.oggetto}
        {/if}

        {if $node|has_attribute( 'titolo' )}
            <strong>Titolo:</strong>&nbsp;{$node.data_map.titolo.content|wash()}
        {/if}

        {*********}
    </div>
</div>
