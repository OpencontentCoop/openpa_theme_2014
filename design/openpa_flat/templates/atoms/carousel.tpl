{set_defaults( hash(
    'i_view', 'carousel',
    'items', array(),
    'show_number', 1
))}

{if and( $root_node, $items )}
    {if $root_node}

        {ezscript_require( array( 'ezjsc::jquery', 'plugins/owl-carousel/owl.carousel.min.js', "plugins/blueimp/jquery.blueimp-gallery.min.js" ) )}
        {ezcss_require( array( 'plugins/owl-carousel/owl.carousel.css', 'plugins/owl-carousel/owl.theme.css', "plugins/blueimp/blueimp-gallery.css" ) )}

    <div id="carousel_{$root_node.node_id}" class="owl-carousel">
        {foreach $items as $item}
            <div class="item">
                {node_view_gui content_node=$item view=$i_view image_class=carousel}
            </div>
        {/foreach}
    </div>

    <script>
        $(document).ready(function() {ldelim}
            $("#carousel_{$root_node.node_id}").owlCarousel({ldelim}
                items : {$show_number},
                itemsDesktop : [1000,{$show_number}], // items between 1000px and 901px
                itemsDesktopSmall : [900,2], // betweem 900px and 601px
                itemsTablet: [600,2], // items between 600 and 0
                itemsMobile : [400,1]
                {rdelim});
            {rdelim});
    </script>


    {/if}

{undef}