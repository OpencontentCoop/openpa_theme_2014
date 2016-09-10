{if is_area_tematica()}
    {def $area = is_area_tematica()}
    {if and( is_set( $area.data_map.cover ), $area.data_map.cover.has_content, $area.data_map.cover.content['original'].height|ge(200))}
        <div class="head-banner hidden-xs" style="background-image: url({$area.data_map.cover.content['header_banner'].url|ezroot(no)});"></div>
    {undef $area}
	{/if}
{elseif and( $pagedata.is_homepage, is_set($pagedata.header.image.url) )}
    <div class="head-banner hidden-xs" style="background-image: url({$pagedata.header.image.url|ezroot(no)});"></div>
{/if}
