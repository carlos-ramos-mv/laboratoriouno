@extends('layouts.user-master')

@section('title', 'Agregar tema')

@section('css')

@endsection

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">
    <div class="row">

        <div class=""><h1 class="display-1">Agregar un nuevo tema</h1></div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <form class="needs-validation" novalidate method="POST" action="{{route('admin.temas.store')}}">
                    @csrf
                    <div class="row">
                        <div class="col-lg-8">
    
                            <div class="mb-3">
                                <label class="form-label">Nombre/título del tema</label>
                                <input id="titulo" name="titulo" class="form-control" type="text" placeholder="Escriba el nombre" required>
                                <x-feedback></x-feedback>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Breve descripción</label>
                                <textarea class="form-control" 
                                placeholder="Escriba una breve descripcion para la vista preeliminar del curso (max. 100 caracteres)" 
                                name="breveDescripcion" 
                                id="breveDescripcion" 
                                required
                                maxlength="100"></textarea>
                            </div>
    
                            <input class="form-control" type="hidden" name="modulo" id="modulo" value="{{$_GET['modulo']}}">
    
                        </div>
                    </div>

                    <h2 class="display-2">Estructura general</h2>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Introducción</label>
                                <textarea class="form-control" id="introduccion" name="introduccion" required></textarea>
                                <x-feedback></x-feedback>
                            </div>
    
                            <div class="mb-3">
                                <label class="form-label">Contenido</label>
                                <textarea class="form-control" id="contenido" name="contenido" required></textarea>
                                <x-feedback></x-feedback>
                            </div>
    
                        </div>
                    </div>

                    <x-agregar-cancelar></x-agregar-cancelar>

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
            selector: 'textarea#introduccion',
            content_css: 'writer',
            height: 200,
            plugins: ["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker", "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking", "save table contextmenu directionality emoticons template paste textcolor"],
            statusbar: false,
            language: 'es_MX'
        });

        //menubar: false,

        tinymce.init({
            selector: 'textarea#contenido',
            content_css: 'writer',
            height: 400,
            plugins: ["advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker", "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking", "save table contextmenu directionality emoticons template paste textcolor"],
            statusbar: false,
            language: 'es_MX'
        });


    </script>

@endsection