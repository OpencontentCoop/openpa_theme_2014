{if ezmodule('newsletter','subscribe')}
  {def $newsletter_edition_hash = newsletter_edition_hash()}
	{if $newsletter_edition_hash|count()|gt(0)}
	
	<div class="col-lg-3 col-md-3 col-sm-3 text-center">
		<h2 class="color_light_2 m_bottom_20">Newsletter</h2>
	
		<p class="f_size_medium m_bottom_15">
			Iscriviti alla newsletter, rimani aggiornato sulle ultime
			novità!</p>
	
		<a href={"newsletter/subscribe"|ezurl} class="btn btn-lg btn-primary">Iscriviti ora</a>
	</div>
	
	
	{/if}
  {undef $newsletter_edition_hash}
{/if}
