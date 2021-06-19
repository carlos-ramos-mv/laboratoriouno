@extends('layouts.plantilla-inicio')

{{-- VISTA PRINCIPAL DEL LABORATORIO VIRTUAL --}}

@section('title', 'Inicio')

@section('styles')

    {{-- <!-- Styles --> --}}
    <link href={{ asset('assets/css/header-particle/core.min.css') }} rel="stylesheet">
    <link href={{ asset('assets/css/header-particle/thesaas.min.css') }} rel="stylesheet">
    <link href={{ asset('assets/css/header-particle/style.css') }} rel="stylesheet">
    <link href={{ asset('assets/css/custom.css') }} rel="stylesheet">
@endsection
    
@section('favicons')

    {{-- <!-- Favicons --> --}}
    <link rel="apple-touch-icon" href={{ asset('assets/images/logos/logo-enes-oro.png') }}>
    <link rel="icon" href={{ asset('assets/images/logos/logo-enes-oro.png') }}>

@endsection
    
  @section('content')
      
  <body>

    {{-- <!-- Topbar --> --}}
    <nav class="topbar topbar-inverse topbar-expand-md topbar-sticky">
      <div class="container">
        
        <div class="topbar-left">
          <button class="topbar-toggler">&#9776;</button>
          <a class="topbar-brand" href="">
            <img class="logo-default" src={{ asset('assets/images/logos/logo-enes-azul.png') }} alt="logo">
            <img class="logo-default" src={{ asset('assets/images/logos/logo-hpc-texto-azul.png') }} alt="logo">
            <img class="logo-inverse" src={{ asset('assets/images/logos/logo-enes-blanco.png') }} alt="logo">
            <img class="logo-inverse" src={{ asset('assets/images/logos/logo-hpc-texto-blanco.png') }} alt="logo">
          </a>
        </div>


        <div class="topbar-right">

          <ul class="topbar-nav nav">

            <li class="nav-item"><a class="nav-link active" href="/">Inicio</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Lorem</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Ipsum</a></li>
            <li class="nav-item"><a class="nav-link" href="#">Nuestro Equipo</a></li>
            <li class="nav-item"><a class="nav-link" href="{{ route('register') }}">Registro</a></li>
            <li class="nav-item"><a class="nav-link" href="{{ route('login') }}">Iniciar sesión</a></li>
          
          </ul>

        </div>

      </div>
    </nav>
    {{-- <!-- END Topbar --> --}}


    {{-- <!-- Header --> --}}
    <header class="header header-inverse h-fullscreen pb-80" style="background-color: #111d2e">
      <canvas class="constellation"></canvas>

      <div class="container text-center">

        <div class="row h-full">
          <div class="col-12 col-lg-8 offset-lg-2 align-self-center">

            <h1 class="display-1 hidden-sm-down" style="font-size: 2.5rem">Laboratorio virtual para la enseñanza de matemáticas y programación</h1>
            <h1 class="display-1 hidden-md-up" style="font-size: 2.5rem">Laboratorio virtual para la enseñanza de matemáticas y programación</h1>
            <br>
            {{-- 
            <p class="fs-20 w-400 mx-auto hidden-sm-down">Is an elegant, modern and fully customizable SaaS and WebApp template</p>
            <p class="fs-16 w-250 mx-auto hidden-md-up">Is an elegant, modern and fully customizable SaaS and WebApp template</p>
             --}}

            <hr class="w-80">
            <br>

            {{-- <a class="btn btn-xl btn-round btn-white w-200 hidden-sm-down" href="#">See Demos</a>
            <a class="btn btn-lg btn-round btn-white w-200 hidden-md-up" href="#">See Demos</a> --}}

          </div>

          <div class="col-12 align-self-end text-center">
            <a class="scroll-down-1 scroll-down-inverse" href="#" data-scrollto="section-intro"><span></span></a>
          </div>

        </div>

      </div>
    </header>
    {{-- <!-- END Header --> --}}


    {{-- <!-- Main container --> --}}
    <main class="main-content">



      <section class="section bb-1 text-center">
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, esse repudiandae odit cumque sed temporibus iure nulla corrupti incidunt iste rem illo ducimus assumenda odio excepturi quam sint nobis vitae?</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, esse repudiandae odit cumque sed temporibus iure nulla corrupti incidunt iste rem illo ducimus assumenda odio excepturi quam sint nobis vitae?</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, esse repudiandae odit cumque sed temporibus iure nulla corrupti incidunt iste rem illo ducimus assumenda odio excepturi quam sint nobis vitae?</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, esse repudiandae odit cumque sed temporibus iure nulla corrupti incidunt iste rem illo ducimus assumenda odio excepturi quam sint nobis vitae?</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, esse repudiandae odit cumque sed temporibus iure nulla corrupti incidunt iste rem illo ducimus assumenda odio excepturi quam sint nobis vitae?</p>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos, esse repudiandae odit cumque sed temporibus iure nulla corrupti incidunt iste rem illo ducimus assumenda odio excepturi quam sint nobis vitae?</p>
        
        
        {{-- <div class="container">
          <div class="alert alert-info">
            <strong>Dark Particle</strong>
            <p>To have dark colored particles, add <code>data-color="dark"</code> to the .constellation canvas.</p>
          </div>
        </div> --}}
      </section>


      {{-- <!--
      |‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒
      | More Header
      |‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒‒
      !--> --}}

    </main>
    {{-- <!-- END Main container --> --}}


    {{-- <!-- Footer --> --}}
    <footer class="site-footer">
      <div class="container">
        <div class="row gap-y align-items-center">
          <div class="col-12 col-lg-3">
            <p class="text-center text-lg-left">
              <a href="index.html"><img src="assets/img/logo.png" alt="logo"></a>
            </p>
          </div>

          <div class="col-12 col-lg-6">
            <ul class="nav nav-primary nav-hero">
              <li class="nav-item">
                <a class="nav-link" href="index.html">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="blog.html">Blog</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="block-feature.html">Features</a>
              </li>
              <li class="nav-item hidden-sm-down">
                <a class="nav-link" href="page-pricing.html">Pricing</a>
              </li>
              <li class="nav-item hidden-sm-down">
                <a class="nav-link" href="page-contact.html">Contact</a>
              </li>
            </ul>
          </div>

          <div class="col-12 col-lg-3">
            <div class="social text-center text-lg-right">
              <a class="social-facebook" href="https://www.facebook.com/thethemeio"><i class="fa fa-facebook"></i></a>
              <a class="social-twitter" href="https://twitter.com/thethemeio"><i class="fa fa-twitter"></i></a>
              <a class="social-instagram" href="https://www.instagram.com/thethemeio/"><i class="fa fa-instagram"></i></a>
              <a class="social-dribbble" href="https://dribbble.com/thethemeio"><i class="fa fa-dribbble"></i></a>
            </div>
          </div>
        </div>
      </div>
    </footer>
    {{-- <!-- END Footer --> --}}


    {{-- <!-- Scripts --> --}}
    <script src={{ URL::asset('assets/js/header-particle/core.min.js') }}></script>
    <script src={{ URL::asset('assets/js/header-particle/thesaas.min.js') }}></script>
    <script src={{ URL::asset('assets/js/header-particle/script.js') }}></script>

  </body>

  @endsection