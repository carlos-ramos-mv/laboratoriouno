@extends('layouts.user-master')

@section('title', 'Página principal')

@section('elementos-sidebar')
 
<li class="menu-title" key="t-menu" style="color: #fff">Cursos</li>

@foreach ($cursos as $curso)

<li>
    <a href="javascript: void(0);" class="has-arrow waves-effect">
        <i class="bx bx-layout"></i>
        <span key="t-dashboards">{{$curso->nombre}}</span>
    </a>
    <ul class="sub-menu" aria-expanded="false">
        <li><a href="index" key="t-default">Módulo 1</a></li>
        <li><a href="dashboard-saas" key="t-saas">Módulo 2</a></li>
    </ul>
</li>


@endforeach

@endsection

@section('content')

<div class="row">

    @foreach ($cursos as $curso)
        
    <div class="col-md-4">
        <div class="card">
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
                <a href="{{route('curso.show', $curso->id)}}" class="btn btn-primary waves-effect waves-light">Ir al curso</a>
            </div>
        </div>
    </div>


        @endforeach
    
</div>

{{$cursos->links()}}


@endsection