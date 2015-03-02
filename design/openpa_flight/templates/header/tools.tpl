<div class="header-top-left">
<ul>
{if $current_user.is_logged_in}

    {if fetch( 'user', 'has_access_to', hash( 'module', 'user', 'function', 'selfedit' ) )}
      <li id="myprofile"><a href={"/user/edit/"|ezurl} title="Visualizza il profilo utente">Profilo utente</a></li>
    {/if}
    
    <li id="logout"><a href={"/user/logout"|ezurl} title="Esegui il logout">Logout <small>({$current_user.contentobject.name|wash})</small></a></li>

  {else}

    {if ezmodule( 'user/login' )}
      <li id="login"><a href={concat("/user/login?url=",$module_result.uri)|ezurl} title="Esegui il login al sito">Accedi con il tuo account</a></li>
    {/if}
    
    {if ezmodule( 'user/register' )}
      <li id="registeruser"><a href={"/user/register"|ezurl} title="Registrati al sito">Crea un account</a></li>
    {/if}

  {/if}
</ul>
</div>