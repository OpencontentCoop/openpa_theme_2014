<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if lt IE 9 ]><html xmlns="http://www.w3.org/1999/xhtml" class="unsupported-ie ie" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if IE 9 ]><html xmlns="http://www.w3.org/1999/xhtml" class="ie ie9" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" lang="{$site.http_equiv.Content-language|wash}"><!--<![endif]-->
<head>

{def $basket_is_empty = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash_cache_key = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}


{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block expiry=86400  keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key )}
{def $pagedata = openpapagedata()
     $locales = fetch( 'content', 'translation_list' )
     $current_node_id = $pagedata.node_id}

<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Site: {ezsys( 'hostname' )} -->
{if ezsys( 'hostname' )|contains( 'opencontent' )}<meta name="robots" content="NOINDEX,NOFOLLOW" />{/if}

{include uri='design:page_head.tpl'}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

</head>
<body class="no-js {$pagedata.current_theme}">

<script type="text/javascript">{literal}//<![CDATA[
(function(){var c = document.body.className;c = c.replace(/no-js/, 'js');document.body.className = c;})();
//]]>{/literal}</script>

<div id="page">

    {include uri='design:page_browser_alert.tpl'}

    {include uri='design:page_header.tpl'}

{/cache-block}

{cache-block expiry=86400 keys=array( $module_result.uri, $user_hash_cache_key, $extra_cache_key )}

    {if and( $pagedata.top_menu, $pagedata.is_login_page|not(), $pagedata.is_edit|not )}
      {include uri='design:page_topmenu.tpl'}
    {/if}

    {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
        {include uri='design:page_toolbar.tpl'}
    {/if}

    {if and( $pagedata.is_homepage|not(), $pagedata.is_search_page|not(), $pagedata.show_path, array( 'edit', 'browse' )|contains( $ui_context )|not(), is_set( $module_result.content_info ) )}
        {include uri='design:breadcrumb.tpl'}
    {/if}


{/cache-block}

    {include uri='design:page_mainarea.tpl'}

{cache-block keys=array( $module_result.uri, $user_hash_cache_key, $access_type.name, $extra_cache_key )}

</div>

{include uri='design:page_footer.tpl'}

{include uri='design:page_social.tpl'}



{include uri='design:page_footer_script.tpl'}


{include uri='design:page_extra.tpl'}

{/cache-block}

<!--DEBUG_REPORT-->
</body>
</html>
