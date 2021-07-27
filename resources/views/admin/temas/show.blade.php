@extends('layouts.user-master')

@section('title', 'Tema '.$tema->titulo)

@section('elementos-sidebar')
    
@endsection

@section('content')

<div class="container-fluid">
    <div class="row">
    
        <div class="d-flex justify-content-between">
            <div>
                <h1 class="display-1">{{$tema->titulo}}</h1>
            </div>
        </div>
        <div class="container">
    
            <div class="mt-2">
    
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

@if (session('status'))
    
    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('status')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('actividad-store'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('actividad-store')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('actividad-update'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('actividad-update')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('actividad-delete'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('actividad-delete')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@endif

@section('script')
    <script>
        $(document).ready(function(){
            $('#alert-success').hide(3500);
        })
    </script>

@endsection