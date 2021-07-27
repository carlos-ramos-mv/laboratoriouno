@extends('layouts.user-master')

@section('title', 'Página principal')

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="mb-2">
            <div>
                <h1 class="display-1">Cursos en progreso</h1>
            </div>
        </div>

        @if (sizeof($cursos)==0)
            <div class="alert alert-warning text-center">
                No estás inscrito en ningún curso todavía
            </div>
        @else
            <div class="p-3 bg-white">
        
                
                    
                @foreach ($cursos as $curso)
        
                @endforeach
        
                
        
            </div>
        @endif
    </div>
</div>


@endsection