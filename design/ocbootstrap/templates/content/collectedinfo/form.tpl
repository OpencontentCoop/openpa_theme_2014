{def $collection = cond( $collection_id,
    fetch( content, collected_info_collection, hash( collection_id, $collection_id ) ),
    fetch( content, collected_info_collection, hash( contentobject_id, $node.contentobject_id ) )
)}

{set-block scope=global variable=title}{'Form %formname'|i18n( 'design/ocbootstrap/collectedinfo/form', , hash( '%formname', $node.name|wash() ) )}{/set-block}

<div class="content-view-full row">

    <div class="content-title">
        <h1>Informazioni per l'utente</h1>
    </div>
    <div class="content-main wide">
        <h2>Grazie di aver compilato il modulo online "{$object.name|wash}"</h2>

        {if $error}
            <div class="alert alert-danger">
                {if $error_existing_data}
                    <p>{'You have already submitted this form. The data you entered was:'|i18n('design/ocbootstrap/collectedinfo/form')}</p>
                {/if}
            </div>
        {/if}

        <div class="content-detail">
            {foreach $collection.attributes as $attribute}
                <div class="row">
                    <div class="col-md-3">
                        <strong>{$attribute.contentclass_attribute_name|wash}</strong>
                    </div>
                    <div class="col-md-9">
                        {attribute_result_gui view=info attribute=$attribute}
                    </div>
                </div>
            {/foreach}
        </div>

        <p class="text-center">
            {if $collection.data_map.link.has_content}
                <a class="btn btn-success btn-lg"
                   href={concat( $collection.data_map.link.content)|ezurl()}>
                    {'Return to site'|i18n('design/ocbootstrap/collectedinfo/form')}
                </a>
            {else}
                <a class="btn btn-success btn-lg"
                   href={$node.parent.url|ezurl}>
                    {'Return to site'|i18n('design/ocbootstrap/collectedinfo/form')}
                </a>
            {/if}
        </p>
    </div>
</div>
