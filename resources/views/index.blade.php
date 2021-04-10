@extends('layouts.user-master')

@section('title', 'Página principal')



@section('content')

<div class="cards row">
    <div class="col-md-4">
        <div class="card">
            <img class="card-img-top img-fluid" src="{{ URL::asset('/assets/images/small/img-1.jpg') }}" alt="Card image cap">
            <div class="card-body">
                <h4 class="card-title mt-0">Python</h4>
                <p class="card-text">Tu progreso:</p>
                <div class="progress mb-3">
                    <div class="progress-bar" 
                    role="progressbar" 
                    style="width: 25%" 
                    aria-valuenow="25" 
                    aria-valuemin="0" 
                    aria-valuemax="100">25%</div>
                </div>
                <a href="{{route('curso', $nada='nada')}}" class="btn btn-primary waves-effect waves-light">Ir al curso</a>
            </div>
        </div>
    </div>
    
</div>





@endsection