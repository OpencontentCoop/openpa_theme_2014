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
    <div style="display: inline-block;position: relative">
    <a class="gallery-strip-thumbnail" href={$item|attribute('image').content[$wide_class].url|ezroot} title="{$caption}" data-gallery style="display: inline-block;margin: 10px;">
      {attribute_view_gui attribute=$item|attribute('image') image_class=$thumbnail_class fluid=$fluid}
    </a>
    {if fetch(user,current_user).is_logged_in}
    <div style="position: absolute; display: inline; white-space: nowrap; left: 0; bottom: 0; background: rgba(255, 255, 255, 0.7);">
      {include uri="design:parts/toolbar/node_edit.tpl" current_node=$item}
      {include uri="design:parts/toolbar/node_trash.tpl" current_node=$item}
    </div>
    {/if}
    </div>
    {undef $caption}
  {/foreach}
</div>
