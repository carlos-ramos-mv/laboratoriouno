@extends('layouts.user-master')

@section('title', 'Tema '.$tema->titulo)

@section('elementos-sidebar')
    
<li class="menu-title" key="t-menu" style="color: #fff">Actividades</li>

<li><a href="#" key="t-saas">No hay actividades todavía</a></li>

@endsection

@section('content')

<div class="container-fluid">

    <div class="row">
        <div class="">
            <h3 class="">Tema: {{$tema->titulo}}</h3>
        </div>
        <div class="p-3 bg-white">
            <p>{{$tema->descripcion}}</p>
        </div>
        <div class="p-3 bg-white">
            <p>{{$tema->contenido}}</p>
        </div>
    </div>

</div>
@endsection