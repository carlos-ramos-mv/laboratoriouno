@extends('layouts.master-without-nav')

@section('title')
    @lang('translation.Recover_Password')
@endsection

@section('css')
    <!-- owl.carousel css -->
    <link rel="stylesheet" href="{{ URL::asset('/assets/libs/owl.carousel/owl.carousel.min.css') }}">
@endsection

@section('body')

    <body class="auth-body-bg">
    @endsection

    @section('content')

        <div>
            <div class="container-fluid p-0">
                <div class="row g-0 justify-content-center">

                    <div class="col-md-6 col-xl-4">
                        <div class="auth-full-page-content p-md-5 p-4">
                            <div class="w-100">

                                <div class="d-flex flex-column h-100">
                                    <div class="mb-2 mb-md-3 d-flex justify-content-center">
                                        <a href="{{ route('root') }}" class="d-block auth-logo">
                                            <img src="{{ URL::asset('/assets/images/logos/logo-enes-azul.png') }}" alt="logo-enes" height="100">
                                            <img src="{{ URL::asset('/assets/images/logos/logo-hpc-sin-texto.png') }}" alt="logo-hpc" height="100" class="ms-5">
                                        </a>
                                    </div>
                                    <div class="my-auto">

                                        <div>
                                            <h5 class="text-primary">Cambiar contraseña</h5>
                                        </div>

                                        <div class="mt-4">
                                            @if (session('status'))
                                                <div class="alert alert-success text-center mb-4" role="alert">
                                                    {{ session('status') }}
                                                </div>
                                            @endif
                                            <form class="form-horizontal" method="POST"
                                                action="{{ route('password.email') }}">
                                                @csrf
                                                <div class="mb-3">
                                                    <label for="useremail" class="form-label">Email</label>
                                                    <input type="email"
                                                        class="form-control @error('email') is-invalid @enderror"
                                                        id="useremail" name="email" placeholder="Introduzca su email"
                                                        value="{{ old('email') }}" id="email">
                                                    @error('email')
                                                        <span class="invalid-feedback" role="alert">
                                                            <strong>{{ $message }}</strong>
                                                        </span>
                                                    @enderror
                                                </div>

                                                <div class="text-end">
                                                    <button class="btn btn-primary w-md waves-effect waves-light"
                                                        type="submit">Cambiar</button>
                                                </div>

                                            </form>
                                            <div class="mt-5 text-center">
                                                <p>¿La recordaste?<a href="{{ url('login') }}"
                                                        class="font-weight-medium text-primary">Inicia sesión aquí</a> </p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="mt-4 mt-md-5 text-center">
                                        <p class="mb-0">© <script>
                                            document.write(new Date().getFullYear())

                                        </script> Todos los derechos reservados</p>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                    <!-- end col -->
                </div>
                <!-- end row -->
            </div>
            <!-- end container-fluid -->
        </div>

    @endsection

    @section('script')
        <!-- owl.carousel js -->
        <script src="{{ URL::asset('/assets/libs/owl.carousel/owl.carousel.min.js') }}"></script>
        <!-- auth-2-carousel init -->
        <script src="{{ URL::asset('/assets/js/pages/auth-2-carousel.init.js') }}"></script>
    @endsection
