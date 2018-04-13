<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if lt IE 9 ]><html xmlns="http://www.w3.org/1999/xhtml" class="unsupported-ie ie" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if IE 9 ]><html xmlns="http://www.w3.org/1999/xhtml" class="ie ie9" lang="{$site.http_equiv.Content-language|wash}"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html xmlns="http://www.w3.org/1999/xhtml" lang="{$site.http_equiv.Content-language|wash}"><!--<![endif]-->
<head>

    {if is_set( $extra_cache_key )|not}
        {def $extra_cache_key = ''}
    {/if}

    {if openpacontext().is_area_tematica}
        {set $extra_cache_key = concat($extra_cache_key, 'areatematica_', openpacontext().is_area_tematica)}
    {/if}

    {debug-accumulator id=page_head_style name=page_head_style}
    {include uri='design:page_head_style.tpl'}
    {/debug-accumulator}

    {debug-accumulator id=page_head_script name=page_head_script}
    {include uri='design:page_head_script.tpl'}
    {/debug-accumulator}

    {debug-accumulator id=page_head name=page_head}
    {include uri='design:page_head.tpl'}
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
//]]>
</script>


<div id="page">

    {include uri='design:page_browser_alert.tpl'}

    {cache-block expiry=86400 ignore_content_expiry keys=array( $access_type.name, $extra_cache_key )}
    {def $pagedata = openpapagedata()
         $current_node_id = $pagedata.node_id}
    <div id="header" role="banner">

        {if openpacontext().is_login_page|not()}
            {debug-accumulator id=header name=header}
            <section class="header-top">
                <div class="container">
                    <div class="row clearfix">
                        {include uri='design:header/tools.tpl'}
                        {include uri='design:header/user_login.tpl'}
                        {include uri='design:header/links.tpl'}
                    </div>
                </div>
            </section>
            {/debug-accumulator}
        {/if}

        <div class="header-bottom container">
            <div class="clearfix row">
                {include uri='design:header/logo.tpl'}
                {if openpacontext().is_login_page|not()}
                    {debug-accumulator id=searchbox name=searchbox}
                        {include uri='design:header/searchbox.tpl'}
                    {/debug-accumulator}
                {/if}
            </div>
        </div>

    </div>

    {debug-accumulator id=page_topmenu name=page_topmenu}
        {if and( $pagedata.top_menu, $pagedata.is_login_page|not(), $pagedata.is_edit|not )}
            {if is_set( $pagedata.persistent_variable.topmenu_template_uri )}
                {include uri=$pagedata.persistent_variable.topmenu_template_uri}
            {else}
                {include uri='design:page_topmenu.tpl'}
            {/if}
        {/if}
    {/debug-accumulator}
    {undef $pagedata $current_node_id}
    {/cache-block}

    {debug-accumulator id=page_toolbar name=page_toolbar}
    {include uri='design:page_toolbar.tpl'}
    {/debug-accumulator}

    {if openpacontext().show_breadcrumb}
    {debug-accumulator id=page_toppath name=page_toppath}
    {include uri='design:breadcrumb.tpl'}
    {/debug-accumulator}
    {/if}


    {include uri='design:page_mainarea.tpl'}

</div>

{cache-block expiry=86400 ignore_content_expiry keys=array( $access_type.name )}
{debug-accumulator id=page_footer name=page_footer}
    {def $pagedata = openpapagedata()
         $current_node_id = $pagedata.node_id}
    {include uri='design:page_footer.tpl'}

    {if and( $pagedata.is_login_page|not(), array( 'edit', 'browse' )|contains( $ui_context )|not() )}
      {include uri='design:page_social.tpl'}
    {/if}

    {if is_set( $pagedata.homepage.data_map.sensor_footer_banner )}
        {include uri='design:parts/sensor_footer_banner.tpl' url=$pagedata.homepage.data_map.sensor_footer_banner.content name=sensor_ad}
    {/if}
    {undef $pagedata $current_node_id}
{/debug-accumulator}
{/cache-block}

<button class="animate_ftl" id="go_to_top"><i class="fa fa-angle-up"></i></button>


{include uri='design:page_footer_script.tpl'}


{include uri='design:page_extra.tpl'}

<!--DEBUG_REPORT-->
</body>
</html>
