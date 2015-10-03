<ul class="list-inline">
    {if $current_user.is_logged_in}

        {if fetch( 'user', 'has_access_to', hash( 'module', 'user', 'function', 'selfedit' ) )}
            <li id="myprofile"><a href={"/user/edit/"|ezurl} title="Visualizza il
                                  profilo utente">Profilo utente</a></li>
        {/if}

        {if fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'dashboard' ) )}
            <li>
                <a href="{"/content/dashboard/"|ezurl(no)}"
                   title="Pannello strumenti">Strumenti</a>
            </li>
        {/if}
        <li id="logout">
            <a href="{"/user/logout"|ezurl(no)}" title="Esegui il logout">
                Logout
                <small>({$current_user.contentobject.name|wash})</small>
            </a>
        </li>
    {else}

        {if ezmodule( 'user/login' )}
            <li id="login">
                <a href="{concat("/user/login?url=",$module_result.uri)|ezurl(no)}"
                   title="Esegui il login al sito">Accedi con il tuo account</a>
            </li>
        {/if}

        {if ezmodule( 'user/register' )}
            <li id="registeruser">
                <a href="{"/user/register"|ezurl(no)}" title="Registrati al sito">
                    Crea il tuo account</a>
            </li>
        {/if}

    {/if}
</ul>