@extends('layouts.user-master')

@section('title', 'Editar curso')

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
                <h1 class="display-1">Editar curso <strong>{{ $curso->nombre }}</strong></h1>
            </div>
            <div class="container">
                <div class="mt-3 bg-white p-3">
                    <form class="needs-validation" novalidate method="POST"
                        action="{{ route('admin.cursos.update', $curso->id) }}">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="mb-3">
                                    <label class="form-label">Nombre/título del curso</label>
                                    <input id="nombre" name="nombre" class="form-control" type="text"
                                        placeholder="Escriba el nombre" value="{{ $curso->nombre }}" required>
                                    <x-feedback></x-feedback>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Breve descripción</label>
                                    <textarea class="form-control" 
                                    placeholder="Escriba una breve descripcion para la vista preeliminar del curso (max. 100 caracteres)" 
                                    name="breveDescripcion" 
                                    id="breveDescripcion" 
                                    required
                                    maxlength="100">{{ $curso->breve_descripcion }}</textarea>
                                </div>

                                {{-- 
                                <div class="mb-3">
                                    <label class="form-label">Imagen de portada</label>
                                    <div class="dropzone" id="myAwesomeDropzone">
        
                                        <div class="fallback">
                                            <input name="imagen" type="file">
                                        </div>
        
                                        <div class="dz-message needsclick">
                                            <div class="mb-3">
                                                <i class="display-4 text-muted bx bxs-cloud-upload"></i>
                                            </div>
                                            <h4>Arrastra una imagen o da click para cargarla.</h4>
                                        </div>
                                    </div>
                                </div> 
                                --}}
                            </div>
                            
                            <div class="col-lg-4 justify-content-end">

                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="status">
                                    <label class="form-check-label" for="exampleCheck1">Publicar curso</label>
                                </div>
                                {{-- <div class="form-check form-switch pt-4">
                                    <label class="form-check-label" for="flexSwitchCheckDefault">Publicar curso</label>
                                    <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault">
                                </div> --}}
                            </div>
                            
                        </div>

                        <div class="row">
                            <div class="col-lg-12">
                                
                                <div class="mb-3">
                                    <label class="form-label">Descripción extendida del curso</label>
                                    <textarea class="form-control" id="descripcion" name="descripcion"
                                        required>{{ $curso->descripcion }}</textarea>
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
            selector: 'textarea#descripcion',
            content_css: 'writer',
            height: 400,
            menubar: false,
            statusbar: false,
            language: 'es_MX'
        });

    </script>

    {{-- <!-- Plugins js -->
    <script src="{{ URL::asset('/assets/libs/dropzone/dropzone.min.js') }}"></script>

    <script>

        Dropzone.options.myAwesomeDropzone = {
            headers: {
                'X-CSRF-TOKEN' : "{{ csrf_token() }}"
            },
            paramName: "imagen",
            acceptedFiles: ".jpg,.png",
            maxFilesize: 2,
            maxFiles: 1,
            url: "admin/cursos",
        };
        
     </script>

         
Dropzone.autoDiscover = false;
     
        $(document).ready(function () {
             $("#my-awesome-dropzone").dropzone({
                 headers:{
                     'X-CSRF-TOKEN' : "{{csrf_token()}}"
                 },
                 maxFiles: 1,
                 maxFilesize: 2,
                 acceptedFiles: ".jpg,.png",
                 
                 success: function (file, response) {
                     console.log(response);
                 }
             });
        }) --}}

@endsection
