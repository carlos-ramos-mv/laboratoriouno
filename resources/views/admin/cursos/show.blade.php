@extends('layouts.user-master')

@section('title', 'Curso '.$curso->nombre)

@section('elementos-sidebar')
    
@endsection

@section('content')

<div class="container-fluid">
    <div class="row">

        @if (session('status'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('status') }}
            </div>
    
        @elseif (session('modulo-store'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('modulo-store') }}
            </div>

        @elseif (session('modulo-update'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('modulo-update') }}
            </div>

        @elseif (session('modulo-delete'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('modulo-delete') }}
            </div>
    
        @endif
    
        <div class="d-flex justify-content-between">
            <div class="d-flex align-items-center">
                <div>
                    <h1>Curso: {{$curso->nombre}}</h1>
                </div>
                <div>
                    <a class="btn btn-gray btn-lg" href="{{route('admin.cursos.edit',$curso->id)}}"><i class="action mdi mdi-circle-edit-outline"></i></a>
                </div>
                
            </div>
            <form action="{{route('admin.modulos.create')}}" method="GET">
                <div class="m-0 p-0">
                    <input class="form-control" type="hidden" name="curso" id="curso" value="{{$curso->id}}">
                    <input type="submit" class="btn btn-success ms-auto" value="Agregar Módulo">
                </div>
            </form>
        </div>
        <div class="">
    
            <div class="mt-2">
                <div class="mb-3 fs-5"><p>Módulos</p></div>
    
                {{-- <div id="descripcion">
                    @php
                        echo $curso->descripcion;
                    @endphp
                </div> --}}
    
                <div class="card" >
                    <div class="card-body">
    
                        <div>
                            <div class="table-responsive" style="display: block; position: relative; height: 400px; overflow: auto;">
                                <table class="table align-middle mb-0">
    
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Título</th>
                                            <th>Acción</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @if (sizeof($modulos) > 0)
                                            @for ($i = 0; $i < sizeof($modulos); $i++)
    
                                                @php
                                                    $modulo = $modulos[$i];
                                                @endphp
                                            
                                                <tr>
                                                    <th scope="row"><a class="btn" href="{{route('admin.modulos.show',$modulo->id)}}">{{$modulo->numero}}</a></th>
                                                    <td><a class="btn" href="{{route('admin.modulos.show',$modulo->id)}}">{{$modulo->titulo}}</a></td>
                                                    <td width="10px">
                                                        <div class="d-flex">
                                                            <a class="btn btn-outline-warning btn-md me-2" href="{{route('admin.modulos.edit',$modulo->id)}}"><i class="mdi mdi-square-edit-outline"></i></a>
                                                            <form action="{{route('admin.modulos.destroy',$modulo->id)}}" method="POST">
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
                                        @else
                                        <tr><div class="alert alert-danger text-center">No hay ningún módulo actualmente</div></tr>
                                        @endif
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


{{-- <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="false">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Aviso</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="alert alert-success">
                    {{ session('status') }}
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div> --}}

@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $('#alert-success').hide(3500);
        })
    </script>

@endsection