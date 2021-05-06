@extends('layouts.user-master')

@section('title', 'Editar tema')

@section('css')

@endsection

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">
    <div class="row">

        <div class=""><h1 class="">Editar tema <strong>{{$tema->titulo}}</strong></h1></div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <form class="needs-validation" novalidate method="POST" action="{{route('admin.temas.update',$tema->id)}}">
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
                                <label class="form-label">Introducción</label>
                                <textarea class="form-control" id="descripcion" name="descripcion" required>{{$tema->descripcion}}</textarea>
                                <x-feedback></x-feedback>
                            </div>
    
                            <div class="mb-3">
                                <label class="form-label">Contenido</label>
                                <textarea class="form-control" id="contenido" name="contenido" required>{{$tema->contenido}}</textarea>
                                <x-feedback></x-feedback>
                            </div>
    
                            <x-editar-cancelar></x-editar-cancelar>
    
                        </div>
                    </div>
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
            height: 200,
            menubar: false,
            statusbar: false,
            language: 'es_MX'
        });

        tinymce.init({
            selector: 'textarea#contenido',
            content_css: 'writer',
            height: 400,
            statusbar: false,
            language: 'es_MX'
        });


    </script>

@endsection