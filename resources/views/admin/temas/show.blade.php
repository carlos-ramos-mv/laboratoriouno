@extends('layouts.user-master')

@section('title', 'Tema '.$tema->titulo)

@section('elementos-sidebar')
    
@endsection

@section('content')

<div class="container-fluid">
    <div class="row">

        @if (session('status'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('status') }}
            </div>
    
        @elseif (session('tema'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('tema') }}
            </div>
    
        @endif
    
        <div class="d-flex justify-content-between">
            <div>
                <h1 class="display-1">{{$tema->titulo}}</h1>
            </div>
        </div>
        <div class="container">
    
            <div class="mt-2">
    
                {{-- <div id="descripcion">
                    @php
                        echo $modulo->descripcion;
                    @endphp
                </div> --}}
    
                <div class="card" >
                    <div class="card-body">
    
                        <div class="">
                            <h2>Introducción</h2>
                            @php
                                echo $tema->descripcion;
                            @endphp
                        </div>
                        <div class="">
                            <h2>Contenido</h2>
                            @php
                                echo $tema->contenido;
                            @endphp
                        </div>
    
                    </div>
                </div>   
            </div>
        </div>
    </div>
</div>


@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $('#alert-success').hide(3500);
        })
    </script>

@endsection