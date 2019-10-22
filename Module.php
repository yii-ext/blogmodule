<?php
namespace yiiexttbq\blogmodule;

class Module extends \funson86\blog\Module
{

    public function init()
    {
        parent::init();
        $this->layout = "@vendor/yiiexttbq/adminlte/views/layouts/main";
        // die($this->layout);

        if ($this->getIsBackend() === true) {
            $this->setViewPath('@vendor/yiiexttbq/blogmodule/views/backend');
        } elseif (isset(\Yii::$app->params['blogTheme'])) {
            $this->setViewPath('@frontend/themes/blog');
            $this->setLayoutPath('@frontend/themes/blog/layouts');
        } else {
            $this->setViewPath('@vendor/yiiexttbq/blogmodule/views/frontend');
            $this->setLayoutPath('@vendor/yiiexttbq/blogmodule/views/frontend/layouts');
        }
    }

}
