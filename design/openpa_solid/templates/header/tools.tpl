<div class="navtools">
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-8 col-md-offset-1">
                <ul class="list-inline">
                    {if is_area_tematica()}
                        {def $area_tematica_links = fetch( 'content', 'related_objects', hash( 'object_id', is_area_tematica().contentobject_id, 'attribute_identifier', 'area_tematica/link' ))}
                        {if $area_tematica_links|count()}
                            {foreach $area_tematica_links as $link}
                                <li class="hidden-xs hidden-sm">{node_view_gui content_node=$link view="text_linked"}</li>
                            {/foreach}
                        {/if}
                    {else}
                        {foreach $pagedata.header.links as $link}
                            <li class="hidden-xs hidden-sm">{node_view_gui content_node=$link view="text_linked"}</li>
                        {/foreach}
                    {/if}

                    {if is_set( $pagedata.contacts.telefono )}
                        <li>
                            <a href="tel:{$pagedata.contacts.telefono}">
                                <i class="fa fa-phone-square fa-2x"></i>
                                <span class="hidden-xs hidden-sm">{$pagedata.contacts.telefono}</span>
                            </a>
                        </li>
                    {/if}

                    {if is_set( $pagedata.contacts.email )}
                        <li>
                            <a href="mailto:{$pagedata.contacts.email}">
                                <i class="fa fa-envelope-o fa-2x"></i>
                                <span class="hidden-xs hidden-sm">{$pagedata.contacts.email}</span>
                            </a>
                        </li>
                    {/if}

                    {if is_set($pagedata.contacts.facebook)}
                        <li>
                            <a href="{$pagedata.contacts.facebook}">
                                <i class="fa fa-facebook-square fa-2x"></i>
                            </a>
                        </li>
                    {/if}

                    {if is_set($pagedata.contacts.twitter)}
                        <li>
                            <a href="{$pagedata.contacts.twitter}">
                                <i class="fa fa-twitter fa-2x"></i>
                            </a>
                        </li>
                    {/if}

                    {*<li><a href="javascript:window.print()" title="Stampa la pagina corrente">Versione stampabile</a></li>*}

                </ul>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-3">
                <form class="navbar-form" action="{"/content/search"|ezurl(no)}" role="search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Cerca nel sito" name="SearchText" {if $pagedata.is_edit}disabled="disabled"{/if}>

                        <div class="input-group-btn">
                            <button class="btn btn-link" type="submit" name="SearchButton" {if $pagedata.is_edit}disabled="disabled"{/if}><i class="fa fa-search fa-lg"></i></button>
                            <input id="facet_field" name="facet_field" value="class" type="hidden" />
                            {if eq( $ui_context, 'browse' )}
                                <input name="Mode" type="hidden" value="browse" />
                            {/if}
                            {if is_area_tematica()}
                                <input type="hidden" value="{is_area_tematica().node_id}" name="SubTreeArray[]" />
                            {/if}
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>