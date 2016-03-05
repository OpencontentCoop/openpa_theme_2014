{if $openpa.content_gallery.has_images}
    <h2><i class="fa fa-camera"></i> {$openpa.content_gallery.title}</h2>
    <div class="widget">
        <div class="widget_content">
            {include uri='design:atoms/gallery.tpl' items=$openpa.content_gallery.images title=false()}
        </div>
    </div>
{/if}