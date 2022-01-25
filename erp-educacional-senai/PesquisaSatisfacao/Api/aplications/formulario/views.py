from django_filters.rest_framework import DjangoFilterBackend
from .serializers import Formularioserializer, Importanciaserializer, Satisfacaoserializer, Perguntaserializer, \
    Alunoserializer, Envioserializer
from .models import Aluno, Perguntas, Satisfacao, Importancia, Formulario, Envio
from rest_framework import viewsets

turma = '2DES'

def getTurma(request, xturma):
    turma = xturma
    return request
# http://127.0.0.1:8000/passTurma/2DES


# def postFormulario(self, request):
#     serializer_class = Formularioserializer(data=request.data)
#     serializer_class.is_valid(raise_exception=True)
#     serializer_class.save()
#     return Response(serializer_class.data, status=status.HTTP_201_CREATED)


class FormularioApi(viewsets.ModelViewSet):
    queryset = Formulario.objects.all()
    serializer_class = Formularioserializer


class AlunoApi(viewsets.ModelViewSet):
    queryset = Aluno.objects.all()
    serializer_class = Alunoserializer


class PerguntaApi(viewsets.ModelViewSet):
    queryset = Perguntas.objects.all()
    serializer_class = Perguntaserializer


class SatisfacaoApi(viewsets.ModelViewSet):
    queryset = Satisfacao.objects.all()
    serializer_class = Satisfacaoserializer


class ImportanciaApi(viewsets.ModelViewSet):
    queryset = Importancia.objects.all()
    serializer_class = Importanciaserializer


class EnvioApi(viewsets.ModelViewSet):
    queryset = Envio.objects.all()
    serializer_class = Envioserializer


# ===================== Views consumidas pelo Nuxt =====================
# Retornando as perguntas de um formulario por turma específica
class QtdFormularios(viewsets.ModelViewSet):    
    queryset = Formulario.objects.all()
    serializer_class = Formularioserializer
    filter_backends = (DjangoFilterBackend,)
    filter_fields = ('id_turma',)

# Retornando as importancias altas por turma, do formulário
class QtdImportanciaAlta(viewsets.ModelViewSet):
    queryset = Formulario.objects.filter(
        id_importancia__desc__icontains = 'Alta',
        id_turma__nome__icontains = turma,
    )
    serializer_class = Formularioserializer

# Retornando as importancias medias por turma, do formulário
class QtdImportanciaMedia(viewsets.ModelViewSet):
    queryset = Formulario.objects.filter(
        id_importancia__desc__icontains = 'Media',
        id_turma__nome__icontains = turma
    )
    serializer_class = Formularioserializer

# Retornando as importancias baixas por turma, do formulário
class QtdImportanciaBaixa(viewsets.ModelViewSet):
    queryset = Formulario.objects.filter(
        id_importancia__desc__icontains = 'Baixa',
        id_turma__nome__icontains = turma
    )
    serializer_class = Formularioserializer



# Retornando as satisfacoes ÓTIMAS por turma, do formulário
class QtdSatisfacaoOtima(viewsets.ModelViewSet):
    queryset = Formulario.objects.filter(
        id_satisfacao__desc__icontains = 'Ótimo'
    )
    serializer_class = Formularioserializer

# Retornando as satisfacoes BOAS por turma, do formulário
class QtdSatisfacaoBoa(viewsets.ModelViewSet):
    queryset = Formulario.objects.filter(
        id_satisfacao__desc__icontains = 'Bom',
    )
    serializer_class = Formularioserializer

# Retornando as satisfacoes REGULARES por turma, do formulário
class QtdSatisfacaoRegular(viewsets.ModelViewSet):
    queryset = Formulario.objects.filter(
        id_satisfacao__desc__icontains = 'Regular',
    )
    serializer_class = Formularioserializer

# Retornando as satisfacoes RUINS por turma, do formulário
class QtdSatisfacaoRuim(viewsets.ModelViewSet):
    queryset = Formulario.objects.filter(
        id_satisfacao__desc__icontains = 'Ruim',
    )
    serializer_class = Formularioserializer

# Retornando as satisfacoes NA por turma, do formulário
class QtdSatisfacaoNA(viewsets.ModelViewSet):
    queryset = Formulario.objects.filter(
        id_satisfacao__desc__icontains = 'Não se aplica',
    )
    serializer_class = Formularioserializer