<?php

use function Cake\Core\env;

return [

    'debug' => filter_var(env('DEBUG', true), FILTER_VALIDATE_BOOLEAN),
    

    'Security' => [
        'salt' => 'mi_clave_super_segura_123456789',
    ],

    'Datasources' => [
          'default' => [
            'className' => 'Cake\Database\Connection',
            'driver' => 'Cake\Database\Driver\Mysql',

            'host' => 'mysql.railway.internal',
            'port' => 3306,

            'username' => 'root',
            'password' => '=ghIbcyrdRuBrUWMTATsmLFZKYTwYHAmX',

            'database' => 'railway',

            'persistent' => false,
            'encoding' => 'utf8mb4',
            'timezone' => 'UTC',
            'cacheMetadata' => true,
            'log' => true,
        ],

        'test' => [
            'className' => 'Cake\Database\Connection',
            'driver' => 'Cake\Database\Driver\Mysql',
            'persistent' => false,
            'host' => 'mysql.railway.internal',
            'port' => env('MYSQLPORT', '3306'),
            'username' => env('MYSQLUSER', 'root'),
            'password' => env('MYSQLPASSWORD', ''),
            'database' => env('MYSQLDATABASE', 'my_app_test'),
            'encoding' => 'utf8mb4',
            'timezone' => 'UTC',
            'flags' => [],
            'cacheMetadata' => true,
            'log' => false,
        ],
    ],

    'EmailTransport' => [
        'default' => [
            'host' => env('EMAIL_HOST'),
            'port' => env('EMAIL_PORT', 25),
            'username' => env('EMAIL_USERNAME', null),
            'password' => env('EMAIL_PASSWORD', null),
            'client' => env('EMAIL_CLIENT', null),
        ],
    ],
];