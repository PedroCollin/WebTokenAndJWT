from rest_framework import serializers
from .models import Empresa, Turma

class Empresaserializer(serializers.ModelSerializer):
    class Meta:
        model = Empresa
        fields = '__all__'

class Turmaserializer(serializers.ModelSerializer):

    Empresa=Empresaserializer(read_only=True, many=True)
    class Meta:
        model = Turma
        fields = '__all__'
