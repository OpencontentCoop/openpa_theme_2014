<ul class="list-inline">
    <li id="login" style="display: none">
        <a href={"/user/login"|ezurl} title="Login">Accedi con il tuo account</a>
    </li>
    {if and(ezmodule( 'user/register' ), fetch( 'user', 'has_access_to', hash( 'module', 'user', 'function', 'register' ) ))}
        <li id="registeruser" style="display: none">
            <a href="{"/user/register"|ezurl(no)}" title="Registrati al sito">Crea il tuo account</a>
        </li>
    {/if}
</ul>

<script>{literal}
$(document).ready(function(){
    var login = $('#login');
    login.find('a').attr('href', login.find('a').attr('href') + '?url='+ ModuleResultUri);
    var register = $('#registeruser');
    var injectUserInfo = function(data){
	    if(data.error_text || !data.content){
            login.show();
            register.show();
		}else{
            login.after('<li id="myprofile"><a href="/user/edit/" title="Visualizza il profilo utente">Il mio profilo</a></li><li id="logout"><a href="/user/logout" title="Logout">Logout ('+data.content.name+')</a></li>');
			if(data.content.has_access_to_dashboard){
                login.after('<li id="dashboard"><a href="/content/dashboard/" title="Pannello strumenti">Pannello strumenti</a></li>');
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