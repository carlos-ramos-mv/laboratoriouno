<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tema extends Model
{
    use HasFactory;

    public function actividades()
    {
        return $this->hasMany(Actividad::class);
    }

    public function modulo()
    {
        return $this->belongsTo(Modulo::class);
    }

    public function avances()
    {
        return $this->morphMany(Avance::class, 'avanzable');
    }

    public function rates()
    {
        return $this->morphMany(Rate::class,'rateable');
    }

}
