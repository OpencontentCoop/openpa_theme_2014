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
{*                            <a href="tel:{$pagedata.contacts.telefono}">*}
                            {def $tel = strReplace($pagedata.contacts.telefono,array(" ",""))}
                            <a href="tel:{$tel}">
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

                    {if is_set($pagedata.contacts.linkedin)}
                        <li>
                            <a href="{$pagedata.contacts.linkedin}">
                                <i class="fa fa-linkedin fa-2x"></i>
                            </a>
                        </li>
                    {/if}

                    {if is_set($pagedata.contacts.instagram)}
                        <li>
                            <a href="{$pagedata.contacts.instagram}">
                                <i class="fa fa-instagram fa-2x"></i>
                            </a>
                        </li>
                    {/if}

                    {*<li><a href="javascript:window.print()" title="Stampa la pagina corrente">Versione stampabile</a></li>*}

                </ul>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-3">
                <form class="navbar-form" action="{"/content/search"|ezurl(no)}" role="search">
                    <div class="input-group">
                        <label class="hide" for="cerca">cerca</label>
                        {if is_area_tematica()}
                          <input type="hidden" value="{is_area_tematica().node_id}" name="SubTreeArray[]" />
                          <input type="text" id="cerca" class="form-control" placeholder="Cerca in {is_area_tematica().name|wash()}" name="SearchText" {if $pagedata.is_edit}disabled="disabled"{/if}>
                        {else}
                          <input type="text" id="cerca" class="form-control" placeholder="Cerca nel sito" name="SearchText" {if $pagedata.is_edit}disabled="disabled"{/if}>
                        {/if}						
                        <div class="input-group-btn">
                            <button class="btn btn-link" type="submit" value="cerca" name="SearchButton" {if $pagedata.is_edit}disabled="disabled"{/if}><i class="fa fa-search fa-lg"></i><span class="hide">Pulsante ricerca</span></button>                          
                            {if eq( $ui_context, 'browse' )}
                                <input name="Mode" type="hidden" value="browse" />
                            {/if}                            
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>
