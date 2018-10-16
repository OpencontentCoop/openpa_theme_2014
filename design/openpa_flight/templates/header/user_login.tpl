<div class="header-top-center">
    <ul>
        <li id="login" style="display: none"><a href={"/user/login"|ezurl} title="Esegui il login al sito">Login</a></li>
        {if and(ezmodule( 'user/register' ), fetch( 'user', 'has_access_to', hash( 'module', 'user', 'function', 'register' ) ))}
            <li id="registeruser" style="display: none">
                <a href="{"/user/register"|ezurl(no)}" title="Registrati al sito">Crea il tuo account</a>
            </li>
        {/if}
    </ul>
</div>


<script>{literal}
$(document).ready(function(){
    var login = $('#login');
    var register = $('#registeruser');
    var injectUserInfo = function(data){
		if(data.error_text || !data.content){
			login.show();
            register.show();
		}else{
            login.after('<li id="myprofile"><a href="/user/edit/" title="Visualizza il profilo utente">Il mio profilo</a></li><li id="logout"><a href="/user/logout" title="Logout">Logout ('+data.content.name+')</a></li>');
			if(data.content.has_access_to_dashboard){
				$('#dashboard-access').html('<ul><li id="dashboard"><a href="/content/dashboard/" title="Pannello strumenti">Pannello strumenti</a></li></ul>');
			}
            login.remove();
            register.remove();
		}
	};
	if(CurrentUserIsLoggedIn){
		$.ez('openpaajax::userInfo', null, function(data){
			injectUserInfo(data);
		});
	}else{
        login.show();
        register.show();
	}
});
{/literal}</script>