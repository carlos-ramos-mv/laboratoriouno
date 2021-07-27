@extends('layouts.user-master')

@section('title', 'Editar tema')

@section('css')

@endsection

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">
    <div class="row">

        <div class="d-flex justify-content-between">
            <h1 class="display-1">Editar tema <strong>{{$tema->titulo}}</strong></h1>
            <div class="row me-1">
                <span class="col">Publicar tema</span>
                <div class="col form-check form-switch form-switch-md mb-3" dir="ltr">
                    @php
                        $s = "";
                        if($tema->status){
                            $s = "checked";
                        }
                    @endphp
                    <input form="form" class="form-check-input" type="checkbox" id="SwitchCheckSizemd" name="status" {{$s}}>
                </div>
            </div>
        </div>
        </div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <form id="form" class="needs-validation" novalidate method="POST" action="{{route('admin.temas.update',$tema->id)}}">
                    @csrf
                    @method('PUT')
                    <div class="row">
                        <div class="col-lg-8">
    
                            <div class="mb-3">
                                <label class="form-label">Nombre/título del tema</label>
                                <input id="titulo" name="titulo" class="form-control" type="text" placeholder="Escriba el nombre" value="{{$tema->titulo}}" required>
                                <x-feedback></x-feedback>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Breve descripción</label>
                                <textarea class="form-control" 
                                placeholder="Escriba una breve descripcion para la vista preeliminar del curso (max. 100 caracteres)" 
                                name="breveDescripcion" 
                                id="breveDescripcion" 
                                required
                                maxlength="100">{{$tema->breve_descripcion}}</textarea>
                            </div>
    
                        </div>
                    </div>
                    <h2 class="display-2">Estructura general</h2>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Introducción</label>
                                <textarea class="form-control" 
                                id="introduccion" 
                                name="introduccion" 
                                required>{{$tema->introduccion}}</textarea>
                                <x-feedback></x-feedback>
                            </div>
    
                            <div class="mb-3">
                                <label class="form-label">Contenido</label>
                                <textarea class="form-control" 
                                id="contenido" 
                                name="contenido" 
                                required>{{$tema->contenido}}</textarea>
                                <x-feedback></x-feedback>
                            </div>
    
                        </div>
                    </div>
                    <x-editar-cancelar></x-editar-cancelar>
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