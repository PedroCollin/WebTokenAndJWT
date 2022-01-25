from django.shortcuts import render

from rest_framework import viewsets

from .serializers import EmpresaSerializer
from .models import Empresa

from django.core.exceptions import PermissionDenied


class EmpresaViewSet(viewsets.ModelViewSet):
    queryset = Empresa.objects.all()
    serializer_class = EmpresaSerializer

    def get_queryset(self):
        return self.queryset.filter(created_by=self.request.user)

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)

    def perform_update(self, serializer):
        obj = self.get_object()

        if self.request.user != obj.created_by:
            raise PermissionDenied('Apenas o criador pode editar.')

        serializer.save()