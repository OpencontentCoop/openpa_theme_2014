{ezscript_require(array( 'ezjsc::jquery', 'ui-widgets.js' ) )}

<script type="text/javascript">
    {literal}
    $(function() {
        $("#{/literal}{$root_node.name|slugize()}{literal}").accordion({
            autoHeight: false,
            change: function(event, ui) {
                $('a', ui.newHeader ).addClass('active');
                $('a', ui.oldHeader ).removeClass('active');
            }
        });
    });
    {/literal}
</script>

{set_defaults(hash(
    'items_per_row', 4,
    'i_view', 'accordion_content'
))}

<div id="{$root_node.name|slugize()}" class="ui-accordion">

    {def $item_openpa = false()}
    {foreach $items as $index => $child}

        {set $item_openpa = object_handler($child)}

        <div id="{$child.name|slugize()}" class="border-box box-gray box-accordion ui-accordion-header {if $index|eq(0)}no-js-ui-state-active{/if}">
            <h4>
                <a{if $index|eq(0)} class="active"{/if} href="{$openpa.content_link.full_link}">{$child.name|wash()}</a>
            </h4>
        </div>

        <div id="{$child.name|slugize()}-detail" class="border-box box-gray box-accordion ui-accordion-content {if $index|eq(0)}ui-accordion-content-active{/if} {if $index|gt(0)}no-js-hide{/if}">
            {node_view_gui content_node=$child view=$i_view}
        </div>

    {/foreach}

</div>
