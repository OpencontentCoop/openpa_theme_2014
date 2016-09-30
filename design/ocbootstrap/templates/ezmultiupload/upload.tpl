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

