{def $object = false()
     $attribute_base='ContentObjectAttribute'
     $attribute_id = 0
     $priority = 100}
{if is_set( $arguments[0] )}
    {set $object = fetch( content, object, hash( object_id, $arguments[0] ))}
{/if}
{if $object.can_read}
    <div class="col-md-4">
        {node_view_gui view='panel' content_node=$object.main_node}
    </div>
{/if}
