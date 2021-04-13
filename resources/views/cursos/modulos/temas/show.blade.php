@extends('layouts.user-master')

@section('title', 'Tema '.$tema->titulo)

@section('elementos-sidebar')
    
<li class="menu-title" key="t-menu" style="color: #fff">Actividades</li>

<li><a href="#" key="t-saas">No hay actividades todavía</a></li>
{{-- @foreach ($data['temas'] as $tema)
    <li><a href="#" key="t-saas">{{$tema->titulo}}</a></li>
@endforeach --}}

@endsection

@section('content')

<div class="container d-flex flex-column p-0">

    <div class="container">
        <div>
            <h3 class="">Tema: {{$tema->titulo}}</h3>
        </div>
        <div>
            <p>{{$tema->descripcion}}</p>
        </div>
        <div>
            <p>{{$tema->contenido}}</p>
        </div>
    </div>

</div>
@endsection