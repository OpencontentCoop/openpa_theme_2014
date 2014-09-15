<ul class="users-nav">

    {if fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'dashboard' ) )}
        <li><a href={"/content/dashboard/"|ezurl} title="Pannello strumenti">Pannello strumenti</a></li>
    {/if}

    {if $current_user.is_logged_in}

        {if fetch( 'user', 'has_access_to', hash( 'module', 'user', 'function', 'selfedit' ) )}
            <li id="myprofile"><a href={"/user/edit/"|ezurl} title="Visualizza il profilo utente">Il mio profilo</a></li>
        {/if}

        <li id="logout"><a href={"/user/logout"|ezurl} title="Esegui il logout">Logout ( {$current_user.contentobject.name|wash} )</a></li>

    {else}

        {if fetch( 'user', 'has_access_to', hash( 'module', 'user', 'function', 'register' ) )}
            <li id="registeruser"><a href={"/user/register"|ezurl} title="Registrati al sito">Iscriviti</a></li>
        {/if}

        {if fetch( 'user', 'has_access_to', hash( 'module', 'user', 'function', 'login' ) )}
            <li id="login"><a href={concat("/user/login?url=",$module_result.uri)|ezurl} title="Esegui il login al sito">Login</a></li>
        {/if}

    {/if}

</ul>