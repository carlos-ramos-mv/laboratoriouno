@extends('layouts.user-master')

@section('title', 'Módulo '.$modulo->titulo)

@section('elementos-sidebar')
    
@endsection

@section('content')

<div class="container-fluid">
    <div class="row">
    
        <div class="d-flex justify-content-between">
            <div>
                <h1 class="display-1">Módulo: {{$modulo->titulo}}</h1>
            </div>
            <form action="@role('Admin')
            {{route('admin.temas.create')}}
            @else
            {{route('instructor.temas.create')}}
            @endrole" method="GET">
                <div class="m-0 p-0">
                    <input class="form-control" type="hidden" name="modulo" id="modulo" value="{{$modulo->id}}">
                    <input type="submit" class="btn btn-success ms-auto" value="Agregar Tema">
                </div>
            </form>
        </div>
        <div class="container mt-2">
            <div class="mb-3 fs-5">
                <p>Temas</p>
            </div>

            @if (sizeof($temas) > 0)
                
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

                        @for ($i = 0; $i < sizeof($temas); $i++)

                            @php
                                $tema = $temas[$i];
                            @endphp
                        
                            <tr>
                                <th scope="row"><a class="btn" href="@role('Admin')
                                    {{route('admin.temas.show',$tema->id)}}
                                    @else
                                    {{route('instructor.temas.show',$tema->id)}}
                                    @endrole">{{$i+1}}</a></th>
                                <td><a class="btn" href="@role('Admin')
                                    {{route('admin.temas.show',$tema->id)}}
                                    @else
                                    {{route('instructor.temas.show',$tema->id)}}
                                    @endrole">{{$tema->titulo}}</a></td>
                                <td width="10px">
                                    <div class="d-flex">
                                        <a class="btn btn-outline-warning btn-md me-2" href="@role('Admin')
                                        {{route('admin.temas.edit',$tema->id)}}
                                        @else
                                        {{route('instructor.temas.edit',$tema->id)}}
                                        @endrole"><i class="mdi mdi-square-edit-outline"></i></a>
                                        <form class="delete-form" action="@role('Admin')
                                        {{route('admin.temas.destroy',$tema->id)}}
                                        @else
                                        {{route('instructor.temas.destroy',$tema->id)}}
                                        @endrole" method="POST">
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

            <div class="alert alert-danger text-center">No hay ningún tema actualmente</div>

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

@elseif (session('tema-store'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('tema-store')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('tema-update'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('tema-update')}}',
            showConfirmButton: false,
            timer: 1500
        });
    </script>

@elseif (session('tema-delete'))

    <script>
        Swal.fire({
            position: 'center',
            icon: 'success',
            title: '{{session('tema-delete')}}',
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