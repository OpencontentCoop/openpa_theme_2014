<!DOCTYPE html>
<!--[if lt IE 9 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="unsupported-ie ie"
      lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if IE 9 ]>
<html xmlns="http://www.w3.org/1999/xhtml" class="ie ie9"
      lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html xmlns="http://www.w3.org/1999/xhtml" lang="{$site.http_equiv.Content-language|wash}">
<!--<![endif]-->
<head>

    {def $user_hash_cache_key = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

    {if is_set( $extra_cache_key )|not}
        {def $extra_cache_key = ''}
    {/if}

{cache-block expiry=86400 keys=array( $module_result.uri, $user_hash_cache_key, $access_type.name, $extra_cache_key )}
    {def $pagedata = openpapagedata()
    $locales = fetch( 'content', 'translation_list' )
    $current_node_id = $pagedata.node_id}

    {include uri='design:page_head.tpl'}
    {include uri='design:page_head_style.tpl'}
    {include uri='design:page_head_script.tpl'}

</head>
<body class="no-js {$pagedata.current_theme}">

<script type="text/javascript">{literal}//<![CDATA[(function () {var c = document.body.className;c = c.replace(/no-js/, 'js');document.body.className = c;})();//]]>{/literal}</script>

<div id="page">
    {include uri='design:page_browser_alert.tpl'}

    {if and( $pagedata.website_toolbar, array( 'edit', 'browse' )|contains( $ui_context )|not() )}
        {include uri='design:page_toolbar.tpl'}
    {/if}

    <div id="header">
        {include uri='design:header/navigation.tpl'}

        {if and( $pagedata.is_homepage, array( 'edit', 'browse' )|contains( $ui_context )|not() )}
            {include uri='design:header/banner.tpl'}
        {/if}

        {if $pagedata.is_login_page|not()}
            {include uri='design:header/tools.tpl'}
        {/if}

        {if and( $pagedata.is_homepage|not(), $pagedata.is_search_page|not(), $pagedata.show_path, array( 'edit', 'browse' )|contains( $ui_context )|not(), is_set( $module_result.content_info ) )}
            {include uri='design:breadcrumb.tpl'}
        {/if}
    </div>

{/cache-block}

    {include uri='design:page_mainarea.tpl'}

{cache-block expiry=86400 keys=array( $module_result.uri, $user_hash_cache_key, $access_type.name, $extra_cache_key )}

    {if is_unset($pagedata)}{def $pagedata = openpapagedata()}{/if}

    {if and( $pagedata.is_login_page|not(), $pagedata.show_path, array( 'edit', 'browse' )|contains( $ui_context )|not() )}
        {include uri='design:page_footer.tpl'}
    {/if}


{/cache-block}

{cache-block keys=array( $access_type.name, $current_user.contentobject_id )}

{if is_unset($pagedata)}{def $pagedata = openpapagedata()}{/if}
{if and( $pagedata.is_login_page|not(), $pagedata.show_path, array( 'edit', 'browse' )|contains( $ui_context )|not() )}
    <div id="credits">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    {include uri='design:footer/copyright.tpl'}
                </div>
                <div class="col-md-6 access">
                    {include uri='design:footer/user_access.tpl'}
                </div>
            </div>
        </div>
    </div>
{/if}

{/cache-block}
</div>

{include uri='design:page_footer_script.tpl'}
{include uri='design:page_extra.tpl'}



<!--DEBUG_REPORT-->
</body>
</html>
