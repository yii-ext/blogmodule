<?php

return [
    'defaultRoute' => 'blog',
    'modules' => [
        'blog' => [
            'class' => 'funson86\blog\Module',
            'controllerNamespace' => 'funson86\blog\controllers\frontend',
        ],
    ],
];
