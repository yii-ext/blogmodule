<?php

return [
    'aliases' => [
        '@yiiexttbq/adminblog' => '@vendor/yiiexttbq/blogmodule',
    ],
    'modules' => [
        'adminblog' => [
            'class' => 'yiiexttbq\blogmodule\Module',
            'controllerNamespace' => 'yiiexttbq\blogmodule\controllers\backend',
        ],
    ],
];
