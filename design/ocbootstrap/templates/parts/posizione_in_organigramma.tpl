<h3><i class="fa fa-sitemap"></i> Posizione nell'organigramma</h3>
{def $organigramma = organigramma($node.contentobject_id)}
{if $organigramma}
<ul class="org-chart">
  <li>
    {include level=0 uri='design:openpa/organigramma_item.tpl' item=$organigramma name=organigramma_item current_id=$node.contentobject_id}
  </li>
</ul>
{/if}

{include name=ruoli struttura=$node uri='design:parts/ruoli_per_struttura.tpl'}