<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8" />
    <title> @yield('title') </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ asset('assets/images/logos/logo-enes-oro.png') }}">
    @include('layouts.head-css')

</head>

@section('body')
    <body data-sidebar="dark">
@show
    <!-- Begin page -->
    <div id="layout-wrapper">
        {{-- @include('layouts.user-topbar') --}}

        <x-topbar></x-topbar>

        <x-sidebar>
            <x-slot name="elementos">
                @yield('elementos-sidebar')
            </x-slot>
        </x-sidebar>

        <!-- ============================================================== -->
        <!-- Start right Content here -->
        {{-- style="border: 1px solid red --}}
        <!-- ============================================================== -->
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    @yield('content')
                </div>
                <!-- container-fluid -->
            </div>
            <!-- End Page-content -->
            @include('layouts.footer')
        </div>
        <!-- end main content-->
    </div>
    <!-- END layout-wrapper -->

    <!-- JAVASCRIPT -->
    @include('layouts.vendor-scripts')
</body>

</html>
