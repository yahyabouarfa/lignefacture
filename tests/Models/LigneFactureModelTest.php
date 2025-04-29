<?php

use PHPUnit\Framework\TestCase;
use App\Models\LigneFactureModel;

class LigneFactureModelTest extends TestCase
{
    public function testModelCanBeInstantiated()
    {
        $model = new LigneFactureModel();
        $this->assertInstanceOf(LigneFactureModel::class, $model);
    }

    public function testAllowedFieldsAreCorrect()
    {
        
        $model = new LigneFactureModel();
        $expectedFields = ['article_id', 'quantite', 'prix_unitaire'];
        $this->assertEquals($expectedFields, $model->allowedFields);
    }
}
