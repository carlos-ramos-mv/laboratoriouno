@extends('layouts.user-master')

@section('title', 'Página principal')

@section('css')
    <!-- Bootstrap Rating css -->
    <link href="{{ URL::asset('/assets/libs/bootstrap-rating/bootstrap-rating.min.css') }}" rel="stylesheet" type="text/css" />
@endsection

@section('elementos-sidebar')


@endsection

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="mb-2">
            <div>
                <h1 class="display-1">Tus cursos</h1>
            </div>
        </div>
    
        <div class="p-3">
    
            @if (sizeof($cursosUser)==0)

                <div class="alert alert-warning text-center">
                    No estás inscrito en ningún curso todavía
                </div>
                
            @else
                
            @foreach ($cursosUser as $curso)

            @php
                $rate = 3.6;
                $img = '/assets/images/small/img-4.jpg';
            @endphp

            <x-card-curso :rate="$rate" :img="$img">
                <x-slot name="titulo">{{$curso->nombre}}</x-slot>
                <x-slot name="texto">{{$curso->breve_descripcion}}</x-slot>
                <x-slot name="button">
                    <a href="{{route('alumno.cursos.show', $curso->id)}}" class="btn btn-success waves-effect waves-light">
                        Ir al curso
                    </a>
                </x-slot>
            </x-card-curso>
    
            @endforeach
    
            @endif
    
        </div>

    </div>
    <div class="row">
        <div class="mb-2">
            <div>
                <h1 class="display-1">Cursos disponibles para ti</h1>
            </div>
        </div>        
        <div class="p-3">
    
            @if (sizeof($cursos)==0)

                <div class="alert alert-warning text-center">
                    No hay cursos disponibles todavía
                </div>
            @else
                
            @foreach ($cursos as $curso)

            @php
                $rate = 3.6;
                $img = '/assets/images/small/img-4.jpg';
            @endphp

            <x-card-curso :rate="$rate" :img="$img">
                <x-slot name="titulo">{{$curso->nombre}}</x-slot>
                <x-slot name="texto">{{$curso->breve_descripcion}}</x-slot>
                <x-slot name="button">
                    <a href="{{route('alumno.cursos.show', $curso->id)}}" class="btn btn-success waves-effect waves-light">
                        Ver curso
                    </a>
                </x-slot>
            </x-card-curso>
    
            @endforeach
    
            @endif
    
        </div>
    </div>
</div>


@endsection

@section('script')
    <!-- Bootstrap rating js -->
    <script src="{{ URL::asset('/assets/libs/bootstrap-rating/bootstrap-rating.min.js') }}"></script>

    <script src="{{ URL::asset('/assets/js/pages/rating-init.js') }}"></script>

    
@if (session('curso-finalizado'))
    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('curso-finalizado')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>
@endif
@endsection