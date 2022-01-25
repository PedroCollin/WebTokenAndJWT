from .serializers import Empresaserializer, Turmaserializer
from .models import Empresa, Turma
from rest_framework import viewsets


class EmpresaApi(viewsets.ModelViewSet):
    queryset = Empresa.objects.all()
    serializer_class = Empresaserializer


class TurmaApi(viewsets.ModelViewSet):
    queryset = Turma.objects.all()
    serializer_class = Turmaserializer
    # Link para retornar as turmas cadastradas: http://127.0.0.1:8000/api/v1/Turma/
