@extends('layouts.user-master')

@section('title', 'Curso ' . $curso->nombre)

@section('elementos-sidebar')

@endsection

@section('content')

    <div class="container-fluid">
        <div class="row">

            <div class="d-flex justify-content-between">
                <div class="d-flex align-items-center">
                    <div>
                        <h1 class="display-1">Curso: {{ $curso->nombre }}</h1>
                    </div>
                    <div>
                        <a class="btn btn-gray btn-lg" href="@role('Admin')
                        {{route('admin.cursos.edit', $curso->id)}}
                        @else
                        {{route('instructor.cursos.edit', $curso->id)}}
                        @endrole"><i
                                class="action mdi mdi-circle-edit-outline"></i></a>
                    </div>

                </div>
                <form action="@role('Admin')
                {{route('admin.modulos.create')}}
                @else
                {{route('instructor.modulos.create')}}
                @endrole" method="GET">
                    <div class="m-0 p-0">
                        <input class="form-control" type="hidden" name="curso" id="curso" value="{{ $curso->id }}">
                        <input type="submit" class="btn btn-success ms-auto" value="Agregar Módulo">
                    </div>
                </form>
            </div>

            <div class="container mt-2">
                <div class="mb-3 fs-5">
                    <p>Módulos</p>
                </div>

                @if (sizeof($modulos) > 0)

                <x-data-table>
                    <table class="table align-middle mb-0">

                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Título</th>
                                <th>Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            @for ($i = 0; $i < sizeof($modulos); $i++)

                                @php
                                    $modulo = $modulos[$i];
                                @endphp

                                <tr>
                                    <th scope="row"><a class="btn"
                                            href="@role('Admin')
                                            {{route('admin.modulos.show', $modulo->id)}}
                                            @else
                                            {{route('instructor.modulos.show', $modulo->id)}}
                                            @endrole">{{ $modulo->numero }}</a>
                                    </th>
                                    <td><a class="btn"
                                            href="@role('Admin')
                                            {{route('admin.modulos.show', $modulo->id)}}
                                            @else
                                            {{route('instructor.modulos.show', $modulo->id)}}
                                            @endrole">{{ $modulo->titulo }}</a>
                                    </td>
                                    <td width="10px">
                                        <div class="d-flex">
                                            <a class="btn btn-outline-warning btn-md me-2"
                                                href="@role('Admin')
                                                {{route('admin.modulos.edit', $modulo->id)}}
                                                @else
                                                {{route('instructor.modulos.edit', $modulo->id)}}
                                                @endrole"><i
                                                    class="mdi mdi-square-edit-outline"></i></a>
                                            <form class="delete-form" action="@role('Admin')
                                            {{route('admin.modulos.destroy', $modulo->id)}}
                                            @else
                                            {{route('instructor.modulos.destroy', $modulo->id)}}
                                            @endrole"
                                                method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button class="btn btn-outline-danger btn-md" type="submit">
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

                <div class="alert alert-danger text-center">No hay ningún módulo actualmente</div>
                    
                @endif

            </div>

        </div>
    </div>

@endsection

@section('script')

@if (session('status'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('status')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('modulo-store'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('modulo-store')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('modulo-update'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('modulo-update')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('modulo-delete'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('modulo-delete')}}',
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
