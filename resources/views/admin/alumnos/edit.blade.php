@extends('layouts.user-master')

@section('title', 'Editar alumno')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class=""><h1 class="display-1">Editar alumno <strong>{{$alumno->nombre}}</strong></h1></div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <form class="needs-validation" novalidate method="POST" action="{{route('admin.alumnos.update',$alumno->id)}}">
                    @csrf
                    @method('PUT')
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="mb-3">
                                <label class="form-label">Apellido paterno</label>
                                <input id="ap_pat" name="ap_pat" class="form-control" type="text" placeholder="Escriba el apellido paterno" value="{{$alumno->ap_mat}}" required>
                                <x-feedback></x-feedback>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Apellido materno</label>
                                <input id="ap_mat" name="ap_mat" class="form-control" type="text" placeholder="Escriba el apellido materno" value="{{$alumno->ap_mat}}" required>
                                <x-feedback></x-feedback>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nombre</label>
                                <input id="nombre" name="nombre" class="form-control" type="text" placeholder="Escriba el nombre" value="{{$alumno->nombre}}" required>
                                <x-feedback></x-feedback>
                            </div>
    
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <div class="form-check form-switch form-switch-md mb-3" dir="ltr">
                                    @php
                                        $s = "";
                                        if($alumno->status){
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

@endsection