from django.shortcuts import render
from .models import Aluno, Turma
from .serializers import Alunoserializer, Turmaserializer
from rest_framework import viewsets

class TurmaAPI(viewsets.ModelViewSet):
    queryset = Turma.objects.all()
    serializer_class = Turmaserializer

class AlunoAPI(viewsets.ModelViewSet):
    queryset = Aluno.objects.all()
    serializer_class = Alunoserializer