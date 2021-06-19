@extends('layouts.user-master')

@section('title', 'Tema '.$tema->titulo)

@section('css')
    <!-- Bootstrap Rating css -->
    <link href="{{ URL::asset('/assets/libs/bootstrap-rating/bootstrap-rating.min.css') }}" rel="stylesheet" type="text/css" />
@endsection

@section('elementos-sidebar')
    
<li class="menu-title" key="t-menu" style="color: #fff">Actividades</li>

<li><a href="#" key="t-saas">No hay actividades para este tema</a></li>

@endsection

@section('content')

<div class="container-fluid">

    <div class="row">
        <div class="">
            <h1 class="display-1">Tema: {{$tema->titulo}}</h1>
            {{$u}}{{$rate}}
        </div>
        <div class="bg-white p-0">
            <div class="p-3 pb-0">
                <h2 class="display-2">Introducción</h2>
                <p>@php
                    echo $tema->introduccion;
                @endphp</p>
            </div>
            <div class="p-3 pt-0">
                <h2 class="display-2">Contenido</h2>
                <p>@php
                    echo $tema->contenido;
                @endphp</p>
            </div>
            <div class="p-3 pt-0 d-flex justify-content-end">
                @if ($u === 'no-actividades' )
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#rateModal">
                        Continuar
                    </button>
                @else
                    <form class="save-form" action="{{ route('alumno.avances.update', $tema) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <button type="submit" class="btn btn-success waves-effect waves-light">Continuar</button>
                        <input type="hidden" name="ultimo" id="ultimo" value="{{$u}}">
                        <input type="hidden" name="tipo" id="tipo" value="tema">
                    </form>
                @endif
                
            </div>
        </div>  
    </div>

</div>

<!-- MODAL RATE -->
<div class="modal fade" id="rateModal" tabindex="-1" aria-labelledby="titulo" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="titulo">Califica este tema para continuar</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form id="rateForm" action="{{ route('alumno.avances.update', $tema) }}" method="POST">
                @csrf
                @method('PUT')
                <div class="d-flex justify-content-center">
                    <div class="rating-star">
                        @php
                            $r = 0;
                            if(!$rate){
                                $r = $rate->rate;
                            }
                        @endphp
                        <input name="rate" id="rate" type="hidden" class="rating form-control" data-filled="fs-1 mdi mdi-star text-primary" data-empty="fs-1 mdi mdi-star-outline text-muted" value="{{$r}}" required/>
                    </div>
                </div>
                @if ($u === 'ultimo-modulo-y-elemento')
                    <div class="row">
                        <textarea class="form-control" name="comentario" id="comentario" cols="30" rows="10" placeholder="Envíanos tus comentarios. ¡Nos ayudará a mejorar!"></textarea>
                    </div>
                @endif
                <input type="hidden" name="ultimo" id="ultimo" value="{{$u}}">
                <input type="hidden" name="tipo" id="tipo" value="tema">
            </form>
            
        </div>
        <div class="modal-footer">
            <button type="submit" form="rateForm" class="btn btn-success">Enviar</button>
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        </div>
      </div>
    </div>
  </div>

@endsection

@section('script')

<!-- Bootstrap rating js -->
<script src="{{ URL::asset('/assets/libs/bootstrap-rating/bootstrap-rating.min.js') }}"></script>

<script src="{{ URL::asset('/assets/js/pages/rating-init.js') }}"></script>

<script>
    $('.save-form').submit(function(e) {
        e.preventDefault();
        Swal.fire({
            title: "¿Lo has terminado?",
            icon: "info",
            showCancelButton: true,
            cancelButtonColor: "#74788d",
            confirmButtonColor: "#34c38f",
            confirmButtonText: "¡Sí!",
            cancelButtonText: "No"
        }).then((result) => {
            if (result.value) {
                this.submit();
            }
        });
    });
</script>
@endsection