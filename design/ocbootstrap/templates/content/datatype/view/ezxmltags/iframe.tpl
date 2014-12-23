<!--[if lt IE 9 ]>
<iframe src={$source|ezurl('full')} height="{$height}" frameborder="0"
                                    {if and( is_set( $allow_full_screen ), eq( $allow_full_screen, '1' ) )}webkitAllowFullScreen mozallowfullscreen allowFullScreen{/if} ></iframe>
<![endif]-->

<!--[if gt IE 8 ]><!-->
<iframe src={$source|ezurl('full')} height="{$height}"
                                    {if and( is_set( $allow_full_screen ), eq( $allow_full_screen, '1' ) )}webkitAllowFullScreen mozallowfullscreen allowFullScreen{/if} ></iframe>

<!--<![endif]-->