@extends('layouts.user-master')

@section('title', 'Todos los cursos')

@section('css')

    <!-- Sweet Alert-->
    <link href="{{ URL::asset('/assets/libs/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css" />
    
@endsection

@section('elementos-sidebar')

@endsection

@section('content')

<div class="container-fluid">

    <div class="row">

        @if (session('edit'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('edit') }}
            </div>
    
        @elseif (session('delete'))
    
            <div class="alert alert-success" id="alert-success">
                {{ session('delete') }}
            </div>
    
        @endif
        <div class="d-flex justify-content-between">
            <div>
                <h1>Todos los cursos</h1>
            </div>
            <div class="m-0 p-0">
                <a class="btn btn-success me-auto sm-none" href="{{route('admin.cursos.create')}}">Agregar Curso</a>
            </div>
        </div>

        <div class="container mt-3">

            <x-data-table>
                <table class="table align-middle mb-0">

                    <thead>
                        <tr>
                            <th>#</th>
                            <th class="md-none">Nombre</th>
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
                                            <form action="{{route('admin.cursos.destroy',$curso->id)}}" method="POST">
                                                @csrf
                                                @method('DELETE')
                                                <button class="btn btn-outline-danger btn-md" id="sa-delete" type="submit">
                                                    <i class="mdi mdi-delete"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                                
                            @endfor
                        @else
                        <tr><div class="alert alert-danger text-center">No hay ningún curso actualmente</div></tr>
                        @endif
                        
                    </tbody>
                </table>
            </x-data-table>

        </div>
        
    </div>

</div>

{{-- {{$cursos->links()}} --}}

@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $('#alert-success').hide(3500);
        })
    </script>

    <!-- Sweet Alerts js -->
    <script src="{{ URL::asset('/assets/libs/sweetalert2/sweetalert2.min.js') }}"></script>

    <!-- Sweet alert init js-->
    <script src="{{ URL::asset('/assets/js/pages/sweet-alerts.init.js') }}"></script>

@endsection