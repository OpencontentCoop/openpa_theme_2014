{def $redirect = $User:redirect_uri|wash}
{if ezhttp( 'url', 'get' )}
    {set $redirect = ezhttp( 'url', 'get' )}
{/if} 
<div class='row'>
  <div class='col-sm-4 col-sm-offset-4'>
    <h1 class='text-center title'>{"Login"|i18n("design/ocbootstrap/user/login")}</h1>
    
    {if $User:warning.bad_login}
    <div class="alert alert-danger">
    <p><strong>{"Could not login"|i18n("design/ocbootstrap/user/login")}</strong></p>
    <p>{"A valid username and password is required to login."|i18n("design/ocbootstrap/user/login")}</p>
    </div>
    {/if}
    
    {if $site_access.allowed|not}
    <div class="alert alert-danger">
    <p><strong>{"Access not allowed"|i18n("design/ocbootstrap/user/login")}</strong></p>
    <p>{"You are not allowed to access %1."|i18n("design/ocbootstrap/user/login",,array($site_access.name))}</p>
    </div>
    {/if}
    
    <form class="validate-form" method="post" action={"/user/login/"|ezurl} name="loginform">
      <div class='form-group'>
        <div class='controls with-icon-over-input'>          
          <input type="text" autofocus="" name="Login" placeholder="{"Username"|i18n("design/ocbootstrap/user/login",'User name')}" class="form-control" data-rule-required="true" value="{$User:login|wash}">
          <i class='icon-user text-muted'></i>
        </div>
      </div>
      <div class='form-group'>
        <div class='controls with-icon-over-input'>          
          <input type="password" name="Password" placeholder="{"Password"|i18n("design/ocbootstrap/user/login")}" class="form-control" data-rule-required="true" >
          <i class='icon-lock text-muted'></i>
        </div>
      </div>
      <div class='checkbox'>
        <label for='remember_me'>          
          <input id='remember_me' type="checkbox" tabindex="1" name="Cookie" id="id4" />{"Remember me"|i18n("design/ocbootstrap/user/login")}          
        </label>
      </div>
      <button class='btn btn-lg btn-primary center-block' name="LoginButton">{'Login'|i18n('design/ocbootstrap/user/login','Button')}</button>
      
      {if and( is_set( $User:post_data ), is_array( $User:post_data ) )}
        {foreach $User:post_data as $key => $postData}
           <input name="Last_{$key|wash}" value="{$postData|wash}" type="hidden" /><br/>
        {/foreach}
      {/if}
      <input type="hidden" name="RedirectURI" value="{$redirect|wash}" />
      
    </form>
    <div class='text-center'>
      <hr class='hr-normal'>
      {if ezmodule( 'userpaex' )}
        <a href={'/userpaex/forgotpassword'|ezurl}>{'Hai dimenticato la password?'|i18n('social_user/signin')}</a>
      {else}
        <a href={'/user/forgotpassword'|ezurl}>{'Hai dimenticato la password?'|i18n('social_user/signin')}</a>
      {/if}
    </div>
  </div>
</div>


{ezscript_require(array("password-score/password.js"))}
{literal}
  <script type="text/javascript">
      $(document).ready(function() {
          $('[name="Password"]').password({
              strengthMeter:false,
              message: "{/literal}{'Show/hide password'|i18n('ocbootstrap')}{literal}",
          });
      });
  </script>
{/literal}