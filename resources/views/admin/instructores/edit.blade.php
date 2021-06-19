@extends('layouts.user-master')

@section('title', 'Editar información de instructor')

@section('css')

    <!-- Plugins css -->
    <link href="{{ URL::asset('/assets/libs/dropzone/dropzone.min.css') }}" rel="stylesheet" type="text/css" />

@endsection

@section('elementos-sidebar')

@endsection

@section('content')


<div class="container-fluid">
    <div class="row">

        <div class=""><h1 class="display-1">Editar información de instructor</h1></div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <form class="needs-validation" novalidate method="POST" action="{{route('admin.instructores.update',$instructor)}}">
                    @csrf
                    @method('PUT')
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="mb-3">
                                <label class="form-label">Nombre</label>
                                <input id="nombre" name="nombre" class="form-control" type="text" placeholder="Escriba el nombre" value="{{$instructor->nombre}}">
                                <x-feedback></x-feedback>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Apellido paterno</label>
                                <input id="apPat" name="apPat" class="form-control" type="text" placeholder="Escriba el apellido paterno" value="{{$instructor->ap_pat}}">
                                <x-feedback></x-feedback>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Apellido materno</label>
                                <input id="apMat" name="apMat" class="form-control" type="text" placeholder="Escriba el apellido materno" value="{{$instructor->ap_mat}}">
                                <x-feedback></x-feedback>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <div class="form-check form-switch form-switch-md mb-3" dir="ltr">
                                    @php
                                        $s = "";
                                        if($instructor->status){
                                            $s = "checked";
                                        }
                                    @endphp
                                    <input class="form-check-input" type="checkbox" id="SwitchCheckSizemd" name="status" {{$s}}>
                                </div>
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
            height: 400,
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