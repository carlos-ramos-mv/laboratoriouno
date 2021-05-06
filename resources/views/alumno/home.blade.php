@extends('layouts.user-master')

@section('title', 'Página principal')

@section('elementos-sidebar')


@endsection

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="mb-2">
            <div>
                <h1>Cursos en los que estás inscrito</h1>
            </div>
        </div>
    
        <div class="p-3">
    
            @if (sizeof($cursosUser)==0)

                <div class="alert alert-warning text-center">
                    No estás inscrito en ningún curso todavía
                </div>
                
            @else
                
            @foreach ($cursosUser as $curso)
                
            <div class="col-sm-5 col-md-3">
                <div class="card shadow">
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
    <div class="row">
        <div class="mb-2">
            <div>
                <h1>Cursos disponibles para ti</h1>
            </div>
        </div>        
        <div class="p-3">
    
            @if (sizeof($cursos)==0)

                <div class="alert alert-warning text-center">
                    No hay cursos disponibles todavía
                </div>
            @else
                
            @foreach ($cursos as $curso)
                
            <div class="col-sm-5 col-md-3">
                <div class="card shadow">
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
</div>


@endsection