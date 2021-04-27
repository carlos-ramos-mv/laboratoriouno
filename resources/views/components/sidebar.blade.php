<div>
    <!-- The whole future lies in uncertainty: live immediately. - Seneca -->
    <!-- ========== Left Sidebar Start ========== -->
<div class="vertical-menu">

    <div data-simplebar class="h-100">
        <!--- Sidemenu -->
        <div id="sidebar-menu">
            <!-- Left Menu Start -->
            <ul class="metismenu list-unstyled" id="side-menu">

                    <li class="menu-title" key="t-menu" style="color: #fff">Menú</li>

                    @can('admin.home')
                    <li>
                        <a href="{{route('admin.home')}}" class="waves-effect">
                            <i class="mdi mdi-view-dashboard-outline"></i>
                            <span key="">Dashboard</span>
                        </a>
                    </li>
                    
                    <li>
                        <a href="javascript: void(0)" class="waves-effect has-arrow">
                            <i class="mdi mdi-notebook-outline"></i>
                            <span key="" >Cursos</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="">
                            <li><a href="{{route('admin.cursos.index')}}" key="">Todos los cursos</a></li>
                            <li><a href="{{route('admin.cursos.create')}}">Crear nuevo curso</a></li>
                        </ul>                        
                    </li>

                    <li>
                        <a href="javascript: void(0)" class="waves-effect has-arrow">
                            <i class="mdi mdi-teach"></i>
                            <span key="" >Instructores</span>
                        </a>
                        <ul class="sub-menu" aria-expanded="">
                            <li><a href="{{route('admin.instructores.index')}}" key="">Ver todos</a></li>
                            <li><a href="#">Agregar nuevo</a></li>
                        </ul>                        
                    </li>

                    <li>
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

                    {{$elementos}}
                    
                    
            </ul>
        </div>
        <!-- Sidebar -->
    </div>
</div>
<!-- Left Sidebar End -->
</div>