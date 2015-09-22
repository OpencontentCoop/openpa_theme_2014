{if $object.main_node.data_map.file.content.contentobject_attribute_id}
	{def $file = $object.main_node.data_map.file}
<div class="content-view-embed attribute-{$file.content.mime_type_part}">
    <div class="class-file">
		<a href={concat("content/download/", $file.contentobject_id, "/", $file.id, "/file/", $file.content.original_filename)|ezurl}>
			{$object.main_node.name}
		</a> 
		{$file.content.filesize|si(byte)}
    {include uri="design:parts/toolbar/node_edit.tpl" current_node=$object.main_node}
	  {include uri="design:parts/toolbar/node_trash.tpl" current_node=$object.main_node}
	</div>
</div>
  {undef $file}
{/if}

