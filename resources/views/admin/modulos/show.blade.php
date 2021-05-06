@extends('layouts.user-master')

@section('title', 'Módulo '.$modulo->titulo)

@section('elementos-sidebar')
    
@endsection

@section('content')

<div class="container-fluid">
    <div class="row">

        @if (session('status'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('status') }}
            </div>
    
        @elseif (session('tema-store'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('tema-store') }}
            </div>
    
        @elseif (session('tema-update'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('tema-update') }}
            </div>
    
        @elseif (session('tema-delete'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('tema-delete') }}
            </div>
    
        @endif
    
        <div class="d-flex justify-content-between">
            <div>
                <h1 >Módulo: {{$modulo->titulo}}</h1>
            </div>
            <form action="{{route('admin.temas.create')}}" method="GET">
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
                        @if (sizeof($temas) > 0)
                            @for ($i = 0; $i < sizeof($temas); $i++)

                                @php
                                    $tema = $temas[$i];
                                @endphp
                            
                                <tr>
                                    <th scope="row"><a class="btn" href="{{route('admin.temas.show',$tema->id)}}">{{$i+1}}</a></th>
                                    <td><a class="btn" href="{{route('admin.temas.show',$tema->id)}}">{{$tema->titulo}}</a></td>
                                    <td width="10px">
                                        <div class="d-flex">
                                            <a class="btn btn-outline-warning btn-md me-2" href="{{route('admin.temas.edit',$tema->id)}}"><i class="mdi mdi-square-edit-outline"></i></a>
                                            <form action="{{route('admin.temas.destroy',$tema->id)}}" method="POST">
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
                            <tr><div class="alert alert-danger">No hay ningún tema actualmente</div></tr>
                        @endif
                        
                    </tbody>
                </table>
            </x-data-table>
        </div>
    </div>
</div>



@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $('#alert-success').hide(3500);
        })
    </script>

@endsection