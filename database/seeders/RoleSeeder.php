<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        $role1 = Role::create(['name' => 'Admin']);
        $role2 = Role::create(['name' => 'Instructor']);
        $role3 = Role::create(['name' => 'Alumno']);

        Permission::create(['name' => 'admin.home'])->syncRoles([$role1,$role2]);//

        Permission::create(['name' => 'admin.alumnos.store'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.alumnos.index'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.alumnos.create'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.alumnos.destroy'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.alumnos.update'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.alumnos.show'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.alumnos.edit'])->assignRole([$role1]);

        Permission::create(['name' => 'admin.instructores.store'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.instructores.index'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.instructores.create'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.instructores.destroy'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.instructores.update'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.instructores.show'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.instructores.edit'])->assignRole([$role1]);

        Permission::create(['name' => 'admin.cursos.store'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.cursos.index'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.cursos.create'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.cursos.destroy'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.cursos.update'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.cursos.show'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.cursos.edit'])->syncRoles([$role1,$role2]);//

        Permission::create(['name' => 'admin.modulos.store'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.modulos.index'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.modulos.create'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.modulos.destroy'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.modulos.update'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.modulos.show'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.modulos.edit'])->syncRoles([$role1,$role2]);//

        Permission::create(['name' => 'admin.temas.store'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.temas.index'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.temas.create'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.temas.destroy'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.temas.update'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.temas.show'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.temas.edit'])->syncRoles([$role1,$role2]);//

        Permission::create(['name' => 'admin.actividades.store'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.actividades.index'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.actividades.create'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.actividades.destroy'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.actividades.update'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.actividades.show'])->syncRoles([$role1,$role2]);//
        Permission::create(['name' => 'admin.actividades.edit'])->syncRoles([$role1,$role2]);//

        Permission::create(['name' => 'alumno.home'])->assignRole([$role3]);
        Permission::create(['name' => 'alumno.cursos.show'])->assignRole([$role3]);
        Permission::create(['name' => 'alumno.modulos.show'])->assignRole([$role3]);
        Permission::create(['name' => 'alumno.temas.show'])->assignRole([$role3]);
        Permission::create(['name' => 'alumno.actividades.show'])->assignRole([$role3]);
        
    }
}
