# models.py
from django.db import models

class Empresa(models.Model):
    nome_empresa = models.CharField(max_length=255)
    nome = models.CharField(max_length=255)
    email = models.EmailField()
    telefone = models.CharField(max_length=20)
    cnpj = models.CharField(max_length=20)

    def __str__(self):
        return self.nome_empresa

class Endereco(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, related_name='enderecos')
    cep = models.CharField(max_length=10)
    logradouro = models.CharField(max_length=255)
    numero = models.CharField(max_length=10, blank=True, null=True)
    complemento = models.CharField(max_length=255, blank=True, null=True)
    bairro = models.CharField(max_length=255)
    cidade = models.CharField(max_length=255)
    uf = models.CharField(max_length=2)
    latitude = models.CharField(max_length=20)
    longitude = models.CharField(max_length=20)

class ISO(models.Model):
    empresa = models.ForeignKey(Empresa, on_delete=models.CASCADE, related_name='certificacoes')
    iso_type = models.CharField(max_length=50)
    odc = models.CharField(max_length=50)
    consultor = models.CharField(max_length=255)
    data_efetivacao = models.DateField()
    validade = models.DateField()
