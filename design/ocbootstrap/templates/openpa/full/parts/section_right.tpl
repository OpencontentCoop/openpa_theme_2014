<div class="content-related">
  
  {if $openpa.content_gallery.has_images}
    <h2><i class="fa fa-camera"></i> Immagini</h2>
    {include uri='design:atoms/gallery.tpl' items=$openpa.content_gallery.images}            
  {/if}
  
</div>