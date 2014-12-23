{if $extra_item}
<div class="modal fade" id="extra_menu_box" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title">{$extra_item.data_map.name.content|wash()}</h4>
      </div>
      <div class="modal-body">

        {include uri='design:atoms/image.tpl' item=$extra_item image_class=large alignment=center}

        {attribute_view_gui attribute=$extra_item.data_map.abstract}
      </div>
      <div class="modal-footer">
        <a href="{$extra_item.data_map.location.content}" class="btn btn-extra-menu">{$extra_item.data_map.location.data_text|wash()}</a>
      </div>
    </div>
  </div>
</div>
{/if}