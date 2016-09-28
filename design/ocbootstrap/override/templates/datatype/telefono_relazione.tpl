{def $telefoni = api_search(concat("classes [telefono] and utente.id = '",$attribute.contentobject_id,"'"))}
{foreach $telefoni.searchHits as $telefono}{$telefono.metadata.name['ita-IT']}{delimiter}, {/delimiter}{/foreach}
{undef $telefoni}