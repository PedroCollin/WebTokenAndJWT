from rest_framework import serializers
from .models import Aluno,Turma

class Alunoserializer(serializers.ModelSerializer):
    class Meta:
        model=Aluno
        fields='__all__'

class Turmaserializer(serializers.ModelSerializer):
    Aluno=Alunoserializer(read_only=True, many=True)
    class Meta:
        model=Turma
        fields='__all__'