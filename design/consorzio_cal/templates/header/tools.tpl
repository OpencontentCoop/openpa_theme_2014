<div class="header-top-left">
    {if or(
    fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'dashboard' ) ),
    fetch( 'user', 'has_access_to', hash( 'module', 'consiglio', 'function', 'dashboard' ) )
    )}
        <ul>
            {if fetch( 'user', 'has_access_to', hash( 'module', 'content', 'function', 'dashboard' ) )}
                <li><a href={"/content/dashboard/"|ezurl} title="Pannello strumenti">Pannello
                    strumenti</a></li>
            {/if}
            {if fetch( 'user', 'has_access_to', hash( 'module', 'consiglio', 'function', 'dashboard' ) )}
                <li><a href={"/consiglio/dashboard/"|ezurl} title="Pannello strumenti">Gestione
                    sedute</a></li>
            {/if}
        </ul>
    {/if}
</div>