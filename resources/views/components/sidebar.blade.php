<div>
    <!-- The whole future lies in uncertainty: live immediately. - Seneca -->
    <!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu" style="background-color: #002B7A">

    <div data-simplebar class="h-100">
        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">
                    {{$elementos}}

                    <li class="menu-title" key="t-menu" style="color: #fff">Menú</li>

                    @can('admin.home')
                    <li>
                        <div class="d-flex">
                            <a href="{{route('admin.home')}}" class="flex-fill waves-effect">
                                <i class="mdi mdi-view-dashboard-outline"></i>
                                <span>Dashboard</span>
                            </a>
                        </div>
                        
                    </li>
                    
                    <li class="">
                        <a href="javascript: void(0)" class="waves-effect has-arrow">
                            <i class="mdi mdi-notebook-outline"></i>
                            <span key="" >Cursos</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="">
                            <li><a href="{{route('admin.cursos.index')}}" key="">Todos los cursos</a></li>
                            <li><a href="{{route('admin.cursos.create')}}">Crear nuevo curso</a></li>
                        </ul>                        
                    </li>

                    <li class="">
                        <a href="javascript: void(0)" class="waves-effect has-arrow">
                            <i class="mdi mdi-account-group-outline"></i>
                            <span key="" >Alumnos</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="">
                            <li><a href="{{route('admin.alumnos.index')}}" key="">Ver todos</a></li>
                            <li><a href="#">#</a></li>
                        </ul>                        
                    </li>


                    @endcan
                    
                    
            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
</div>