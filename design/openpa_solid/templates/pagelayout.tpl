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

    {if is_set( $extra_cache_key )|not}
        {def $extra_cache_key = ''}
    {/if}

    {if openpacontext().is_homepage}
        {set $extra_cache_key = concat($extra_cache_key, 'homepage')}
    {/if}

    {if openpacontext().is_login_page}
        {set $extra_cache_key = concat($extra_cache_key, 'login')}
    {/if}

    {if openpacontext().is_edit}
        {set $extra_cache_key = concat($extra_cache_key, 'edit')}
    {/if}

    {if openpacontext().is_browse}
        {set $extra_cache_key = concat($extra_cache_key, 'browse')}
    {/if}

    {if openpacontext().is_area_tematica}
        {set $extra_cache_key = concat($extra_cache_key, 'areatematica_', openpacontext().is_area_tematica)}
    {/if}

    {debug-accumulator id=page_head name=page_head}
    {include uri='design:page_head.tpl' canonical_url=openpacontext().canonical_url}
    {/debug-accumulator}

    {debug-accumulator id=page_head_style name=page_head_style}
    {include uri='design:page_head_style.tpl'}
    {/debug-accumulator}

    {debug-accumulator id=page_head_script name=page_head_script}
    {include uri='design:page_head_script.tpl'}
    {include uri='design:page_head_google_tag_manager.tpl'}
    {/debug-accumulator}
    {no_index_if_needed()}

</head>
<body class="no-js {openpacontext().current_main_style}">
<script type="text/javascript">
//<![CDATA[
var CurrentUserIsLoggedIn = {cond(fetch('user','current_user').is_logged_in, 'true', 'false')};
var UiContext = "{$ui_context}";
var UriPrefix = {'/'|ezurl()};
var PathArray = [{if is_set( openpacontext().path_array[0].node_id )}{foreach openpacontext().path_array|reverse as $path}{$path.node_id}{delimiter},{/delimiter}{/foreach}{/if}];
(function(){ldelim}var c = document.body.className;c = c.replace(/no-js/, 'js');document.body.className = c;{rdelim})();
var ModuleResultUri = "{$module_result.uri|wash()}";
//]]>
</script>
{include uri='design:page_body_google_tag_manager.tpl'}
<div id="page">
    {include uri='design:page_browser_alert.tpl'}

    {debug-accumulator id=page_toolbar name=page_toolbar}
    {include uri='design:page_toolbar.tpl'}
    {/debug-accumulator}

    <div id="header">

        {cache-block expiry=86400 ignore_content_expiry keys=array( $access_type.name, $extra_cache_key )}
            {def $pagedata = openpapagedata()
                 $current_node_id = $pagedata.node_id}

            {include uri='design:header/navigation.tpl' is_edit=openpacontext().is_edit}

            {if and(openpacontext().is_login_page|not(), openpacontext().is_edit|not())}
                {include uri='design:header/banner.tpl'}
            {/if}

            {if and(openpacontext().is_login_page|not(), openpacontext().is_edit|not())}
                {include uri='design:header/tools.tpl'}
            {/if}

            {undef $pagedata $current_node_id}
        {/cache-block}

        {if openpacontext().show_breadcrumb}
        {debug-accumulator id=breadcrumb name=breadcrumb}
            {include uri='design:breadcrumb.tpl' path_array=openpacontext().path_array}
        {/debug-accumulator}
        {/if}
    </div>

    {include uri='design:page_mainarea.tpl'}

    {if and(openpacontext().is_login_page|not(), openpacontext().is_edit|not())}
    {cache-block expiry=86400 ignore_content_expiry keys=array( $access_type.name )}
        {def $pagedata = openpapagedata()
             $current_node_id = $pagedata.node_id}
        {include uri='design:page_footer.tpl'}
        {undef $pagedata $current_node_id}
    {/cache-block}
    {/if}

    {debug-accumulator id=credits name=credits}
    <div id="credits">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    {include uri='design:footer/copyright.tpl'}
                </div>
                <div class="col-md-6 access">
                    {if openpacontext().is_login_page|not()}
                        {include uri='design:footer/user_access.tpl'}
                    {/if}
                </div>
            </div>
        </div>
    </div>
    {/debug-accumulator}
</div>

{include uri='design:page_footer_script.tpl'}
{include uri='design:page_extra.tpl'}

<!--DEBUG_REPORT-->
</body>
</html>


