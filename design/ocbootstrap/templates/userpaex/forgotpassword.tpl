{ezscript_require(array(
    "password-score/password-score.js",
    "password-score/password-score-options.js",
    "password-score/bootstrap-strength-meter.js",
    "password-score/password.js"
))}
{ezcss_require(array('password-score/password.css'))}
<div class="row">
    <div class="col-md-8 col-md-offset-2">

{if $link}
    <div class="alert alert-info text-center">
        <i class="fa fa-envelope-o fa-5x"></i>
        <p>
            {"A mail has been sent to the following email address: %1. This email contains a link you need to click so that we can confirm that the correct user is getting the new password."|i18n('mbpaex/userpaex/forgotpassword',,array($email))}
        </p>
    </div>
{else}
    {if $wrong_email}
        <div class="alert alert-warning">
            {"There is no registered user with that email address."|i18n('mbpaex/userpaex/forgotpassword')}
        </div>
    {/if}
    {if $password_form}
        {if $password_changed}
            <div class="alert alert-success">
                {"The password has been changed successfully."|i18n('mbpaex/userpaex/forgotpassword')}
            </div>
        {else}
            <form method="post" name="forgotpassword" action={concat("/userpaex/forgotpassword/",$HashKey)|ezurl}>
                <h1>{"Choose a new password"|i18n('mbpaex/userpaex/forgotpassword')}</h1>

                <div class="alert alert-info">
                    {"Enter your desired new password in the form below."|i18n('mbpaex/userpaex/forgotpassword')}
                </div>

                {if $newPasswordNotMatch}
                    <div class="alert alert-warning">
                        {"The passwords do not match. Please, be sure to enter the same password in both fields."|i18n('mbpaex/userpaex/forgotpassword')}
                    </div>
                {/if}
                {if $newPasswordNotValidate}
                    <div class="alert alert-warning">
                        {"The new password is invalid, please choose new one."|i18n('mbpaex/userpaex/forgotpassword')}
                    </div>
                {/if}
                {if $newPasswordMustDiffer}
                    <div class="alert alert-warning">
                        {"New password must be different from the old one. Please choose another password."|i18n('mbpaex/userpaex')}
                    </div>
                {/if}

                <div class="form-group">
                    <label for="password">{"Password"|i18n('mbpaex/userpaex/forgotpassword')}:</label>
                    <input id="pwd-input" class="form-control" type="password" name="NewPassword" size="20" value="" />
                    {include uri='design:parts/password_meter.tpl'}
                </div>

                <div class="form-group">
                    <label for="password">{"Password Confirm"|i18n('mbpaex/userpaex/forgotpassword')}:</label>
                    <input class="form-control" type="password" name="NewPasswordConfirm" size="20" value="" />
                </div>


                <div class="clearfix">
                    <input class="btn btn-primary pull-right" type="submit" name="ChangePasswdButton" value="{'Change password'|i18n('mbpaex/userpaex/forgotpassword')}" />
                    <input type="hidden" name="HashKey" value="{$HashKey}" />
                </div>
            </form>
        {/if}
    {else}
        {if $wrong_key}
            <div class="alert alert-warning">
                {"The key is invalid or has been used. "|i18n('mbpaex/userpaex/forgotpassword')}
            </div>
        {else}
            <form method="post" name="forgotpassword" action={"/userpaex/forgotpassword/"|ezurl}>
                <h1>{"Have you forgotten your password?"|i18n('mbpaex/userpaex/forgotpassword')}</h1>
                <div class="alert alert-info">
                    <p>
                        {"If you have forgotten your password we can generate a new one for you. All you need to do is to enter your email address and we will create a new password for you."|i18n('mbpaex/userpaex/forgotpassword')}
                    </p>
                </div>


                <div class="row">
                    <div class="col-md-8">
                        <input class="form-control" placeholder="{"Email"|i18n('mbpaex/userpaex/forgotpassword')}" type="text" name="UserEmail" size="40" value="{$wrong_email|wash}" />
                    </div>
                    <div class="col-md-4">
                        <input class="btn btn-primary" type="submit" name="GenerateButton" value="{'Generate new password'|i18n('mbpaex/userpaex/forgotpassword')}" />
                    </div>
                </div>
            </form>
        {/if}
    {/if}
{/if}
    </div>
</div>
{literal}
<script type="text/javascript">
    $(document).ready(function() {
        $('#pwd-input').password({
            minLength:{/literal}{ezini('UserSettings', 'MinPasswordLength')}{literal},
            message: "{/literal}{'Show/hide password'|i18n('ocbootstrap')}{literal}",
            hierarchy: {
                '0': ['text-danger', "{/literal}{'Evaluation of complexity: bad'|i18n('ocbootstrap')}{literal}"],
                '10': ['text-danger', "{/literal}{'Evaluation of complexity: very weak'|i18n('ocbootstrap')}{literal}"],
                '20': ['text-warning', "{/literal}{'Evaluation of complexity: weak'|i18n('ocbootstrap')}{literal}"],
                '30': ['text-info', "{/literal}{'Evaluation of complexity: good'|i18n('ocbootstrap')}{literal}"],
                '40': ['text-success', "{/literal}{'Evaluation of complexity: very good'|i18n('ocbootstrap')}{literal}"],
                '50': ['text-success', "{/literal}{'Evaluation of complexity: excellent'|i18n('ocbootstrap')}{literal}"]
            }
        });
        $('[name="NewPasswordConfirm"]').password({
            strengthMeter:false,
            message: "{/literal}{'Show/hide password'|i18n('ocbootstrap')}{literal}"
        });
    });
</script>
{/literal}