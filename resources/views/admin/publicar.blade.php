@extends('layouts.user-master')

@section('title', 'Publicar')

@section('css')
    @livewireStyles
@endsection

@section('content')

    <div class="container-fluid">
        <div class="row">
            <h1 class="display-1">Publicar</h1>
            <div class="card">
                <div class="card-body">

                    <div class="accordion accordion-flush" id="accordionFlushCursos">

                        @for ($i = 0; $i < sizeof($cursos); $i++)

                            <div class="accordion-item">
                                <div class="row">
                                    <h2 class="accordion-header col" id="flush-heading-curso{{ $i }}">
                                        <button class="accordion-button fw-medium collapsed" type="button"
                                            data-bs-toggle="collapse" data-bs-target="#flush-collapse-curso{{ $i }}"
                                            aria-expanded="false" aria-controls="flush-collapse-curso{{ $i }}">
                                            {{ $cursos[$i]->nombre }}
                                        </button>
                                    </h2>
                                    <div class="col-2 col-sm-1 align-self-center">
                                        @livewire('publicar',['model'=>$cursos[$i],
                                                                'field'=>'status',
                                                                'key'=>get_class($cursos[$i]).$cursos[$i]->id,'action'=>'update',
                                                                'action'=>'publicar'])
                                    </div>
                                </div>
                                <div id="flush-collapse-curso{{ $i }}" class="accordion-collapse collapse"
                                    aria-labelledby="flush-heading-curso{{ $i }}"
                                    data-bs-parent="#accordionFlushCursos">
                                    <div class="accordion-body text-muted">
                                        <div class="accordion accordion-flush" id="accordionFlushModulos">
                                            @for ($j = 0; $j < sizeof($cursos[$i]->modulos); $j++)

                                                <div class="accordion-item">
                                                    <div class="row">
                                                        <h2 class="accordion-header col"
                                                            id="flush-heading-modulo{{ $j }}">
                                                            <button class="accordion-button fw-medium collapsed" type="button"
                                                                data-bs-toggle="collapse"
                                                                data-bs-target="#flush-collapse-modulo{{ $j }}"
                                                                aria-expanded="false"
                                                                aria-controls="flush-collapse-modulo{{ $j }}">
                                                                {{ $cursos[$i]->modulos[$j]->titulo }}
                                                            </button>
                                                        </h2>
                                                        <div class="col-1 align-self-center">
                                                            @livewire('publicar',['model'=>$cursos[$i]->modulos[$j],
                                                                                'field'=>'status',
                                                                                'key'=>get_class($cursos[$i]->modulos[$j]).$cursos[$i]->modulos[$j]->id,
                                                                                'action'=>'publicar'])
                                                        </div>
                                                    </div>
                                                    <div id="flush-collapse-modulo{{ $j }}"
                                                        class="accordion-collapse collapse"
                                                        aria-labelledby="flush-heading-modulo{{ $j }}"
                                                        data-bs-parent="#accordionFlushModulos">
                                                        <div class="accordion-body text-muted">
                                                            <div class="accordion accordion-flush" id="accordionFlushTemas">
                                                                @for ($k = 0; $k < sizeof($cursos[$i]->modulos[$j]->temas); $k++)

                                                                    <div class="accordion-item">
                                                                        <div class="row">
                                                                            <h2 class="accordion-header col"
                                                                                id="flush-heading-tema{{ $k }}">
                                                                                <button
                                                                                    class="accordion-button fw-medium collapsed"
                                                                                    type="button" data-bs-toggle="collapse"
                                                                                    data-bs-target="#flush-collapse-tema{{ $k }}"
                                                                                    aria-expanded="false"
                                                                                    aria-controls="flush-collapse-tema{{ $k }}">
                                                                                    {{ $cursos[$i]->modulos[$j]->temas[$k]->titulo }}
                                                                                </button>
                                                                            </h2>
                                                                            <div class="col-1 align-self-center">
                                                                                @livewire('publicar',['model'=>$cursos[$i]->modulos[$j]->temas[$k],
                                                                                                'field'=>'status',
                                                                                                'key'=>get_class($cursos[$i]->modulos[$j]->temas[$k]).$cursos[$i]->modulos[$j]->temas[$k]->id,
                                                                                                'action'=>'publicar'])
                                                                            </div>
                                                                        </div>
                                                                        <div id="flush-collapse-tema{{ $k }}"
                                                                            class="accordion-collapse collapse"
                                                                            aria-labelledby="flush-heading-tema{{ $k }}"
                                                                            data-bs-parent="#accordionFlushTemas">
                                                                            <div class="accordion-body text-muted">
                                                                                <div class="accordion accordion-flush"
                                                                                    id="accordionFlushActividades">
                                                                                    @for ($l = 0; $l < sizeof($cursos[$i]->modulos[$j]->temas[$k]->actividades); $l++)

                                                                                        <div class="row">
                                                                                            <span class="col">{{ $cursos[$i]->modulos[$j]->temas[$k]->actividades[$l]->titulo }}</span>
                                                                                            <div class="col-1 align-self-center">
                                                                                                @livewire('publicar',['model'=>$cursos[$i]->modulos[$j]->temas[$k]->actividades[$l],
                                                                                                'field'=>'status',
                                                                                                'key'=>get_class($cursos[$i]->modulos[$j]->temas[$k]->actividades[$l]).$cursos[$i]->modulos[$j]->temas[$k]->actividades[$l]->id,
                                                                                                'action'=>'publicar'])
                                                                                            </div>
                                                                                        </div>

                                                                                    @endfor
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                @endfor
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            @endfor
                                        </div>
                                    </div>
                                </div>
                            </div>

                        @endfor
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    @livewireScripts

    <script>
        function wait() {
            Swal.fire({
            position: 'center',
            icon: 'info',
            title: 'Espere un momento...',
            showConfirmButton: false,
            allowOutsideClick: false,
            timer: 6000
        });   
        }
    </script>

@endsection