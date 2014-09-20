{def $path_array = $current_node.path_string|explode( '/' )
     $current_node_id = $current_node.node_id
     $is_current = $menu_item.item.node_id|eq($current_node_id)
     $is_active = $path_array|contains($menu_item.item.node_id)}
<li{if or($is_active, $is_current)} class="active current"{/if}>
    <a href="{if $menu_item.item.internal}{$menu_item.item.url|ezurl(no)}{else}{$menu_item.item.url}{/if}" {if $menu_item.item.target}target="{$menu_item.item.target}"{/if} title="Vai a {$menu_item.item.name|wash()}">
        {if $menu_item.level|eq(1)}<b>{/if}
            {$menu_item.item.name|wash()}
        {if $menu_item.level|eq(1)}</b>{/if}
        {if $menu_item.has_children}
            <span class="menu-handler"></span>
        {/if}
    </a>
    {if $menu_item.has_children}
        <ul class="submenu submenu-level-{$menu_item.level}">
        {foreach $menu_item.children as $child}
            {include name="side_sub_menu" uri='design:menu/side_menu_item.tpl' menu_item=$child current_node=$current_node}
        {/foreach}
        </ul>
    {/if}
</li>

{undef $path_array $current_node_id $is_current $is_active}