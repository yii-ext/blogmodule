展示页用boostrap改写

190828 加入原文链接

## basic模版安装方式 ##
    composer create-project --prefer-dist yiisoft/yii2-app-basic [项目名称]
## 安装 ##
	composer require yiiexttbq/adminlte
配置
    把advanced的 common/models/user.php 复制到根目录

    配置 yiiexttbq/adminlte-asset-ext, 查看详细配置过程

    //管理端
    $config['aliases']['@yiiexttbq/adminblog'] = '@vendor/yiiexttbq/blogmodule';
    $config['modules']['adminblog'] = [
        'class' => 'yiiexttbq\adminblog\Module',
        'controllerNamespace' => 'yiiexttbq\adminblog\controllers\backend',
    ];
    //frontend
    $config['defaultRoute'] = 'blog';
    $config['modules']['blog'] = [
        'class' => 'funson86\blog\Module',
        'controllerNamespace' => 'funson86\blog\controllers\frontend',
    ];
    $config['aliases']['@common/models'] = '@app/common/models';

    导入数据库 190524.sql