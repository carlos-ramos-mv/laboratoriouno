@extends('layouts.user-master')

@section('title', 'Modulo '.$modulo->nombre)

@section('elementos-sidebar')
    
<li class="menu-title" key="t-menu" style="color: #fff">Temas</li>

@foreach ($temas as $tema)
    <li><a href="{{route('alumno.tema.show', $tema->id)}}" key="t-saas">{{$tema->titulo}}</a></li>
@endforeach

@endsection

@section('content')

<div class="container-fluid">

    <div class="row">
        <div>
            <h3 class="">Módulo: {{$modulo->titulo}}</h3>
        </div>
    </div>

</div>
@endsection