from rest_framework import serializers
from .models import *

class TurmaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Turma
        fields = [
            'id',
            'cod_turma',
            'nome',
            'periodo',
            'dataInicio',
        ]

class AlunoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Aluno
        fields = [
            'id',
            'nome',
            'ra',
            'cpf',
            'turma',
        ]

class UsuarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Usuario
        fields = [
            'id',
            'nome',
            'identificador',
            'senha',
            'nivelAcesso',
        ]

class MateriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Materia
        fields = [
            'id',
            'nome',
        ]

class AssinaturaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Assinatura
        fields = [
            'id',
            'docente',
            'coordenador',
            'social',
            'aluno',
            'responsavel',
            'fiap',
        ]

class FiapSerializer(serializers.ModelSerializer):
    class Meta:
        model = Fiap
        fields = [
            'id',
            'progresso',
            'aluno',
            'turma',
            'materia',
            'dataInicio',
            'dataFinal',
            'usuario',
        ]

class FrequenciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Frequencia
        fields = [
            'id',
            'aulasprevistas',
            'ausencias',
            'fiap',
        ]

class AproveitamentoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Aproveitamento
        fields = [
            'id',
            'materia',
            'notamedia',
            'notaaluno',
            'notarec',
            'fiap',
        ]

class AprendizagemSerializer(serializers.ModelSerializer):
    class Meta:
        model = Aprendizagem
        fields = [
            'id',
            'atencao',
            'compreensao',
            'comprometimento',
            'relacionamento',
            'Outros',
            'fiap',
        ]

class OcorrenciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ocorrencia
        fields = [
            'id',
            'advverbal',
            'advescrita',
            'afastamento',
            'cancelmatricula',
            'fiap',
        ]

class ObservacaoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Observacao
        fields = [
            'id',
            'observacao',
            'fiap',
            'data',
        ]

class EmpresaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Observacao
        fields = [
            'id',
            'nome',
        ]

class ImportanciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Observacao
        fields = [
            'id',
            'nivel',
        ]

class SatisfacaoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Observacao
        fields = [
            'id',
            'nivel',
        ]

class PerguntaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Observacao
        fields = [
            'id',
            'descricao',
        ]

class FormularioSerializer(serializers.ModelSerializer):
    class Meta:
        model = Observacao
        fields = [
            'id',
            'aluno',
            'pergunta',
            'importancia',
            'satisfacao',
            'feedback',
        ]