@extends('layouts.user-master')

@section('title', 'Todos los cursos')

@section('content')

    <div class="container-fluid">

        <div class="row">
            <div class="d-flex justify-content-between">
                <div>
                    <h1 class="display-1">Todos los cursos</h1>
                </div>
                <div class="m-0 p-0">
                    <a class="btn btn-success me-auto sm-none" href="{{ route('admin.cursos.create') }}">Agregar Curso</a>
                </div>
            </div>

            <div class="container mt-3">

                @if (sizeof($cursos) > 0)

                <x-data-table>
                    <table class="table align-middle mb-0">

                        <thead>
                            <tr>
                                <th>#</th>
                                <th class="md-none">Nombre</th>
                                <th>Status</th>
                                <th>Creado</th>
                                <th>Editado</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            @for ($i = 0; $i < sizeof($cursos); $i++)

                                @php

                                    $curso = $cursos[$i];
                                    $status = 'Inactivo';
                                    if($curso->status){
                                        $status = 'Activo';
                                    }

                                @endphp

                                <tr>
                                    <th scope="row"><a class="btn" href="{{ route('admin.cursos.show', $curso->id) }}">{{ $curso->id }}</a></th>
                                    <td><a class="btn" href="{{ route('admin.cursos.show', $curso->id) }}">{{ $curso->nombre }}</a></td>
                                    <td><a class="btn" href="{{route('admin.cursos.show',$curso->id)}}">{{$status}}</a></td>
                                    <td><a class="btn" href="{{route('admin.cursos.show',$curso->id)}}">{{$curso->created_at}}</a></td>
                                    <td><a class="btn" href="{{route('admin.cursos.show',$curso->id)}}">{{$curso->updated_at}}</a></td>
                                    <td width="10px">
                                        <div class="d-flex">
                                            <a class="btn btn-outline-warning btn-md me-2"
                                                href="{{ route('admin.cursos.edit', $curso->id) }}">
                                                <i class="mdi mdi-square-edit-outline"></i>
                                            </a>
                                            <form class="delete-form" action="{{ route('admin.cursos.destroy', $curso->id) }}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button class="btn btn-outline-danger btn-md" 
                                                        type="submit">
                                                    <i class="mdi mdi-delete"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>

                            @endfor
                        </tbody>
                    </table>
                </x-data-table>

                @else

                <div class="alert alert-danger text-center">No hay ningún curso actualmente</div>
                    
                @endif

            </div>

        </div>

    </div>

    {{-- {{$cursos->links()}} --}}
@endsection

@section('script')

@if (session('edit'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('edit')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('delete'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('delete')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@endif

    <script>
        $('.delete-form').submit(function(e) {
            e.preventDefault();
            Swal.fire({
                title: "¿Seguro que quieres eliminar este elemento?",
                text: "¡Esta acción no se puede revertir!",
                icon: "warning",
                showCancelButton: true,
                cancelButtonColor: "#74788d",
                confirmButtonColor: "#f46a6a",
                confirmButtonText: "Eliminar",
                cancelButtonText: "Cancelar"
            }).then((result) => {
                if (result.value) {
                    this.submit();
                }
            });
        });
    </script>

@endsection
