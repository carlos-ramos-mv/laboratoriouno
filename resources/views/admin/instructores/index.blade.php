@extends('layouts.user-master')

@section('title', 'Instructores')

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="d-flex justify-content-between">
            <div>
                <h1>Todos los Instructores</h1>
            </div>
            <div class="m-0 p-0">
                <a class="btn btn-success me-auto sm-none" href="{{route('admin.cursos.create')}}">Agregar Instructor</a>
            </div>
        </div>

        <div class="container mt-3">

            <div class="card">
                <div class="card-body">

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
                                @if (sizeof($instructores) > 0)
                                    @for ($i = 0; $i < sizeof($instructores); $i++)

                                        @php
                                            $instructor = $instructores[$i];
                                            $status = 'Inactivo';
                                            $nombre = 'No se ha agregado un nombre';
                                            if ($instructor->status) {
                                                $status = 'activo';
                                            }
                                            if($instructor->nombre!=null){
                                                $nombre = $instructor->nombre.' '.$instructor->ap_pat.' '. $instructor->ap_mat;
                                            }
                                        @endphp
                                    
                                        <tr>
                                            <th scope="row"><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}">{{$instructor->id}}</a></th>
                                            <td><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}">{{$nombre}}</a></td>
                                            <td><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}">{{$instructor->email}}</a></td>
                                            <td><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}">{{$status}}</a></td>
                                            <td><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}"><!-- {{$instructor->created_at}} --> </a></td>
                                            <td width="10px">
                                                <div class="d-flex">
                                                    <a class="btn btn-outline-warning btn-md me-2" href="{{route('admin.instructores.edit',$instructor->id)}}"><i class="mdi mdi-square-edit-outline"></i></a>
                                                    <a class="btn btn-outline-danger btn-md" href="{{route('admin.instructores.destroy',$instructor->id)}}"><i class="mdi mdi-delete"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                        
                                    @endfor
                                @else
                                    <tr><div class="alert alert-danger text-center">No hay ningún instructor registrado actualmente</div></tr>
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