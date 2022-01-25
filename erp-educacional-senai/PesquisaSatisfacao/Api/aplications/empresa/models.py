from django.contrib.auth.models import User
from django.db import models

class Empresa(models.Model):

    nome = models.CharField(max_length=25, default="")


    def __str__(self):
        return '%s' % self.nome