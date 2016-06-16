<div class="vcard {$item.class_identifier}" {if $item.id|eq($current_id)} style="background-color: #eee"{/if}>
    <a href={$item.url_alias|ezurl}>{$item.name|wash}</a>
</div>
{if $item.items|count()}
    {set $level = $level|inc()}
    {foreach $item.items as $collection}
        <ul{if $collection.identifier} class="{$collection.identifier}"{/if}>
            {foreach $collection.items as $sub_item}
                <li>
                    {include level=$level uri='design:openpa/organigramma_item.tpl' item=$sub_item name=organigramma_sub_item current_id=$current_id}
                </li>
            {/foreach}
        </ul>
    {/foreach}
{/if}