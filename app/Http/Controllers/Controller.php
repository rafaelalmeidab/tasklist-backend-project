<?php
//sudo chown -R rafaelalmeidab:rafaelalmeidab /home/rafaelalmeidab/projetos/personal/tasklist-backend-project
namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;
}
