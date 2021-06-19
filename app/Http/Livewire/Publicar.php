<?php

namespace App\Http\Livewire;


use App\Models\Actividad;
use App\Models\Tema;
use App\Models\Modulo;
use App\Models\Curso;
use Illuminate\Database\Eloquent\Model;
use Livewire\Component;

class Publicar extends Component
{

    public Model $model;
    public $field;
    public bool $isActive;
    public $s;

    protected $listeners = ['moduloUpdated' => 'refreshModulos',
                            'temaUpdated' => 'refreshTemas',
                            'actividadUpdated' => 'refreshActividades',];

    public function mount()
    {
        $this->isActive = (bool) $this->model->getAttribute($this->field);
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

    public function update()
    {
        if ($this->isActive) {
            $this->model->setAttribute('status', false);
            $this->isActive = false;
            $this->s = "";
            if (get_class($this->model)!='App\Model\User') {
                $this->updateRecursivo(false);
            }
            
        } else {
            $this->model->setAttribute('status', true);
            $this->isActive = true;
            $this->s = "checked";
            if (get_class($this->model)!='App\Model\User') {
                $this->updateRecursivo(true);
            }
        }
        $this->model->save();
    }

    private function updateRecursivo(bool $status)
    {
        switch (get_class($this->model)) {
            case 'App\Models\Curso':
                for ($i=0; $i < sizeof($this->model->modulos); $i++) { 
                    $this->model->modulos[$i]->setAttribute('status', $status)->save();
                    $this->emit('moduloUpdated');
                    for ($j=0; $j < sizeof($this->model->modulos[$i]->temas); $j++) { 
                        $this->model->modulos[$i]->temas[$j]->setAttribute('status', $status)->save();
                        $this->emit('temaUpdated');
                        for ($k=0; $k < sizeof($this->model->modulos[$i]->temas[$j]->actividades); $k++) { 
                            $this->model->modulos[$i]->temas[$j]->actividades[$k]->setAttribute('status', $status)->save();
                            $this->emit('actividadUpdated');
                            usleep(3 * 1000);
                        }
                        usleep(3 * 1000);
                    }
                    usleep(3 * 1000);
                }
                break;
            
            case 'App\Models\Modulo':
                for ($j=0; $j < sizeof($this->model->temas); $j++) { 
                    $this->model->temas[$j]->setAttribute('status', $status)->save();
                    $this->emit('temaUpdated');
                    for ($k=0; $k < sizeof($this->model->temas[$j]->actividades); $k++) { 
                        $this->model->temas[$j]->actividades[$k]->setAttribute('status', $status)->save();
                        $this->emit('actividadUpdated');
                        usleep(3 * 1000);
                    }
                    usleep(3 * 1000);
                }
                break;
                
            case 'App\Models\Tema':
                for ($k=0; $k < sizeof($this->model->actividades); $k++) { 
                    $this->model->actividades[$k]->setAttribute('status', $status)->save();
                    $this->emit('actividadUpdated');
                    usleep(3 * 1000);
                }
                break;
                
        }
    }

    public function refreshModulos()
    {
        if (get_class($this->model)=='App\Models\Modulo') {
            $this->model = Modulo::find($this->model->id);
            $this->mount();
        }
    }
    
    public function refreshTemas()
    {
        if (get_class($this->model)=='App\Models\Tema') {
            $this->model = Tema::find($this->model->id);
            $this->mount();
        }
    }

    public function refreshActividades()
    {
        if (get_class($this->model)=='App\Models\Actividad') {
            $this->model = Actividad::find($this->model->id);
            $this->mount();
        }
    }

}
