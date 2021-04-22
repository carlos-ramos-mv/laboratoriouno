<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Actividad extends Model
{

    protected $table = "actividades";

    use HasFactory;

    public function puntuaciones()
    {
        return $this->hasMany(Puntuacion::class);
    }

    public function tema()
    {
        return $this->belongsTo(Tema::class);
    }

}
