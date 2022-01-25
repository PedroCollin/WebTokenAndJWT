from django.contrib.auth.models import User
from django.db import models

class Colaborador(models.Model):

    nome = models.CharField(max_length=50, default="")
    nif = models.CharField(max_length=15, default="")
    nivelAcesso = models.CharField(max_length=2)
    senha = models.CharField(max_length=20)


    def __str__(self):
        return '%s' % self.nome