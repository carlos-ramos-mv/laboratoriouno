@extends('layouts.user-master')

@section('title', 'Backup')

@section('css')

    <!-- Plugins css -->
    <link href="{{ URL::asset('/assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />

@endsection

@section('elementos-sidebar')

@endsection

@section('content')

    <div class="container-fluid">
        <div class="row">

            <div class="">
                <h1 class="display-1">Crear un nuevo backup</h1>
            </div>
            <div class="container">
                <div class="mt-3 bg-white p-3">
                    <form class="needs-validation" novalidate method="POST" action="{{ route('admin.backup.store') }}">
                        @csrf
                        <div class="row">
                            <div class="col-lg-8">

                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="users" name="users">
                                    <label class="form-check-label" for="flexCheckDefault">
                                        Users
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="cursos" name="cursos">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        Cursos
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="modulos" name="modulos">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        Módulos
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="temas" name="temas">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        Temas
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="actividades" name="actividades">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        Actividades
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="avances" name="avances">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        Avances
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="rates" name="rates">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        Rates
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="feedbacks" name="feedbacks">
                                    <label class="form-check-label" for="flexCheckChecked">
                                        Feedbacks
                                    </label>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-success waves-effect waves-light">
                            Crear
                        </button>

                    </form>
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
