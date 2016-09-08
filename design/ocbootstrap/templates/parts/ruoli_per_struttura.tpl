{def $roles = fetch( 'openpa', 'ruoli', hash( 'struttura_object_id', $struttura.contentobject_id ) )}    
{if or( $roles|count(), and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content ) )}
<div class="attribute-ruoli">
    {if $roles|count()}
        <h3><i class="fa fa-sitemap"></i> Ruoli</h3>
        {foreach $roles as $item}
          <dl class="dl-horizontal">
            <dt>{$item.name|wash()}</dt>
            <dd>
              <a href= {$item.url_alias|ezurl()}>
                  {attribute_view_gui attribute=$item.data_map.utente}
              </a>
            </dd>
          </dl>
        
        {/foreach}
        
    {elseif and( is_set( $struttura.data_map.responsabile ), $struttura.data_map.responsabile.has_content )}
          <h3><i class="fa fa-sitemap"></i> Ruoli</h3>       
          <dl class="dl-horizontal">
            <dt>{$struttura.data_map.responsabile.contentclass_attribute_name}</dt>
            <dd>
            {if $struttura.data_map.responsabile.has_content}
                {attribute_view_gui attribute=$struttura.data_map.responsabile}
            {/if}
            </dd>
          </dl>
       
    {/if}
</div>
{/if}
