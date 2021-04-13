@extends('layouts.user-master')

@section('title', 'Curso '.$data[0]->nombre)

@section('elementos-sidebar')
    
<li class="menu-title" key="t-menu" style="color: #fff">Módulos</li>


@for ($i = 0; $i < sizeof($data[1]); $i++)

    @php
        $modulo = $data[1][$i];
    @endphp

    <li>
        <a href="javascript: void(0);" class="has-arrow waves-effect">
            <i class="bx bx-layout"></i>
            <span key="t-dashboards">{{$modulo->titulo}}</span>
        </a>
        <ul class="sub-menu" aria-expanded="false">

            @for ($j = 0; $j < sizeof($data[2][$i]); $j++)

                @php
                    $tema = $data[2][$i][$j];
                @endphp
                <li><a href="{{route('tema.show', $tema->id)}}" key="t-saas">{{$tema->titulo}}</a></li>

            @endfor
            
            @if (sizeof($data[2][$i]) == 0)
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
            <h1>{{$data[0]->nombre}}</h1>
        </div>
        <div>
            <h3 class="">por: Dr. Ulises</h3>
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

                @for ($i = 0; $i < sizeof($data[1]); $i++)

                    @php

                    $outline = "";
                        switch ($i) {
                            case 0:
                                $porcentaje = 0;
                                break;
                            case sizeof($data[1])-1:
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

                {{-- @foreach ($data[1] as $modulo)

                    <button type="button"
                    class="position-absolute top-0 start-0 translate-middle btn btn-sm btn-primary rounded-pill"
                    style="width: 2rem; height:2rem;">{{$modulo->numero}}</button>
                @endforeach --}}

                <button type="button"
                    class="position-absolute top-0 start- translate-middle btn btn-sm btn-primary rounded-pill"
                    style="width: 2rem; height:2rem;">1</button>
            </div>
        </div>
    </div>

</div>
@endsection