from django.contrib.auth.models import User
from django.db import models

class Perguntas(models.Model):

    # numero = models.CharField(max_length=10, default="")
    pergunta = models.CharField(max_length=200)

    def __str__(self):
        return self.pergunta