@extends('layouts.user-master')

@section('title', 'Publicar')

@section('css')
    @livewireStyles
@endsection

@section('content')

    <div class="container-fluid">
        <div class="row">
            <h1 class="display-1">Publicar</h1>
            <x-data-table>
                <table class="table align-middle mb-0">
                @for ($i = 0; $i < sizeof($instructores); $i++)



                @endfor
                </table>
            </x-data-table>
        </div>
    </div>

@endsection

@section('script')
    @livewireScripts
@endsection