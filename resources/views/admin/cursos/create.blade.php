@extends('layouts.user-master')

@section('title', 'Crear curso')

@section('css')

    <!-- Plugins css -->
    <link href="{{ URL::asset('/assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />

@endsection

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class=""><h1 class="display-1">Agregar un nuevo curso</h1></div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <form class="needs-validation" novalidate method="POST" action="@role('Admin')
                {{route('admin.cursos.store')}}
                @else
                {{route('instructor.cursos.store')}}
                @endrole">
                    @csrf
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="mb-3">
                                <label class="form-label">Nombre/título del curso</label>
                                <input id="nombre" name="nombre" class="form-control" type="text" placeholder="Escriba el nombre" required>
                                <x-feedback></x-feedback>
                                @error('nombre')
                                <div class="alert alert-danger" role="alert">
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Breve descripción</label>
                                <textarea class="form-control" 
                                placeholder="Escriba una breve descripcion para la vista preeliminar del curso (max. 100 caracteres)" 
                                name="breveDescripcion" 
                                id="breveDescripcion" 
                                required
                                maxlength="100"></textarea>
                                <x-feedback></x-feedback>
                                @error('breveDescripcion')
                                <div class="alert alert-danger" role="alert">
                                    {{ $message }}
                                </div>
                                @enderror
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
    
                            </div> --}}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="mb-3">
                                <label class="form-label">Descripción extendida del curso</label>
                                <textarea class="form-control" id="descripcion" name="descripcion" required></textarea>
                                <x-feedback></x-feedback>
                                @error('descripcion')
                                <div class="alert alert-danger" role="alert">
                                    {{ $message }}
                                </div>
                                @enderror
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
    
     {{-- 
    <!-- Plugins js -->
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
        })
        --}}

@endsection