{def $valid_nodes = $block.valid_nodes}
{if $valid_nodes|count()|gt(0)}
{if is_set($block.custom_attributes.color_style)}<div class="color color-{$block.custom_attributes.color_style}">{/if}
<div class="widget widget_tabs {$block.view}">
    
    {if $block.name}<div class="widget_title"><h3>{$block.name}</h3></div>{else}<h3 class="hide">Altre informazioni</h3>{/if}

    <div class="widget_content">
      <ul class="nav nav-tabs">
          {foreach $valid_nodes as $index => $child}
          <li class="{if $index|eq(0)}active{/if}">
              <a href="#{$block.id}-{$child.name|slugize()}" data-toggle="tab" title="{$child.name|wash()}">{$child.name|wash()}</a>
          </li>
          {/foreach}
      </ul>
  
      <div class="tab-content">
          {foreach $valid_nodes as $index => $child}
          <div class="tab-pane{if $index|eq(0)} active{/if}" id="{$block.id}-{$child.name|slugize()}">
              {$child|abstract()}
              <p class="link">
                <a href="{$child.url_alias|ezurl(no)}" title="Link alla pagina {$child.name|wash()}">Leggi</a>
              </p>
          </div>
          {/foreach}
      </div>
    </div>

</div>
{if is_set($block.custom_attributes.color_style)}</div>{/if}
{/if}
