@extends('layouts.user-master')

@section('title', 'Curso '.$curso->nombre)

@section('elementos-sidebar')
    
<li class="menu-title" key="" style="color: #fff">Módulos</li>


@for ($i = 0; $i < sizeof($modulos); $i++)

    @php
        $modulo = $modulos[$i];
    @endphp

    <li>
        <a href="javascript: void(0);" class="has-arrow waves-effect">
            <i class="bx bx-layout"></i>
            <span key="">{{$modulo->titulo}}</span>
        </a>
        <ul class="sub-menu" aria-expanded="false">

            @for ($j = 0; $j < sizeof($temas[$i]); $j++)

                @php
                    $tema = $temas[$i][$j];
                @endphp
                <li><a href="{{route('alumno.temas.show', $tema->id)}}" key="">{{$tema->titulo}}</a></li>

            @endfor
            
            @if (sizeof($temas[$i]) == 0)
                <li><a href="#">No hay temas todavía</a></li>
            @endif
            
        </ul>
    </li>

@endfor

@endsection

@section('content')

<div class="container d-flex flex-column p-0">

    <div class="container">
        <div>
            <h1>{{$curso->nombre}}</h1>
        </div>
    </div>
    <div class="container">

        <div class="mt-3">
            <p class="fs-4">Progreso del curso</p>
        </div>
        <div class="mt-4">
            <div class="mb-3 fs-5"><p>Módulos</p></div>
            <div class="position-relative m-4">
                <div class="progress" style="height: 3px;">
                    <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>

                @for ($i = 0; $i < sizeof($modulos); $i++)

                    @php

                    $outline = "";
                        switch ($i) {
                            case 0:
                                $porcentaje = 0;
                                break;
                            case sizeof($modulos)-1:
                                $porcentaje = 100;
                                $outline = "-outline";
                                break;
                            default:
                                $porcentaje = 50;
                                $outline = "-outline";
                                break;
                        }
                        
                    @endphp

                    <button type="button"
                    class="position-absolute top-0 start-{{$porcentaje}} translate-middle btn btn-sm btn{{$outline}}-primary rounded-pill"
                    style="width: 2rem; height:2rem;"
                    alt="x">{{$i+1}}</button>
                @endfor

            </div>
        </div>
    </div>

</div>
@endsection