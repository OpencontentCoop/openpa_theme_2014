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

    {include uri='design:page_head.tpl'}
    {include uri='design:page_head_style.tpl'}
    {include uri='design:page_head_script.tpl'}


</head>
<body class="no-js {$openpacontext().current_theme}">

<script type="text/javascript">{literal}//<![CDATA[(function () {var c = document.body.className;c = c.replace(/no-js/, 'js');document.body.className = c;})();//]]>{/literal}</script>

<div id="page">


    <div id="header">
        <div class="navbar yamm">
            <div class="container">
                <div class="row">
                    <span class="navbar-header col-md-12 text-center">
                    {cache-block expiry=86400 keys=array( $access_type.name, 'login' )}
                    {def $pagedata = openpapagedata()}
                    {if and( $pagedata.homepage|has_attribute('only_logo'), $pagedata.homepage|attribute('only_logo').data_int|eq(1) )}
                        <a href="{'/'|ezurl(no)}" title="{ezini('SiteSettings','SiteName')}">
                        {if $pagedata.header.logo.url}
                          <img class="img-responsive center-block"
                               src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}"/>
                        {/if}
                        </a>
                    {else}
                        <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">
                        {if $pagedata.header.logo.url}
                           <img class="img-responsive center-block"
                                src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}"/>
                        {/if}
                        </a>
                        <span class="navbar-title">
                            <h1><a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">{ezini('SiteSettings','SiteName')}</a></h1>
                        </span>
                  {/if}
                  {/cache-block}
                </div>
            </div>
        </div>
    </div>

    {include uri='design:page_mainarea.tpl'}


    <div id="credits">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    {include uri='design:footer/copyright.tpl'}
                </div>
            </div>
        </div>
    </div>

</div>

{include uri='design:page_footer_script.tpl'}


<!--DEBUG_REPORT-->
</body>
</html>
