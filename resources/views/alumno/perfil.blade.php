@extends('layouts.user-master')

@section('title', 'Editar perfil')

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class=""><h1 class="display-1">Editar perfil</h1></div>
        <div class="container">
            <div class="mt-3 bg-white p-3">
                <form class="needs-validation" novalidate method="POST" action="{{route('alumno.update')}}">
                    @csrf
                    @method('PUT')
                    <div class="row">
                        <div class="col-lg-10">
                            <div class="mb-3">
                                <label for="useremail" class="form-label">Correo</label>
                                <input type="email" class="form-control" id="useremail"
                                value="{{Auth::user()->email}}" placeholder="ejemplo@mail.com" disabled required>
                            </div>
                            <div class="mb-3 row">
                                <label for="userpassword" class="form-label">Contraseña</label>
                                <div class="col">
                                    <input type="password" class="form-control" id="userpassword" value="*******"
                                        placeholder="Escriba la contraseña" disabled required>
                                </div>
                                <div class="col-md-auto">
                                    <a class="btn btn-success" href="{{route('password.request')}}">Cambiar contraseña</a>
                                </div>
                                
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nombre</label>
                                <input id="nombre" name="nombre" class="form-control" type="text" placeholder="Escriba el nombre" value="{{Auth::user()->name}}" autofocus required>
                                <x-feedback></x-feedback>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Apellido paterno</label>
                                <input id="ap_pat" name="ap_pat" class="form-control" type="text" placeholder="Escriba el apellido paterno" value="{{Auth::user()->ap_pat}}" required>
                                <x-feedback></x-feedback>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Apellido materno</label>
                                <input id="ap_mat" name="ap_mat" class="form-control" type="text" placeholder="Escriba el apellido materno" value="{{Auth::user()->ap_mat}}" required>
                                <x-feedback></x-feedback>
                            </div>
                            <div class="mb-3">
                                <label for="userdob">Fecha de Nacimiento</label>
                                <div class="input-group" id="datepicker1">
                                    <input type="text" class="form-control @error('dob') is-invalid @enderror" placeholder="dd-mm-yyyy"
                                        data-date-format="dd-mm-yyyy" data-date-container='#datepicker1' data-date-end-date="0d" value="{{Auth::user()->dob}}"
                                        data-provide="datepicker" name="dob" autofocus required>
                                    <span class="input-group-text"><i class="mdi mdi-calendar"></i></span>
                                    @error('dob')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
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