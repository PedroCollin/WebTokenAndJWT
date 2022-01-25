from django.db import models
from ..turma.models import Turma

class Aluno(models.Model):
    nome = models.CharField(max_length=60)
    ra = models.CharField(max_length=20)
    cpf = models.CharField(max_length=14)
    turma = models.ForeignKey(Turma, related_name="fk_turma", on_delete=models.CASCADE)



    def __str__(self):
        return '%s' % self.nome