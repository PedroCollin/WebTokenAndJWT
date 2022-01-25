from django.urls import path
from .views import *

urlpatterns = [
    path("turma/", TurmaAPIView.as_view(), name='turma'),
    path('turma/<int:pk>/', TurmaAPIView.as_view(), name='turmaParameters'),

    path('aluno/', AlunoAPIView.as_view(), name='aluno'),
    path('aluno/<int:pk>/', AlunoAPIView.as_view(), name='alunoParameters'),

    path('usuario/', UsuarioAPIView.as_view(), name='usuario'),
    path('usuario/<int:pk>/', UsuarioAPIView.as_view(), name='usuarioParameters'),

    path('materia/', MateriaAPIView.as_view(), name='materia'),
    path('materia/<int:pk>/', MateriaAPIView.as_view(), name='materiaParameters'),

    path('assinatura/', AssinaturaAPIView.as_view(), name='assinatura'),
    path('assinatura/<int:pk>/', AssinaturaAPIView.as_view(), name='assinaturaParameters'),

    path('fiap/', FiapAPIView.as_view(), name='fiap'),
    path('fiaps', FiapBackendAPIView.as_view(), name='fiaps'),
    path('fiap/<int:pk>/', FiapAPIView.as_view(), name='fiapParameters'),

    path('frequencia/', FrequenciaAPIView.as_view(), name='frequencia'),
    path('frequencia/<int:pk>/', FrequenciaAPIView.as_view(), name='frequenciaParameters'),

    path('aproveitamento/', AproveitamentoAPIView.as_view(), name='aproveitamento'),
    path('aproveitamento/<int:pk>/', AproveitamentoAPIView.as_view(), name='aproveitamentoParameters'),

    path('aprendizagem/', AprendizagemAPIView.as_view(), name='aprendizagem'),
    path('aprendizagem/<int:pk>/', AprendizagemAPIView.as_view(), name='aprendizagemParameters'),

    path('ocorrencia/', OcorrenciaAPIView.as_view(), name='ocorrencia'),
    path('ocorrencia/<int:pk>/', OcorrenciaAPIView.as_view(), name='ocorrenciaParameters'),

    path('observacao/', ObservacaoAPIView.as_view(), name='observacao'),
    path('observacao/<int:pk>/', ObservacaoAPIView.as_view(), name='observacaoParameters'),

    path('avancarTurma/', Avancar_turmasAPIView.as_view(), name='avancar_turma'),

    path('antecederTurma/', Anteceder_turmasAPIView.as_view(), name='avancar_turma'),
]
