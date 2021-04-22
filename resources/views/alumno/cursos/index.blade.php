@extends('layouts.user-master')

@section('title', 'Página principal')

@section('elementos-sidebar')
 
<li class="menu-title" key="t-menu" style="color: #fff">Cursos</li>

@if (sizeof($cursos)==0)
<li>
    <p class="ms-5">No hay ningún curso</p>
</li>
@else

@foreach ($cursos as $curso)

<li>
    <a href="javascript: void(0);" class="has-arrow waves-effect">
        <i class="bx bx-layout"></i>
        <span key="">{{$curso->nombre}}</span>
    </a>
    <ul class="sub-menu" aria-expanded="false">
        <li><a href="#" key="">Módulo 1</a></li>
        <li><a href="#" key="">Módulo 2</a></li>
    </ul>
</li>


@endforeach

@endif



@endsection

@section('content')

<div class="">

    <div class="container mb-2">
        <div>
            <h1>Cursos en progreso</h1>
        </div>
    </div>

    <div class="row p-3 bg-white">


        @if (sizeof($cursos)==0)
            <div class="col-sm-5 col-md-3">
                <div class="card shadow lg">
                    <div class="card-body">
                        No estás registrado en ningún curso.
                    </div>
                </div>
            </div>
        @else
            
        @foreach ($cursos as $curso)
            
        <div class="col-sm-5 col-md-3">
            <div class="card shadow-lg">
                <img class="card-img-top img-fluid" src="{{ URL::asset('/assets/images/small/img-1.jpg') }}" alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title mt-0">{{$curso->nombre}}</h4>
                    <p class="card-text">Tu progreso:</p>
                    <div class="progress mb-3">
                        <div class="progress-bar" 
                        role="progressbar" 
                        style="width: 25%" 
                        aria-valuenow="25" 
                        aria-valuemin="0" 
                        aria-valuemax="100">25%</div>
                    </div>
                    <a href="{{route('alumno.cursos.show', $curso->id)}}" class="btn btn-primary waves-effect waves-light">Ir al curso</a>
                </div>
            </div>
        </div>


        @endforeach

        @endif

        

    </div>
    
</div>


@endsection