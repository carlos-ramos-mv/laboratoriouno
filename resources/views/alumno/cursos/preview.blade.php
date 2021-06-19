@extends('layouts.user-master')

@section('title', 'Curso ' . $curso->nombre)

@section('content')

    <div class="container-fluid">
        <div class="row">

            <div class="d-flex justify-content-between">
                <div>
                    <h1 class="display-1">{{ $curso->nombre }}</h1>
                </div>

                <div>
                    {{-- <a href="{{ route('alumno.cursos.inscribirse',$curso->id) }}" class="btn btn-success ms-auto">Inscribirse</a> --}}
                    <form class="confirm-form" action="{{ route('alumno.cursos.inscribirse',$curso->id) }}" method="GET">
                        @csrf
                        <div class="m-0 p-0">
                            <input class="form-control" type="hidden" name="curso" id="curso" value="{{ $curso->id }}">
                            <input type="submit" class="btn btn-success ms-auto" value="Inscribirse">
                        </div>
                    </form>
                </div>
                
                
            </div>
        </div>
        <div class="row bg-white py-3 mb-2">
            
            <div class="container">

                <div class="bg-gray-300">
                    <strong>Descripción del curso</strong>
                </div>
                
                <p>@php
                    echo $curso->descripcion;
                @endphp</p>

            </div>

        </div>

        <div class="row bg-white py-3">
            
            <div class="container">

                <div class="bg-gray-300">
                    <strong>Contenido del curso</strong>
                </div>
                
                <x-data-table>
                    <table class="table align-middle mb-0">

                        <thead>
                            <tr>
                                <th>Módulo</th>
                                <th>Descripción</th>
                                <th>Temas</th>
                            </tr>
                        </thead>
                        <tbody>
                            @for ($i = 0; $i < sizeof($modulos); $i++)
                                <tr>
                                    <td>{{$modulos[$i]->titulo}}</td>
                                    <td>{{$modulos[$i]->breve_descripcion}}</td>
                                    <td>
                                        @foreach ($temas[$i] as $tema)
                                            <p>{{$tema->titulo}}</p>
                                        @endforeach
                                    </td>
                                </tr>
                            @endfor
                        </tbody>
                    </table>
                </x-data-table>

            </div>

        </div>

    </div>

@endsection

@section('script')
<script>
    $('.confirm-form').submit(function(e) {
        e.preventDefault();
        Swal.fire({
            title: "¿Seguro que quieres inscribirte a este curso?",
            icon: "question",
            showCancelButton: true,
            cancelButtonColor: "#74788d",
            confirmButtonColor: "#34c38f",
            confirmButtonText: "Incribirse",
            cancelButtonText: "Cancelar"
        }).then((result) => {
            if (result.value) {
                this.submit();
            }
        });
    });
</script>
@endsection