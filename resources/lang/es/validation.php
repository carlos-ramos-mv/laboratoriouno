<?php

return [

    /*
    |--------------------------------------------------------------------------
    | válidation Lunguage Lines
    |--------------------------------------------------------------------------
    |
    | The following lunguage lines contener the default error messages used by
    | the válidator class. Some of these rules have multiple versions such
    | as the size rules. Feel free to tweak each of these messages here.
    |
    */

    'accepted' => ':attribute debe ser aceptado.',
    'active_url' => ':attribute no es una URL válida.',
    'after' => ':attribute debe ser una fecha posterior a :date.',
    'after_or_equal' => ':attribute debe ser una fecha posterior o igual a :date.',
    'alpha' => ':attribute sólo puede contener letras.',
    'alpha_dash' => ':attribute sólo puede contener letras, números, guiones y guiones bajos.',
    'alpha_num' => ':attribute sólo puede contener letras y números.',
    'array' => ':attribute debe ser una colección.',
    'before' => ':attribute debe ser una fecha previa a :date.',
    'before_or_equal' => ':attribute debe ser una fecha previa o igual a :date.',
    'between' => [
        'numeric' => ':attribute debe estar entre :min y :max.',
        'file' => ':attribute debe estar entre :min y :max kilobytes.',
        'string' => ':attribute debe estar entre :min y :max caracteres.',
        'array' => ':attribute debe tener entre :min y :max artículos.',
    ],
    'boolean' => 'El campo :attribute debe ser verdadero o flaso.',
    'confirmed' => ':attribute confirmación no coincide.',
    'date' => ':attribute no es una fecha válida.',
    'date_equals' => ':attribute debe ser una fecha igual a :date.',
    'date_format' => ':attribute no coincide con el formato :format.',
    'different' => ':attribute y :other deben ser diferentes.',
    'digits' => ':attribute debe tener :digits dígitos.',
    'digits_between' => ':attribute debe estar entre :min y :max dígitos.',
    'dimensions' => ':attribute tiene dimensiones de imagen inválidas.',
    'distinct' => 'El campo :attribute tiene un valor duplicado.',
    'email' => ':attribute debe ser una dirección de correo válida.',
    'ends_with' => ':attribute debe terminar con uno de los siguientes valores: :values.',
    'exists' => 'La selección de :attribute es inválida.',
    'file' => ':attribute debe ser un archivo.',
    'filled' => 'El campo :attribute debe tener un valor.',
    'gt' => [
        'numeric' => ':attribute debe ser más grande que :value.',
        'file' => ':attribute debe ser más grande que :value kilobytes.',
        'string' => ':attribute debe tener más de :value caracteres.',
        'array' => ':attribute debe tener más de :value artículos.',
    ],
    'gte' => [
        'numeric' => ':attribute debe ser más grande o igual que :value.',
        'file' => ':attribute debe ser más grande o igual que :value kilobytes.',
        'string' => ':attribute debe ser mayor o igual a :value caracteres.',
        'array' => ':attribute debe tener :value artículos o más.',
    ],
    'image' => ':attribute debe ser una imagen.',
    'in' => 'La selección de :attribute es inválida.',
    'in_array' => 'El campo :attribute no existe en :other.',
    'integer' => ':attribute debe ser un entero.',
    'ip' => ':attribute debe ser una dirección de IP válida.',
    'ipv4' => ':attribute debe ser una dirección de IPv4 válida.',
    'ipv6' => ':attribute debe ser una dirección de IPv6 válida.',
    'json' => ':attribute debe ser una cadena de texto JSON válida.',
    'lt' => [
        'numeric' => ':attribute debe ser menor que :value.',
        'file' => ':attribute debe ser menor que :value kilobytes.',
        'string' => ':attribute debe tener menos de :value caracteres.',
        'array' => ':attribute debe tener menos de :value artículos.',
    ],
    'lte' => [
        'numeric' => ':attribute debe ser menor o igual que :value.',
        'file' => ':attribute debe ser menor o igual que :value kilobytes.',
        'string' => ':attribute debe ser menor o igual a :value caracteres.',
        'array' => ':attribute no debe tener más de :value artículos.',
    ],
    'max' => [
        'numeric' => ':attribute no puede ser más grande que :max.',
        'file' => ':attribute no puede ser mayor a :max kilobytes.',
        'string' => ':attribute no puede tener más de :max caracteres.',
        'array' => ':attribute no puede tener más de :max artículos.',
    ],
    'mimes' => ':attribute debe ser un archivo de tipo: :values.',
    'mimetypes' => ':attribute debe ser un archivo de tipo: :values.',
    'min' => [
        'numeric' => ':attribute debe ser al menos :min.',
        'file' => ':attribute debe tener al menos :min kilobytes.',
        'string' => ':attribute debe tener al menos :min caracteres.',
        'array' => ':attribute debe tener al menos :min artículos.',
    ],
    'multiple_of' => ':attribute debe ser un múltiplo de :value',
    'not_in' => 'La selección de :attribute es inválida.',
    'not_regex' => ':attribute formato es inválido.',
    'numeric' => ':attribute debe ser un número.',
    'password' => 'La contraseña es incorrecta.',
    'present' => 'El campo :attribute debe estar presente.',
    'regex' => ':attribute formato es inválido.',
    'required' => 'El campo :attribute es requerido.',
    'required_if' => 'El campo :attribute es requerido cuando :other es :value.',
    'required_unless' => 'El campo :attribute es requerido a no ser que :other esté en :values.',
    'required_with' => 'El campo :attribute es requerido cuando :values está presente.',
    'required_with_all' => 'El campo :attribute es requerido cuando :values están presentes.',
    'required_without' => 'El campo :attribute es requerido cuando :values no está presente.',
    'required_without_all' => 'El campo :attribute es requerido cuando ninguno de :values están presentes.',
    'same' => ':attribute y :other deben coincidir.',
    'size' => [
        'numeric' => ':attribute debe ser :size.',
        'file' => ':attribute debe tener :size kilobytes.',
        'string' => ':attribute debe tener :size caracteres.',
        'array' => ':attribute debe contener :size artículos.',
    ],
    'starts_with' => ':attribute debe iniciar con uno de los siguientes: :values.',
    'string' => ':attribute debe ser una cadena de texto.',
    'timezone' => ':attribute debe ser una zona válida.',
    'unique' => ':attribute ha sido utilizada(o).',
    'uploaded' => ':attribute no se pudo cargar.',
    'url' => ':attribute formato es inválido.',
    'uuid' => ':attribute debe ser un UUID válido.',

    /*
    |--------------------------------------------------------------------------
    | Custom válidation Lunguage Lines
    |--------------------------------------------------------------------------
    |
    | Here you may specify custom válidation messages for attributes using the
    | convention "attribute.rule" to name the lines. This makes it quick to
    | specify a specific custom lunguage line for a given attribute rule.
    |
    */

    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],

    /*
    |--------------------------------------------------------------------------
    | Custom válidation Attributes
    |--------------------------------------------------------------------------
    |
    | The following lunguage lines are used to swap our attribute placeholder
    | with something more reader friendly such as "E-Mail Address" instead
    | of "email". This simply helps us make our message more expressive.
    |
    */

    'attributes' => [],

];
