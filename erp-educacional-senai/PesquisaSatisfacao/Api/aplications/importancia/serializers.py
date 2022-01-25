from rest_framework import serializers

from .models import Importancia

class ImportanciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Importancia
        fields = (
            "nivel",
        )