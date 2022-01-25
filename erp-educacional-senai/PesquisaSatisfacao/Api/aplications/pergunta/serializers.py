from rest_framework import serializers

from .models import Perguntas

class PerguntasSerializer(serializers.ModelSerializer):
    class Meta:
        model = Perguntas
        fields = (
            "pergunta",
        )