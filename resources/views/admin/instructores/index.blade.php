@extends('layouts.user-master')

@section('title', 'Instructores')

@section('css')
    @livewireStyles
@endsection

@section('content')

<div class="container-fluid">
    <div class="row">
        <div class="d-flex justify-content-between">
            <div>
                <h1 class="display-1">Todos los Instructores</h1>
            </div>
        </div>

        <div class="container mt-3">

            @if (sizeof($instructores) > 0)

            <x-data-table>
                <table class="table align-middle mb-0">

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Correo</th>
                            <th>Creado</th>
                            <th>Acción</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                            @for ($i = 0; $i < sizeof($instructores); $i++)

                                @php
                                    $instructor = $instructores[$i];
                                    $nombre = 'No se ha agregado un nombre';
                                    if($instructor->nombre!=null){
                                        $nombre = $instructor->nombre.' '.$instructor->ap_pat.' '. $instructor->ap_mat;
                                    }
                                @endphp
                            
                                <tr>
                                    <th scope="row"><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}">{{$instructor->id}}</a></th>
                                    <td><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}">{{$nombre}}</a></td>
                                    <td><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}">{{$instructor->email}}</a></td>
                                    <td><a class="btn" href="{{route('admin.instructores.show',$instructor->id)}}">{{$instructor->created_at}}</a></td>
                                    <td width="10px">
                                        <div class="d-flex">
                                            <a class="btn btn-outline-warning btn-md me-2" href="{{route('admin.instructores.edit',$instructor->id)}}"><i class="mdi mdi-square-edit-outline"></i></a>
                                            <a class="btn btn-outline-danger btn-md" href="{{route('admin.instructores.destroy',$instructor->id)}}"><i class="mdi mdi-delete"></i></a>
                                        </div>
                                    </td>
                                    <td>
                                        @livewire('publicar',['model'=>$instructor,'field'=>'status','key'=>$instructor->id])
                                    </td>
                                </tr>
                                
                            @endfor

                    </tbody>
                </table>
            </x-data-table>
            @else
                
            <div class="alert alert-danger text-center">No hay ningún instructor registrado actualmente</div>

            @endif

        </div>
        
    </div>

</div>

{{-- {{$cursos->links()}} --}}

@endsection

@section('script')

@livewireScripts

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
@endsection