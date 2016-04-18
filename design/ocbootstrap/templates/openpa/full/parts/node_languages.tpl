{def $node_languages = $node.object.languages}
{if $node_languages|count()|gt(1)}
    <div class="pull-right">
        <ul class="list-inline">
            {foreach $node_languages as $language}
                {if and( $language.locale|ne($node.object.current_language), $node.object.available_languages|contains($language.locale) )}
                    <li>
                        <a href="{concat( $node.url_alias, '/(language)/', $language.locale )|ezurl(no)}">
                            <small><img src="{$language.locale|flag_icon}" width="18" height="12" alt="{$language.locale}" /> {$language.name|wash()}</small>
                        </a>
                    </li>
                {/if}
            {/foreach}
        </ul>
    </div>
{/if}
{undef $node_languages}