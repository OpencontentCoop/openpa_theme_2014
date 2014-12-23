<div class="main-nav" role="navigation">
    {if is_area_tematica()}

        {include uri=concat('design:menu/area_tematica_top.tpl')}

    {else}

        <ul class="horizontal_list main_menu clearfix">{def $top_menu_node_ids = openpaini( 'TopMenu', 'NodiCustomMenu', array() )}<li class="menu-item firstli {if $current_node_id|eq(ezini( 'NodeSettings', 'RootNode', 'content.ini' ))}current{/if}"><a title="Link a homepage" href={'/'|ezurl()}><b>Home</b></a></li>{def $top_menu_node_ids_count = $top_menu_node_ids|count()}{if $top_menu_node_ids_count}
{foreach $top_menu_node_ids as $id}{def $tree_menu = tree_menu( hash( 'root_node_id', $id, 'scope', 'top_menu'))}<li class="menu-item{if or($tree_menu.item.node_id|eq($current_node_id), $pagedata.path_id_array|contains($tree_menu.item.node_id))} current{/if}">{include name=top_menu uri='design:menu/top_menu_item.tpl' menu_item=$tree_menu bold=true()}{if $tree_menu.has_children}{if $tree_menu.max_recursion|eq(1)}<div class="sub_menu_wrap"><ul class="sub_menu">{foreach $tree_menu.children as $child}<li>{include name="top_sub_menu" uri='design:menu/top_menu_item.tpl' menu_item=$child}</li>{/foreach}</ul></div>{else}<div class="sub_menu_wrap items-{count($tree_menu.children)}">{foreach $tree_menu.children as $child}<div class="sub_menu-item">{include name="top_sub_menu" uri='design:menu/top_menu_item.tpl' menu_item=$child bold=true()}{if $child.has_children}<ul class="sub_menu">{foreach $child.children as $sub_child}<li>{include name="top_sub_menu" uri='design:menu/top_menu_item.tpl' menu_item=$sub_child}</li>{/foreach}</ul>{/if}</div>{/foreach}</div>{/if}{/if}</li>{undef $tree_menu}{/foreach}{/if}{include uri=concat('design:menu/topmenu_extra_item.tpl')}</ul>

    {/if}
</div>


<!--
<nav role="navigation" class="f_left f_xs_none d_xs_none m_right_35 m_md_right_30 m_sm_right_0">
                  <ul class="horizontal_list main_menu type_2 clearfix">
                    <li class="current relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="index.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Home</b></a>

<div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
  <ul class="sub_menu">
    <li><a class="color_dark tr_delay_hover" href="index.html">Home Variant 1</a></li>
    <li><a class="color_dark tr_delay_hover" href="index_layout_2.html">Home Variant 2</a></li>
    <li><a class="color_dark tr_delay_hover" href="index_layout_wide.html">Home Variant 3</a></li>
    <li><a class="color_dark tr_delay_hover" href="index_corporate.html">Home Variant 4</a></li>
  </ul>
</div>
</li>
<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="index_layout_wide.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Sliders</b></a>

  <div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
    <ul class="sub_menu">
      <li><a class="color_dark tr_delay_hover" href="index_layout_wide.html">Revolution Slider</a></li>
      <li><a class="color_dark tr_delay_hover" href="index.html">Camera Slider</a></li>
      <li><a class="color_dark tr_delay_hover" href="index_layout_2.html">Flex Slider</a></li>
    </ul>
  </div>
