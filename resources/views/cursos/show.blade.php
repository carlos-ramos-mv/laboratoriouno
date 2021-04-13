@extends('layouts.user-master')

@section('title', 'Curso '.$data[0]->nombre)

@section('elementos-sidebar')
    
<li class="menu-title" key="t-menu" style="color: #fff">Módulos</li>

@foreach ($modulos=$data[1] as $modulo)
    
<li>
    <a href="javascript: void(0);" class="has-arrow waves-effect">
        <i class="bx bx-layout"></i>
        <span key="t-dashboards">{{$modulo->titulo}}</span>
    </a>
    <ul class="sub-menu" aria-expanded="false">
        <li><a href="index" key="t-default">Tema 1</a></li>
        <li><a href="dashboard-saas" key="t-saas">Tema 2</a></li>
    </ul>
</li>

@endforeach

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

        <div class="mt-5">
            <p>Progreso del curso</p>
        </div>
        <div class="mt-4">
            <div class="mb-3"><p>Módulos</p></div>
            <div class="position-relative m-4">
                <div class="progress" style="height: 2px;">
                    <div class="progress-bar" role="progressbar" style="width: 50%;" aria-valuenow="50"
                        aria-valuemin="0" aria-valuemax="100"></div>
                </div>

                @for ($i = 0; $i < sizeof($data[1]); $i++)

                    @php
                        switch ($i) {
                            case 0:
                                $porcentaje = 0;
                                break;
                            case sizeof($data[1])-1:
                                $porcentaje = 100;
                                break;
                            default:
                                $porcentaje = 50;
                                break;
                        }
                        
                    @endphp

                    <button type="button"
                    class="position-absolute top-0 start-{{$porcentaje}} translate-middle btn btn-sm btn-primary rounded-pill"
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