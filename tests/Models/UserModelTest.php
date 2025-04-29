<?php

namespace Tests;

use PHPUnit\Framework\TestCase;
use App\Models\UserModel;

class UserModelTest extends TestCase
{
    public function testFindAllUsers(): void
    {
        $model = new UserModel();
        $users = $model->findAll();

        $this->assertIsArray($users, "findAll retourne un tableau !");
    }
}