</li>
<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="category_grid.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Shop</b></a>

  <div class="sub_menu_wrap top_arrow d_xs_none tr_all_hover clearfix r_corners w_xs_auto">
    <div class="f_left f_xs_none">
      <b class="color_dark m_left_20 m_bottom_5 m_top_5 d_inline_b">Dresses</b>
      <ul class="sub_menu first">
        <li><a class="color_dark tr_delay_hover" href="#">Evening Dresses</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Casual Dresses</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Party Dresses</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Maxi Dresses</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Midi Dresses</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Strapless Dresses</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Day Dresses</a></li>
      </ul>
    </div>
    <div class="f_left m_left_10 m_xs_left_0 f_xs_none">
      <b class="color_dark m_left_20 m_bottom_5 m_top_5 d_inline_b">Accessories</b>
      <ul class="sub_menu">
        <li><a class="color_dark tr_delay_hover" href="#">Bags and Purces</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Belts</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Scarves</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Gloves</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Jewellery</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Sunglasses</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Hair Accessories</a></li>
      </ul>
    </div>
    <div class="f_left m_left_10 m_xs_left_0 f_xs_none">
      <b class="color_dark m_left_20 m_bottom_5 m_top_5 d_inline_b">Tops</b>
      <ul class="sub_menu">
        <li><a class="color_dark tr_delay_hover" href="#">Evening Tops</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Long Sleeved</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Short Sleeved</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Sleeveless</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Tanks</a></li>
        <li><a class="color_dark tr_delay_hover" href="#">Tunics</a></li>
      </ul>
    </div>
    <img src="images/woman_image_1.jpg" class="d_sm_none f_right m_bottom_10" alt="">
  </div>
</li>
<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="category_grid.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Portfolio</b></a>

  <div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
    <ul class="sub_menu">
      <li><a class="color_dark tr_delay_hover" href="portfolio_two_columns.html">Portfolio 2 Columns</a></li>
      <li><a class="color_dark tr_delay_hover" href="portfolio_three_columns.html">Portfolio 3 Columns</a></li>
      <li><a class="color_dark tr_delay_hover" href="portfolio_four_columns.html">Portfolio 4 Columns</a></li>
      <li><a class="color_dark tr_delay_hover" href="portfolio_masonry.html">Masonry Portfolio</a></li>
      <li><a class="color_dark tr_delay_hover" href="portfolio_single_1.html">Single Portfolio Post v1</a></li>
      <li><a class="color_dark tr_delay_hover" href="portfolio_single_2.html">Single Portfolio Post v2</a></li>
    </ul>
  </div>
</li>
<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="category_grid.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Pages</b></a>

  <div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
    <ul class="sub_menu">
      <li><a class="color_dark tr_delay_hover" href="category_grid.html">Grid View Category Page</a></li>
      <li><a class="color_dark tr_delay_hover" href="category_list.html">List View Category Page</a></li>
      <li><a class="color_dark tr_delay_hover" href="category_no_products.html">Category Page Without Products</a></li>
      <li><a class="color_dark tr_delay_hover" href="product_page_sidebar.html">Product Page With Sidebar</a></li>
      <li><a class="color_dark tr_delay_hover" href="full_width_product_page.html">Full Width Product Page</a></li>
      <li><a class="color_dark tr_delay_hover" href="wishlist.html">Wishlist</a></li>
      <li><a class="color_dark tr_delay_hover" href="compare_products.html">Compare Products</a></li>
      <li><a class="color_dark tr_delay_hover" href="checkout.html">Checkout</a></li>
      <li><a class="color_dark tr_delay_hover" href="manufacturers.html">Manufacturers</a></li>
      <li><a class="color_dark tr_delay_hover" href="manufacturer_details.html">Manufacturer Page</a></li>
      <li><a class="color_dark tr_delay_hover" href="orders_list.html">Orders List</a></li>
      <li><a class="color_dark tr_delay_hover" href="order_details.html">Order Details</a></li>
    </ul>
  </div>
</li>
<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="blog.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Blog</b></a>

  <div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
    <ul class="sub_menu">
      <li><a class="color_dark tr_delay_hover" href="blog.html">Blog page</a></li>
      <li><a class="color_dark tr_delay_hover" href="blog_post.html">Single Blog Post page</a></li>
    </ul>
  </div>
</li>
<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="blog.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Features</b></a>
  
  <div class="sub_menu_wrap top_arrow d_xs_none type_2 tr_all_hover clearfix r_corners">
    <ul class="sub_menu">
      <li><a class="color_dark tr_delay_hover" href="features_shortcodes.html">Shortcodes</a></li>
      <li><a class="color_dark tr_delay_hover" href="features_typography.html">Typography</a></li>
    </ul>
  </div>
</li>
<li class="relative f_xs_none m_xs_bottom_5 m_left_10 m_xs_left_0"><a href="contact.html" class="tr_delay_hover color_dark tt_uppercase r_corners"><b>Contact</b></a></li>
</ul>
</nav>
-->