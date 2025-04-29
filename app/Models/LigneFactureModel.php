<?php

namespace App\Models;

use CodeIgniter\Model;
class LigneFactureModel extends Model
{
    protected $table = 'ligne_facture';
    protected $primaryKey = 'id';
    protected $allowedFields = ['article_id', 'quantite', 'prix_unitaire'];
    protected $returnType = 'array';

    protected $validationRules = [
        'article_id' => 'required|integer',
        'quantite' => 'required|integer',
        'prix_unitaire' => 'required|decimal'
    ];
}
