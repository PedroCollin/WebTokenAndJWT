from django.contrib.auth.models import User
from django.db import models
from ..formulario.models import Formulario

class Dashboard(models.Model):

    # formularios_preenchidos = models.objects.filter(id_pergunta=1)
    qtd_frm_preenchidos = models.IntegerField(default=0)

    def __str__(self):
        return str(Dashboard.objects.all().count())