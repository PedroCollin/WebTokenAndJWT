from django.contrib.auth.models import User
from django.db import models

class Envio(models.Model):

    semestre = models.CharField(max_length=2, default="")
    ano = models.CharField(max_length=4, default="")


    def __str__(self):
        return '%s' % self.semestre