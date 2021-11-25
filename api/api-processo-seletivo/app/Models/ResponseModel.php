<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ResponseModel extends Model
{
    private $status;
    private $message;
    private $dados;

    protected function getStatus(): int
    {
        return $this->status;
    }

    public function setStatus(int $status): void
    {
        $this->status = $status;
    }

    protected function getMessage(): string
    {
        return $this->message;
    }

    public function setMessage(string $message): void
    {
        $this->message = $message;
    }

    protected function getDados()
    {
        return $this->dados;
    }

    public function setDados($dados)
    {
        $this->dados = $dados;
    }

    public function getResponse(): array
    {
        return [
            "Status" => $this->getStatus(),
            'Mensagem' => $this->getMessage(),
            "Data" => $this->getDados()
        ];
    }
}
