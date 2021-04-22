@extends('layouts.user-master')

@section('title', 'Módulo '.$modulo->titulo)

@section('elementos-sidebar')
    
@endsection

@section('content')

<div class="container d-flex flex-column p-0">

    @if (session('status'))

        <div class="alert alert-success" id="alert-success">
            {{ session('status') }}
        </div>

    @elseif (session('tema'))

        <div class="alert alert-success" id="alert-success">
            {{ session('tema') }}
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
    <div class="container">

        <div class="mt-2">
            <div class="mb-3 fs-5"><p>Temas</p></div>

            {{-- <div id="descripcion">
                @php
                    echo $modulo->descripcion;
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
                                                        <a class="btn btn-outline-danger btn-md" href="{{route('admin.temas.destroy',$tema->id)}}"><i class="mdi mdi-delete"></i></a>
                                                    </div>
                                                </td>
                                            </tr>
                                            
                                        @endfor
                                    @else
                                        <tr>No hay ningún tema actualmente</tr>
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

@endsection

@section('script')
    <script>
        $(document).ready(function(){
            $('#alert-success').hide(3500);
        })
    </script>

@endsection