@extends('layouts.user-master')

@section('title', 'Todos los cursos')

@section('elementos-sidebar')

@endsection

@section('content')

<div class="d-flex justify-content-start p-0">

    <div class="col-md-12">
        <div class="d-flex justify-content-between">
            <div>
                <h1>Todos los cursos</h1>
            </div>
            <div class="m-0 p-0">
                <a class="btn btn-success me-auto" href="{{route('admin.cursos.create')}}">Agregar Curso</a>
            </div>
        </div>

        <div class="container mt-3">

            <div class="card">
                <div class="card-body">

                    <div class="table-responsive">
                        <table class="table align-middle mb-0">

                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th>Acción</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if (sizeof($cursos) > 0)
                                    @for ($i = 0; $i < sizeof($cursos); $i++)

                                        @php
                                            $curso = $cursos[$i];
                                        @endphp
                                    
                                        <tr>
                                            <th scope="row"><a class="btn" href="{{route('admin.cursos.show',$curso->id)}}">{{$curso->id}}</a></th>
                                            <td><a class="btn" href="{{route('admin.cursos.show',$curso->id)}}">{{$curso->nombre}}</a></td>
                                            <td width="10px">
                                                <div class="d-flex">
                                                    <a class="btn btn-outline-warning btn-md me-2" href="{{route('admin.cursos.edit',$curso->id)}}"><i class="mdi mdi-square-edit-outline"></i></a>
                                                    <a class="btn btn-outline-danger btn-md" href="{{route('admin.cursos.destroy',$curso->id)}}"><i class="mdi mdi-delete"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                        
                                    @endfor
                                @else
                                    <tr>No hay ningún curso actualmente</tr>
                                @endif
                                

                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
        
    </div>

</div>

{{-- {{$cursos->links()}} --}}


@endsection