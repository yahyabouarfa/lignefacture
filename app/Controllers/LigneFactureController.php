<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\LigneFactureModel;

class LigneFactureController extends BaseController
{
    protected $model;

    public function __construct()
    {
        $this->model = new LigneFactureModel();
    }

    public function index()
    {
        $data = $this->model->findAll();
        return $this->response->setJSON($data);
    }
    public function create()
    {
        $data = $this->request->getPost();

        if ($this->model->insert($data)) {
            return $this->response->setJSON(['status' => 'success', 'message' => 'Ligne ajoutée avec succès']);
        }

        return $this->response->setStatusCode(400)->setJSON([
            'status' => 'error',
            'errors' => $this->model->errors()
        ]);
    }
    public function update($id)
    {
        $data = $this->request->getRawInput();

        if ($this->model->update($id, $data)) {
            return $this->response->setJSON(['status' => 'success', 'message' => 'Ligne mise à jour']);
        }

        return $this->response->setStatusCode(400)->setJSON([
            'status' => 'error',
            'errors' => $this->model->errors()
        ]);
    }
    public function delete($id)
    {
        if ($this->model->delete($id)) {
            return $this->response->setJSON(['status' => 'success', 'message' => 'Ligne supprimée']);
        }

        return $this->response->setStatusCode(400)->setJSON(['status' => 'error', 'message' => 'Échec de la suppression']);
    }
    public function show($id)
    {
        $ligne = $this->model->find($id);

        if ($ligne) {
            return $this->response->setJSON($ligne);
        }

        return $this->response->setStatusCode(404)->setJSON(['status' => 'error', 'message' => 'Ligne non trouvée']);
    }
}
