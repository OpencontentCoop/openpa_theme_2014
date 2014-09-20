<div class="last-modified">
    {$node.object.published|l10n(date)}{if $node.object.modified|gt(sum($node.object.published,86400))} - Ultima modifica: <strong>{$node.object.modified|l10n(date)}</strong>{/if}
</div>