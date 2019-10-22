<?php

namespace yiiexttbq\blogmodule\controllers\backend;

use Yii;
use yiiapps\blog\models\BlogPost;
use yii\web\UploadedFile;

class PostController extends \funson86\blog\controllers\backend\BlogPostController
{
    public function actionCreate()
    {
        //if(!Yii::$app->user->can('createPost')) throw new HttpException(401, 'No Auth');

        $model = new BlogPost();
        $model->loadDefaultValues();
        $model->user_id = Yii::$app->user->identity->id;

        if ($model->load(Yii::$app->request->post())) {
            $model->banner = UploadedFile::getInstance($model, 'banner');
            if ($model->validate()) {
                if ($model->banner) {
                    $bannerName = Yii::$app->params['blogUploadPath'] . date('Ymdhis') . rand(1000, 9999) . '.' . $model->banner->extension;
                    $model->banner->saveAs(Yii::getAlias('@frontend/web') . DIRECTORY_SEPARATOR . $bannerName);
                    $model->banner = $bannerName;
                }
                $model->save(false);

                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    public function actionUpdate($id)
    {
        //if(!Yii::$app->user->can('updatePost')) throw new HttpException(401, 'No Auth');

        $model = $this->findModel($id);
        $oldBanner = $model->banner;

        if ($model->load(Yii::$app->request->post())) {
            $model->banner = UploadedFile::getInstance($model, 'banner');
            if ($model->validate()) {
                if ($model->banner) {
                    $bannerName = Yii::$app->params['blogUploadPath'] . date('Ymdhis') . rand(1000, 9999) . '.' . $model->banner->extension;
                    $model->banner->saveAs(Yii::getAlias('@frontend/web') . DIRECTORY_SEPARATOR . $bannerName);
                    $model->banner = $bannerName;
                } else {
                    $model->banner = $oldBanner;
                }

                $model->save(false);
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }
}
