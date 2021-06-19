@extends('layouts.user-master')

@section('title', 'Alumnos registrados')

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">

    <div class="row">
        <div class="d-flex justify-content-between">
            <div>
                <h1 class="display-1">Todos los alumnos</h1>
            </div>
        </div>

        <div class="container mt-3">

            @if (sizeof($alumnos) > 0)
            <div class="table-responsive">
                <table class="table align-middle mb-0">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Correo</th>
                            <th>Status</th>
                            <th>Creado</th>
                            <th>Acción</th>
                        </tr>
                    </thead>
                    <tbody>
                        @for ($i = 0; $i < sizeof($alumnos); $i++)

                            @php
                                $alumno = $alumnos[$i];
                                $status = 'Inactivo';
                                $nombre = 'No se ha agregado un nombre';
                                if ($alumno->status) {
                                    $status = 'Activo';
                                }
                                if($alumno->nombre!=null){
                                    $nombre = $alumno->nombre.' '.$alumno->ap_pat.' '. $alumno->ap_mat;
                                }
                            @endphp
                        
                            <tr>
                                <th scope="row"><a class="btn" href="{{route('admin.alumnos.show',$alumno->id)}}">{{$alumno->id}}</a></th>
                                <td><a class="btn" href="{{route('admin.alumnos.show',$alumno->id)}}">{{$nombre}}</a></td>
                                <td><a class="btn" href="{{route('admin.alumnos.show',$alumno->id)}}">{{$alumno->email}}</a></td>
                                <td><a class="btn" href="{{route('admin.alumnos.show',$alumno->id)}}">{{$status}}</a></td>
                                <td><a class="btn" href="{{route('admin.alumnos.show',$alumno->id)}}">{{$alumno->created_at}}</a></td>
                                <td width="10px">
                                    <div class="d-flex">
                                        <a class="btn btn-outline-warning btn-md me-2" href="{{route('admin.alumnos.edit',$alumno->id)}}"><i class="mdi mdi-square-edit-outline"></i></a>
                                        <a class="btn btn-outline-danger btn-md" href="{{route('admin.alumnos.destroy',$alumno->id)}}"><i class="mdi mdi-delete"></i></a>
                                    </div>
                                </td>
                            </tr>
                            
                        @endfor

                    </tbody>
                </table>
            </div>
            @else

            <div class="alert alert-danger text-center">No hay ningún alumno registrado actualmente</div>

            @endif

        </div>
        
    </div>

</div>

{{-- {{$cursos->links()}} --}}


@endsection