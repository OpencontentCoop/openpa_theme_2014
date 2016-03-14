{if count($class_filters)|gt(0)}
<div class="widget search_box">    
	{if $node|ne( false() )}
		<h2>Cerca in {$node.name|wash()}</h2>
	{else}
		<h2>Cerca</h2>
	{/if}
  
	{def $class = fetch( 'content', 'class', hash( 'class_id', $class_filters[0] ) )}		
  <div class="widget_content">
    <form id="search-form-box" action="{'content/advancedsearch'|ezurl('no')}" method="get">
      {include name = searchform
         uri = 'design:parts/class_search_form.tpl'
         class = $class			   			   
         subtree = $subtree
         open_advanced = true()
         exclude_attributes = openpaini( 'Attributi', 'EscludiDaRicerca', array() )}
    </form>
  </div>
</div>
{/if}