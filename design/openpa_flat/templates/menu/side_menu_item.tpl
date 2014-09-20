<li>
    <a data-contentnode="{$menu_item.item.node_id}" href="{if $menu_item.item.internal}{$menu_item.item.url|ezurl(no)}{else}{$menu_item.item.url}{/if}" {if $menu_item.item.target}target="{$menu_item.item.target}"{/if} title="Vai a {$menu_item.item.name|wash()}">
        {if $menu_item.level|eq(1)}<b>{/if}
            {$menu_item.item.name|wash()}
        {if $menu_item.level|eq(1)}</b>{/if}
        {if $menu_item.has_children}
            <span class="bg_light_color_1 r_corners f_right color_dark talign_c"></span>
        {/if}
    </a>
    {if $menu_item.has_children}
        <ul class="submenu submenu-level-{$menu_item.level}">
        {foreach $menu_item.children as $child}
            {include uri='design:menu/side_menu_item.tpl' menu_item=$child}
        {/foreach}
        </ul>
    {/if}
</li>