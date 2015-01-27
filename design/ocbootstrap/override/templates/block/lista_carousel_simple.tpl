{def $openpa= object_handler($block)}
{set_defaults(hash('show_title', true()))}

{if and( $show_title, $block.name|ne('') )}
  <h3 class="widget_title"><a href={$openpa.root_node.url_alias|ezurl()}>{$block.name|wash()}</a></h3>    
{/if}

{include name="carousel"
        uri='design:atoms/carousel.tpl'
        items=$openpa.content
        css_id=$block.id
        root_node=$openpa.root_node
        autoplay=10000
        pagination=true()
        navigation=false()
        i_view=carousel_simple
        image_class=small
        items_per_row=1}

{unset_defaults(array('show_title'))}