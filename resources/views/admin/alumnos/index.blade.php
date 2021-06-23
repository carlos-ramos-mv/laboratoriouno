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
                                        <form class="delete-form" action="{{route('admin.alumnos.destroy',$alumno->id)}}" method="POST">
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
            </div>
            @else

            <div class="alert alert-danger text-center">No hay ningún alumno registrado actualmente</div>

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