@extends('layouts.user-master')

@section('title', 'Agregar módulo')

@section('css')

    <!-- Plugins css -->
    <link href="{{ URL::asset('/assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />

@endsection

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">
    <div class="row">

        <div class=""><h1 class="display-1">Agregar un nuevo módulo</h1></div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <form class="needs-validation" novalidate method="POST" action="{{route('admin.modulos.store')}}">
                    @csrf
                    <div class="row">
                        <div class="col-lg-8">
    
                            <div class="mb-3">
                                <label class="form-label">Número del módulo</label>
                                <input id="numero" name="numero" class="form-control" type="number" placeholder="Escriba el numero" required>
                                <x-feedback></x-feedback>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nombre/título del módulo</label>
                                <input id="titulo" name="titulo" class="form-control" type="text" placeholder="Escriba el nombre" required>
                                <x-feedback></x-feedback>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Breve descripción</label>
                                <textarea class="form-control" 
                                placeholder="Escriba una breve descripcion para la vista preeliminar del módulo (max. 100 caracteres)" 
                                name="breveDescripcion" 
                                id="breve-descripcion" 
                                required
                                maxlength="100"></textarea>
                            </div>
    
                            <input class="form-control" type="hidden" name="curso" id="curso" value="{{$_GET['curso']}}">
    
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Descripción del módulo</label>
                                <textarea class="form-control" id="descripcion" name="descripcion" required></textarea>
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
            selector: 'textarea#descripcion',
            content_css: 'writer',
            height: 350,
            menubar: false,
            statusbar: false,
            language: 'es_MX'
        });


    </script>

@endsection