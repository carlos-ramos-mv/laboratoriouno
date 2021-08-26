<?php

namespace App\Http\Livewire;


use App\Models\Actividad;
use App\Models\Tema;
use App\Models\Modulo;
use App\Models\Curso;
use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Livewire\Component;

class Publicar extends Component
{

    public Model $model;
    public $field;
    public bool $isActive;
    public $s;
    public $action = null;

    protected $listeners = [
        'moduloUpdated' => 'refreshModulos',
        'temaUpdated' => 'refreshTemas',
        'actividadUpdated' => 'refreshActividades',
    ];

    public function mount()
    {
        if ($this->action=='admin') {
            $this->isActive = (bool) $this->field;
        } else {
            $this->isActive = (bool) $this->model->getAttribute($this->field);
        }
        if ($this->isActive) {
            $this->s = "checked";
        } else {
            $this->s = "";
        }
    }

    public function render()
    {
        return view('livewire.publicar');
    }

    public function publicar()
    {
        if ($this->isActive) $this->s = "";
        else $this->s = "checked";
        DB::beginTransaction();
        try {
            $this->model->setAttribute('status', !$this->isActive);
            $this->model->save();
            $this->updateRecursivo(!$this->isActive);
            $this->isActive = !$this->isActive;
            DB::commit();
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            DB::rollBack();
        }
    }

    public function admin()
    {
        if ($this->isActive) $this->s = "";
        else $this->s = "checked";
        DB::beginTransaction();
        try {
            $user = User::find($this->model->getAttribute('id'));
            if ($this->isActive) {
                $user->removeRole('Admin');
            } else {
                $user->assignRole('Admin');
            }
            $this->isActive = !$this->isActive;
            DB::commit();
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            DB::rollBack();
        }
    }

    public function update()
    {
        if ($this->isActive) {
            $this->model->setAttribute('status', false);
            $this->isActive = false;
            $this->s = "";
            if (get_class($this->model) != 'App\Model\User') {
                $this->updateRecursivo(false);
            }
        } else {
            $this->model->setAttribute('status', true);
            $this->isActive = true;
            $this->s = "checked";
            if (get_class($this->model) != 'App\Model\User') {
                $this->updateRecursivo(true);
            }
        }
        $this->model->save();
    }

    private function updateRecursivo(bool $status)
    {
        switch (get_class($this->model)) {
            case 'App\Models\Curso':
                $this->refreshCurso();
                foreach ($this->model->modulos as $modulo) {
                    $modulo->setAttribute('status', $status);
                    $modulo->save();
                    $this->refreshModulos();
                    foreach ($modulo->temas as $tema) {
                        $tema->setAttribute('status', $status);
                        $tema->save();
                        $this->refreshTemas();
                        foreach ($tema->actividades as $actividad) {
                            $actividad->setAttribute('status', $status);
                            $actividad->save();
                            $this->refreshActividades();
                        }
                    }
                }

                break;
            case 'App\Models\Modulo':
                $this->refreshModulos();
                foreach ($this->model->temas as $tema) {
                    $tema->setAttribute('status', $status);
                    $tema->save();
                    $this->refreshTemas();
                    foreach ($tema->actividades as $actividad) {
                        $actividad->setAttribute('status', $status);
                        $actividad->save();
                        $this->refreshActividades();
                    }
                }

                break;
            case 'App\Models\Tema':
                $this->refreshTemas();
                foreach ($this->model->actividades as $actividad) {
                    $actividad->setAttribute('status', $status);
                    $actividad->save();
                    $this->refreshActividades();
                }

                break;
            case 'App\Models\Actividad':
                $this->refreshActividades();
                break;
            default:

                break;
        }
        /* switch (get_class($this->model)) {
            case 'App\Models\Curso':
                for ($i = 0; $i < sizeof($this->model->modulos); $i++) {
                    $this->model->modulos[$i]->setAttribute('status', $status)->save();
                    $this->emit('moduloUpdated');
                    for ($j = 0; $j < sizeof($this->model->modulos[$i]->temas); $j++) {
                        $this->model->modulos[$i]->temas[$j]->setAttribute('status', $status)->save();
                        $this->emit('temaUpdated');
                        for ($k = 0; $k < sizeof($this->model->modulos[$i]->temas[$j]->actividades); $k++) {
                            $this->model->modulos[$i]->temas[$j]->actividades[$k]->setAttribute('status', $status)->save();
                            //$this->emit('actividadUpdated');
                            $this->refreshActividad($this->model->modulos[$i]->temas[$j]->actividades[$k]->id);
                            usleep(3 * 1000);
                        }
                        usleep(3 * 1000);
                    }
                    usleep(3 * 1000);
                }
                break;

            case 'App\Models\Modulo':
                for ($j = 0; $j < sizeof($this->model->temas); $j++) {
                    $this->model->temas[$j]->setAttribute('status', $status)->save();
                    $this->emit('temaUpdated');
                    for ($k = 0; $k < sizeof($this->model->temas[$j]->actividades); $k++) {
                        $this->model->temas[$j]->actividades[$k]->setAttribute('status', $status)->save();
                        $this->emit('actividadUpdated');
                        usleep(3 * 1000);
                    }
                    usleep(3 * 1000);
                }
                break;

            case 'App\Models\Tema':
                for ($k = 0; $k < sizeof($this->model->actividades); $k++) {
                    $this->model->actividades[$k]->setAttribute('status', $status)->save();
                    $this->emit('actividadUpdated');
                    usleep(3 * 1000);
                }
                break;
        } */
    }

    public function refreshCurso()
    {
        if (get_class($this->model) == 'App\Models\Curso') {
            $this->model = Curso::find($this->model->id);
            $this->mount();
        }
    }

    public function refreshModulos()
    {
        if (get_class($this->model) == 'App\Models\Modulo') {
            $this->model = Modulo::find($this->model->id);
            $this->mount();
        }
    }

    public function refreshTemas()
    {
        if (get_class($this->model) == 'App\Models\Tema') {
            $this->model = Tema::find($this->model->id);
            $this->mount();
        }
    }

    public function refreshActividades()
    {
        if (get_class($this->model) == 'App\Models\Actividad') {
            $this->model = Actividad::find($this->model->id);
            $this->mount();
        }
    }
}
