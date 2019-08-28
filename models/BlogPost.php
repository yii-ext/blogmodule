<?php

namespace yiiapps\blog\models;

class BlogPost extends \funson86\blog\models\BlogPost
{
    public function rules()
    {
        return [
            [['catalog_id', 'title', 'content', 'tags', 'surname', 'user_id'], 'required'],
            [['catalog_id', 'click', 'user_id', 'status'], 'integer'],
            [['brief', 'content'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['banner'], 'file', 'extensions' => 'jpg, png', 'mimeTypes' => 'image/jpeg, image/png'],
            [['title', 'tags', 'surname'], 'string', 'max' => 128],
            [['source_url'], 'string', 'max' => 255],
        ];
    }
}
