@extends('layouts.master-without-nav')

@section('title')
    @lang('translation.Email_verification')
@endsection

@section('body') 

<body>
@endsection

@section('content')

<div class="account-pages my-5 pt-sm-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="mb-4 mb-md-5 d-flex justify-content-center">
                    <a href="{{ route('root') }}" class="d-block auth-logo">
                        <img src="{{ URL::asset('/assets/images/logos/logo-enes-azul.png') }}" alt="logo-enes" height="100">
                        <img src="{{ URL::asset('/assets/images/logos/logo-hpc-sin-texto.png') }}" alt="logo-hpc" height="100" class="ms-5">
                    </a>
                </div>
            </div>
        </div>
        <!-- end row -->
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6 col-xl-5">
                <div class="card">

                    <div class="card-body">

                        <div class="p-2">
                            <div class="text-center">

                                <div class="avatar-md mx-auto">
                                    <div class="avatar-title rounded-circle bg-light">
                                        <i class="bx bxs-envelope h1 mb-0 text-primary"></i>
                                    </div>
                                </div>
                                <div class="p-2 mt-4">
                                    <h4>Verifica tu correo electrónico</h4>
                                    <p>Hemos enviado un correo a <span
                                            class="font-weight-semibold">{{Auth::user()->email}}</span>, Por favor revíselo.</p>
                                    <div class="mt-4">
                                        <a href="{{route('index')}}" class="btn btn-success w-md">Ya lo he verificado</a>
                                    </div>
                                    <div class="mt-3">
                                        <p>Regresar al <a class="fw-medium text-primary" href="{{route('root')}}">inicio</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="mt-3 text-center">
                    @if (session('resent'))
                        <div class="alert alert-success" role="alert">
                            {{ __('A fresh verification link has been sent to your email address.') }}
                        </div>
                    @endif
                    {{ __('If you did not receive the email') }},
                    <form class="d-inline" method="POST" action="{{ route('verification.resend') }}">
                        @csrf
                        <button type="submit" class="btn btn-link p-0 m-0 align-baseline">{{ __('click here to request another') }}</button>.
                    </form>
                </div>
                <div class="mt-5 text-center">
                    <p>© <script>
                        document.write(new Date().getFullYear())

                    </script> Todos los derechos reservados.</p>
                </div>

            </div>
        </div>
    </div>
</div>

@endsection