{* https://github.com/blueimp/Gallery vedi anche page_extra.tpl *}
{ezscript_require( array( "ezjsc::jquery", "plugins/blueimp/jquery.blueimp-gallery.min.js" ) )}
{ezcss_require( array( "plugins/blueimp/blueimp-gallery.css" ) )}

{set_defaults( hash(
'thumbnail_class', 'squarethumb',
'wide_class', 'imagefullwide',
'items', array(),
'fluid', false(),
'mode', 'strip'
))}

<div class="gallery gallery-{$mode} text-center">
  {if $title}
    <h2>{$title}</h2>
  {/if}
  {foreach $items as $item}
    {def $caption=$item.name}
    {if $item|has_attribute( 'caption' )}
      {set $caption = $item.data_map.caption.data_text|oc_shorten(200)|wash()}
    {/if}
    <a class="gallery-strip-thumbnail" href={$item|attribute('image').content[$wide_class].url|ezroot} title="{$caption}" data-gallery style="display: inline-block;margin: 10px;">
      {attribute_view_gui attribute=$item|attribute('image') image_class=$thumbnail_class fluid=$fluid}
    </a>
    {undef $caption}
  {/foreach}
</div>
