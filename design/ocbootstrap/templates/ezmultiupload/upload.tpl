{*
{ezscript_require( array( 'ezjsc::jquery', 'ezjsc::jqueryio', 'ezjsc::jqueryUI', 'plugins/jquery.fileupload/jquery.fileupload.js' ) )}
{ezcss_require( 'plugins/jquery.fileupload/jquery.fileupload.css' )}
<script type="text/javascript">
    {literal}
    $(function () {
        'use strict';
        var $multiuploadContainer = $('#multiupload-container');
        $('#multiupload').fileupload({
            url: {/literal}{concat('ocbtools/multiupload/', $parent_node.node_id)|ezurl()}{literal},
            acceptFileTypes: "{/literal}{$parent_node.class_identifier|multiupload_file_types_string()}{literal}",
            dataType: 'json',
            submit: function (e, data) {
                $(".spinner").show();
                $(".add").hide();
            },
            done: function (e, data) {
                if (data.result.errors.length > 0 || data == 'error') {
                    alert('Error');
                    $multiuploadContainer.find(".spinner").hide();
                    $multiuploadContainer.find(".add").show();
                } else {
                    var container = $multiuploadContainer.find(".spinner").hide();
                    var id = data.result.contentobject_id;
                    $.ez('ezjsctemplate::multiupload_thumbnail::' + id +'::?ContentType=json', false, function (content) {
                        if (content.error_text.length) {
                            alert(content.error_text);
                        } else {
                            $('#multiupload-results').append(content.content);
                        }
                        $multiuploadContainer.find(".spinner").hide();
                        $multiuploadContainer.find(".add").show();
                    });
                }
            }
        }).prop('disabled', !$.support.fileInput).parent().addClass($.support.fileInput ? undefined : 'disabled');
    });
    {/literal}
</script>


<div class="row">
    <div class="col-md-12">
        <h1 class="long">{'Multiupload'|i18n('extension/ezmultiupload')}</h1>


        <p>{'The files are uploaded to'|i18n('extension/ezmultiupload')}
            <a href={$parent_node.url_alias|ezurl}>{$parent_node.name|wash}</a>
        </p>

        <div id="multiupload-container">
            <span class="btn btn-success fileinput-button">
                <i class="add glyphicon glyphicon-plus"></i>
                <i class="spinner fa a fa-circle-o-notch fa-spin" style="display: none"></i>
                <span>Aggiungi file</span>
                <!-- The file input field used as target for the file upload widget -->
                <input id="multiupload" type="file" name="files[]" multiple>
            </span>
        </div>

        <div id="multiupload-results" class="row panels-container">
        </div>

    </div>
</div>
*}


{ezscript_require( 'ezjsc::yui2' )}
{ezcss_require( 'ezmultiupload.css' )}
<script type="text/javascript">
    (function(){ldelim}
        YUILoader.addModule({ldelim}
            name: 'ezmultiupload',
            type: 'js',
            fullpath: '{"javascript/ezmultiupload.js"|ezdesign( 'no' )}',
            requires: ["utilities", "json", "uploader"],
            after: ["uploader"],
            skinnable: false
            {rdelim});

        // Load the files using the insert() method and set it up and init it on success.
        YUILoader.insert({ldelim}
            require: ["ezmultiupload"],
            onSuccess: function()
            {ldelim}
                YAHOO.ez.MultiUpload.cfg = {ldelim}
                    swfURL:"{concat( ezini('eZJSCore', 'LocalScriptBasePath', 'ezjscore.ini').yui2, 'uploader/assets/uploader.swf' )|ezdesign( 'no' )}",
                    uploadURL: "{concat( 'ezmultiupload/upload/', $parent_node.node_id )|ezurl( 'no' )}",
                    uploadVars: {ldelim}
                        '{$session_name}': '{$session_id}',
                        //'XDEBUG_SESSION_START': 'XDEBUG_ECLIPSE',
                        'UploadButton': 'Upload',
                        'ezxform_token': '@$ezxFormToken@'
                        {rdelim},
                    // Filter is passed on to uploader.setFileFilter() in ez.MultiUpload
                    fileType: [{ldelim} description:"{'Allowed Files'|i18n('extension/ezmultiupload')|wash('javascript')}", extensions:'{$file_types}' {rdelim}],
                    progressBarWidth: "300",
                    allFilesRecived:  "{'All files received.'|i18n('extension/ezmultiupload')|wash(javascript)}",
                    uploadCanceled:   "{'Upload canceled.'|i18n('extension/ezmultiupload')|wash(javascript)}",
                    thumbnailCreated: "{'Thumbnail created.'|i18n('extension/ezmultiupload')|wash(javascript)}",
                    flashError: "{'Could not load flash(or not loaded yet), this is needed for multiupload!'|i18n('extension/ezmultiupload')}"
                    {rdelim};
                YAHOO.ez.MultiUpload.init();
                {rdelim},
            timeout: 10000
            {rdelim}, "js");
        {rdelim})();
</script>

<div class="border-box">
    <div class="border-tl"><div class="border-tr"><div class="border-tc"></div></div></div>
    <div class="border-ml"><div class="border-mr"><div class="border-mc float-break">

                <div class="content-view-ezmultiupload">
                    <div class="class-frontpage">

                        <div class="attribute-header">
                            <h1 class="long">{'Multiupload'|i18n('extension/ezmultiupload')}</h1>
                        </div>
                        <div class="attribute-description">
                            <p>{'The files are uploaded to'|i18n('extension/ezmultiupload')} <a href={$parent_node.url_alias|ezurl}>{$parent_node.name|wash}</a></p>
                            <div id="uploadButtonOverlay" style="position: absolute; z-index: 2"></div>
                            <button id="uploadButton" type="button" style="z-index: 1">{'Select files'|i18n('extension/ezmultiupload')}</button>
                            <button id="cancelUploadButton" type="button">{'Cancel'|i18n('extension/ezmultiupload')}</button>
                            <p><noscript><em style="color: red;">{'Javascript has been disabled, this is needed for multiupload!'|i18n('extension/ezmultiupload')}</em></noscript></p>
                        </div>
                        <div id="multiuploadProgress">
                            <p><span id="multiuploadProgressFile">&nbsp;</span>&nbsp;
                                <span id="multiuploadProgressFileName">&nbsp;</span></p>
                            <p id="multiuploadProgressMessage">&nbsp;</p>
                            <div id="multiuploadProgressBarOutline"><div id="multiuploadProgressBar"></div></div>
                        </div>
                        <div id="thumbnails"></div>
                    </div>
                </div>

            </div></div></div>
    <div class="border-bl"><div class="border-br"><div class="border-bc"></div></div></div>
</div>



