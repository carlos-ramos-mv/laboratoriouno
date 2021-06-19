@extends('layouts.user-master')

@section('title', 'Curso ' . $curso->nombre)

@section('elementos-sidebar')

    <li class="menu-title" key="" style="color: #fff">Módulos</li>

    @for ($i = 0; $i < sizeof($modulos); $i++)

        @php
            $modulo = $modulos[$i];
        @endphp

        <li>
            <a href="javascript: void(0);" class="has-arrow waves-effect">
                <i class="bx bx-layout"></i>
                <span key="">{{ $modulo->titulo }}</span>
            </a>
            <ul class="sub-menu" aria-expanded="false">

                @for ($j = 0; $j < sizeof($temas[$i]); $j++)

                    @php
                        $tema = $temas[$i][$j];
                    @endphp
                    <li><a href="{{ route('alumno.temas.show', $tema->id) }}" key="">{{ $tema->titulo }}</a></li>

                @endfor

                @if (sizeof($temas[$i]) == 0)
                    <li><a href="#">No hay temas todavía</a></li>
                @endif

            </ul>
        </li>

    @endfor

@endsection

@section('content')

    <div class="container-fluid">
        <div class="row">
            <div>
                <h1 class="display-1 texto-h1">{{ $curso->nombre }}</h1>
            </div>

            <div class="bg-white p-2 mt-3">
                <h3 class="display-3">Progreso total del curso</h3>
                <div class="row me-2 me-sm-0">
                    <div class="progress m-4 col">
                        <div class="progress-bar bg-success" role="progressbar" style="width: {{$curso->pivot->progreso}}%" aria-valuenow="25"
                            aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <span class="col-1 align-self-center">{{$curso->pivot->progreso}}%</span> 
                </div>
            </div>
            <div class="bg-white p-2 mt-3">
                <h3 class="display-3">Módulos</h3>

                @php
                    $i=1;
                @endphp
                @foreach ($modulos as $modulo)
                    <div class="row me-2 me-sm-0">
                        
                        <span class="d-block col-sm-3 align-self-center ms-3 border-end border-secondary texto-p">{{$i}}. {{$modulo->titulo}}</span>
                        <div class="progress m-4 col">
                            
                            <div class="progress-bar" role="progressbar" style="width: {{$modulo->avances[0]->progreso}}%;" aria-valuenow="{{$modulo->avances[0]->progreso}}"
                                aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <span class="col-1 align-self-center">{{$modulo->avances[0]->progreso}}%</span>
                        @if ($modulo->avances[0]->progreso==100 && $modulo->avances[0]->completado)
                            <i class="fa fa-check-circle col-1 align-self-center fs-4 text-success"></i> 
                        @else
                            <i class="fas fa-clock col-1 align-self-center fs-4"></i>
                        @endif

                    </div>
                    @php
                        $i++;
                    @endphp
                @endforeach
                
            </div>
        </div>
    </div>
    
@endsection

@section('script')

@if (session('inscrito'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('inscrito')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@endif


