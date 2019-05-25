<?php
namespace yiiapps\adminblog;

class Module extends \funson86\blog\Module
{

    public function init()
    {
        parent::init();
        $this->layout = "@yiiapps/adminlte/views/layouts/main";
        // die($this->layout);

        if ($this->getIsBackend() === true) {
            $this->setViewPath('@yiiapps/adminblog/views/backend');
        } elseif (isset(\Yii::$app->params['blogTheme'])) {
            $this->setViewPath('@frontend/themes/blog');
            $this->setLayoutPath('@frontend/themes/blog/layouts');
        } else {
            $this->setViewPath('@yiiapps/adminblog/views/frontend');
            $this->setLayoutPath('@yiiapps/adminblog/views/frontend/layouts');
        }
    }

}
