@extends('layouts.user-master')

@section('title', 'Modulo '.$data['modulo']->nombre)

@section('elementos-sidebar')
    
<li class="menu-title" key="t-menu" style="color: #fff">Temas</li>

@foreach ($data['temas'] as $tema)
    <li><a href="{{route('alumno.tema.show', $tema->id)}}" key="t-saas">{{$tema->titulo}}</a></li>
@endforeach

@endsection

@section('content')

<div class="container d-flex flex-column p-0">

    <div class="container">
        <div>
            <h3 class="">Módulo: {{$data['modulo']->titulo}}</h3>
        </div>
    </div>

</div>
@endsection