<h3><i class="fa fa-sitemap"></i> Posizione nell'organigramma</h3>        
<ul class="org-chart">
  <li>
    <div class="vcard">{$node.name|wash()}</div>
    {include node=$node title=false() title=false() icon=false() uri='design:parts/articolazioni_interne.tpl'}
  </li>
</ul>

{include name=ruoli struttura=$node uri='design:parts/ruoli_per_struttura.tpl'}