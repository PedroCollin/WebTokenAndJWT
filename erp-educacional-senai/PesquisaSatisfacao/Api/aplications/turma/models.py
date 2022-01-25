from django.db import models

from ..empresa.models import Empresa

class Turma(models.Model):
    nome = models.CharField(max_length=50)
    totalAlunos = models.IntegerField(default=0)
    id_empresa = models.ForeignKey(Empresa, related_name="fk_empresa", on_delete=models.CASCADE)
      
    def __str__(self):
        return '%s, %s' % (self.nome, self.totalAlunos)