@extends('layouts.user-master')

@section('title', 'Restore')

@section('css')

    <!-- Plugins css -->
    <link href="{{ URL::asset('/assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />

@endsection

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">
    <div class="row">

        <div class=""><h1 class="display-1">Restore data base</h1></div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <x-data-table>
                    <table class="table align-middle mb-0">

                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Date</th>
                                <th>Tables</th>
                                <th>Autor</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </x-data-table>
            </div>
        </div>
    
    </div>
</div>

@endsection

@section('script')

    <script src="{{ URL::asset('/assets/libs/parsleyjs/parsleyjs.min.js') }}"></script>

    <script src="{{ URL::asset('/assets/js/pages/form-validation.init.js') }}"></script>
    <!--tinymce js-->
    <script src="{{ URL::asset('assets/libs/tinymce/tinymce.min.js') }}"></script>
    <!-- init js -->
    <script src="{{ URL::asset('assets/js/pages/form-editor.init.js') }}"></script>

    <script>

        tinymce.init({
            selector: 'textarea#descripcion',
            content_css: 'writer',
            height: 350,
            menubar: false,
            statusbar: false,
            language: 'es_MX'
        });


    </script>

@endsection