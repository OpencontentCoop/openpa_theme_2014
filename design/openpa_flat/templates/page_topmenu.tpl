{def $extra_item = cond( is_set( fetch( openpa, homepage ).data_map.menu_button ), fetch( openpa, homepage ).data_map.menu_button.content, false() )}

<div class="container">
  <section id="navigation" class="menu_wrap">

    <button id="menu_button">
        <span class="centered_db "></span>
        <span class="centered_db "></span>
        <span class="centered_db "></span>
    </button>

    {include uri=concat('design:menu/', $pagedata.top_menu, '.tpl')}

  </section>
</div>

{include uri=concat('design:menu/topmenu_extra_modal.tpl')}
