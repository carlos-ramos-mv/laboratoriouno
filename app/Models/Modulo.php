<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Modulo extends Model
{
    use HasFactory;

    public function temas()
    {
        return $this->hasMany(Tema::class);
    }

    public function curso()
    {
        return $this->belongsTo(Curso::class);
    }

    public function avances()
    {
        return $this->morphMany(Avance::class, 'avanzable');
    }

}
