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

        Permission::create(['name' => 'admin.home'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.actividades.store'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.actividades.index'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.actividades.create'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.actividades.destroy'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.actividades.update'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.actividades.show'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.actividades.edit'])->assignRole([$role1]);

        Permission::create(['name' => 'admin.cursos.store'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.cursos.index'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.cursos.create'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.cursos.destroy'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.cursos.update'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.cursos.show'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.cursos.edit'])->assignRole([$role1]);

        Permission::create(['name' => 'admin.modulos.store'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.modulos.index'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.modulos.create'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.modulos.destroy'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.modulos.update'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.modulos.show'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.modulos.edit'])->assignRole([$role1]);

        Permission::create(['name' => 'admin.temas.store'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.temas.index'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.temas.create'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.temas.destroy'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.temas.update'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.temas.show'])->assignRole([$role1]);
        Permission::create(['name' => 'admin.temas.edit'])->assignRole([$role1]);

        Permission::create(['name' => 'alumno.home'])->assignRole([$role3]);
        Permission::create(['name' => 'alumno.cursos.show'])->assignRole([$role3]);
        Permission::create(['name' => 'alumno.modulos.show'])->assignRole([$role3]);
        Permission::create(['name' => 'alumno.temas.show'])->assignRole([$role3]);
        Permission::create(['name' => 'alumno.actividades.show'])->assignRole([$role3]);
        
    }
}
