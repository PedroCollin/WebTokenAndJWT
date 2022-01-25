from django.contrib.auth.models import User
from django.db import models

class Importancia(models.Model):

    # nivel = models.CharField(max_length=2, default="")
    desc = models.CharField(max_length=15, default="")

    def __str__(self):
        return self.desc