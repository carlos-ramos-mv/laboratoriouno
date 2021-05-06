/******/
(function() { // webpackBootstrap
    /*!************************************************!*\
      !*** ./resources/js/pages/form-editor.init.js ***!
      \************************************************/
    /*
    Template Name: Skote - Admin & Dashboard Template
    Author: Themesbrand
    Website: https://themesbrand.com/
    Contact: themesbrand@gmail.com
    File: Form editor Js File
    */
    $(document).ready(function() {
        if ($("#descripcion").length > 0) {
            tinymce.init({
                selector: "textarea#descripcion",
                language: 'es_MX',
                height: 300,
                statusbar: false,
                plugins: ["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker", "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking", "save table contextmenu directionality emoticons template paste textcolor"],
                toolbar: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | preview media fullpage | forecolor backcolor emoticons",
                style_formats: [{
                    title: 'Code Blocks',
                    items: [{
                        name: 'code-block',
                        title: 'Code Block',
                        block: 'div',
                        classes: ['code-w3 w3-panel w3-card w3-light-grey pythonHigh notranslate']
                    }]
                }],
                style_formats_merge: true
            });
        }

        $('.note-toolbar  [data-toggle=dropdown]').attr("data-bs-toggle", "dropdown");
    });
    $(document).ready(function() {
        if ($("#contenido").length > 0) {
            tinymce.init({
                selector: "textarea#contenido",
                language: 'es_MX',
                height: 300,
                statusbar: false,
                plugins: ["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker", "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking", "save table contextmenu directionality emoticons template paste textcolor"],
                toolbar: "undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | preview media fullpage | forecolor backcolor emoticons",
                style_formats: [{
                    title: 'Code Blocks',
                    items: [{
                        name: 'code-block',
                        title: 'Code Block',
                        block: 'pre',
                        classes: ['pre-w3-code']
                    }]
                }],
                style_formats_merge: true
            });
        }

        $('.note-toolbar  [data-toggle=dropdown]').attr("data-bs-toggle", "dropdown");
    });
    /******/
})();

editor.on('BeforeSetContent', function(e) {
    //Look at this object - it tells you a bunch of stuff about the insert activity
    //such as was it via paste?  Was there selected content in TinyMCE that will be overwritten?  
    //Using the browser tooling you can inspect the e object and learn a lot about the content that will be set.
    console.log(e);

    //Then you can modify that content if you want...for example:
    if (e.content.startsWith("<pre class=\"pre-w3-code\"")) {
        console.log('ADDING CONTENT');
        e.content = '<div class="w3-panel w3-card w3-light-grey pythonHigh notranslate">' + e.content + '</div>';
    }
});