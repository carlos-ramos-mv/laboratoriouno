@extends('layouts.master-without-nav')

@section('title')
    Inactivo
@endsection

@section('body')

    <body>

@endsection

@section('content')

        <div class="account-pages my-5 pt-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center mb-5">
                            <h1 class="mt-5">Tu cuenta debe de estar <strong>activada</strong> para continuar</h1>
                            <p>Verifica con un administrador que tu cuenta ya haya sido activada.</p>
                            <i class="mdi mdi-account-off-outline" style="font-size: 8rem; color: ;"></i>
                            <div class="mt-5 text-center">
                                <form action="{{route('logout')}}" method="POST">
                                    @csrf
                                    <button type="submit" class="btn btn-primary waves-effect waves-light">Volver al inicio</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
@endsection

