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
    

    <div id="header">
        <div class="navbar yamm">
          <div class="container">
              <div class="row">
              <div class="navbar-header col-md-4">
                  {if $pagedata.is_login_page|not()}
                  <button type="button" data-toggle="collapse" data-target="#main-menu" class="navbar-toggle"><span class="glyphicon glyphicon-menu-hamburger"></span></button>
                  {/if}
                  <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}" class="navbar-brand">
                      {if and( is_set($pagedata.header.logo.url), $pagedata.header.logo.url)}
                          <img class="hidden-xs navbar-logo" src={$pagedata.header.logo.url|ezroot()} alt="{ezini('SiteSettings','SiteName')}" />
                      {/if}
                      <span class="navbar-title">
                          {ezini('SiteSettings','SiteName')}
                      </span>
                  </a>
              </div>              
              </div>
          </div>
      </div>
    </div>


{/cache-block}
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
