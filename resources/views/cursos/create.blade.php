@extends('layouts.user-master')

@section('title', 'Crear curso')

@section('css')


    <!-- Plugins css -->
    <link href="{{ URL::asset('/assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />

@endsection

@section('elementos-sidebar')

@endsection

@section('content')


<div class="container p-0" style="border: solid 2px red">

    <div class=""><h1 class="">Agregar un nuevo curso</h1></div>
    <div class="mt-3 bg-white p-3">
        <form class="needs-validation" action="{{route('curso.add')}}" method="POST" novalidate>
            @csrf
            <div class="row">
                <div class="col-lg-6">
                    <div class="mb-3">
                        <label class="form-label">Nombre/título del curso</label>
                        <input id="nombre-curso" name="nombre-curso" class="form-control" type="text" placeholder="Escriba el nombre" required>
                        <x-feedback></x-feedback>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Descripción del curso</label>
                        <textarea class="form-control" id="descripcion-curso" name="descripcion-curso" required></textarea>
                        <x-feedback></x-feedback>
                    </div>

                    <div class="dropzone mb-3" id="id_dropzone">
                        <div class="fallback">
                            <input name="file" type="file" multiple="multiple">
                        </div>
                        <div class="dz-message needsclick">
                            <div class="mb-3">
                                <i class="display-4 text-muted bx bxs-cloud-upload"></i>
                            </div>

                            <h4>Arrastra una imagen o da click para cargarla.</h4>
                        </div>
                    </div>
                    <x-agregar-cancelar></x-agregar-cancelar>

                </div>

            </div>
        </form>
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
    <!-- Plugins js -->
    <script src="{{ URL::asset('/assets/libs/dropzone/dropzone.min.js') }}"></script>

    <script type="text/javascript">

        Dropzone.autoDiscover = false;
     
        $(document).ready(function () {
             $("#id_dropzone").dropzone({
                 maxFiles: 1,
                 acceptedFiles: "image/png",
                 url: "/curso/add",
                 success: function (file, response) {
                     console.log(response);
                 }
             });
        })
        
     </script>

@endsection