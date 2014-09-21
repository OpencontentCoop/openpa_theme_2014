{set_defaults(hash(
    'items_per_row', 4,
    'i_view', 'panel'
))}

{foreach $items as $i => $child }
    {if $i|eq(0)}
        <div class="row">
    {/if}

    <div class="col-md-{div(12,$items_per_row)}">
        {node_view_gui content_node=$child view=$i_view}
    </div>

    {if eq(sum($i,1)|mod($items_per_row),0)}
        </div>
        <div class="row">
    {/if}
    {if $i|eq(count($items)|sub(1))}
        </div>
    {/if}
{/foreach}
