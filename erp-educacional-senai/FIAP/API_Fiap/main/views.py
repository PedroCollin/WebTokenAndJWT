import math

from django.shortcuts import render, redirect
from .models import Aluno, Usuario, Turma, Fiap, Materia, Frequencia, Assinatura, Observacao, Ocorrencia, \
    Aprendizagem, Aproveitamento
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .serializers import *
from rest_framework.permissions import IsAuthenticated

class TurmaAPIView(APIView):
    """
    API Turma
    """

    permission_classes = (IsAuthenticated,)

    def get(self, request, pk=''):
        if pk == '':
            turma = Turma.objects.all()
            serializer = TurmaSerializer(turma, many=True)
            return Response(serializer.data)
        else:
            turma = Turma.objects.get(id=pk)
            serializer = TurmaSerializer(turma)
            return Response(serializer.data)


    def post(self, request):
        serializer = TurmaSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        turma = Turma.objects.get(id=pk)
        serializer = TurmaSerializer(turma, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        turma = Turma.objects.get(id=pk)
        turma.delete()
        return Response('Turma Apagada')


class AlunoAPIView(APIView):
    """
    API Aluno
    """

    def get(self, request, pk=''):
        if pk == '':
            aluno = Aluno.objects.all()
            serializer = AlunoSerializer(aluno, many=True)
            return Response(serializer.data)
        else:
            aluno = Aluno.objects.get(id=pk)
            serializer = AlunoSerializer(aluno)
            return Response(serializer.data)


    def post(self, request):
        serializer = AlunoSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        aluno = Aluno.objects.get(id=pk)
        serializer = AlunoSerializer(aluno, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        aluno = Aluno.objects.get(id=pk)
        aluno.delete()
        return Response('Aluno Apagado')

class UsuarioAPIView(APIView):
    """
    API Colaborador
    """

    def get(self, request, pk=''):
        if pk == '':
            colab = Usuario.objects.all()
            serializer = UsuarioSerializer(colab, many=True)
            return Response(serializer.data)
        else:
            colab = Usuario.objects.get(identificador=pk) #changed
            serializer = UsuarioSerializer(colab)
            return Response(serializer.data)


    def post(self, request):
        serializer = UsuarioSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        colab = Usuario.objects.get(id=pk)
        serializer = UsuarioSerializer(colab, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        colab = Usuario.objects.get(id=pk)
        colab.delete()
        return Response('Colaborador Apagado')

class MateriaAPIView(APIView):
    """
    API Materia
    """

    def get(self, request, pk=''):
        if pk == '':
            materia = Materia.objects.all()
            serializer = MateriaSerializer(materia, many=True)
            return Response(serializer.data)
        else:
            materia = Materia.objects.get(id=pk)
            serializer = MateriaSerializer(materia)
            return Response(serializer.data)


    def post(self, request):
        serializer = MateriaSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        materia = Materia.objects.get(id=pk)
        serializer = MateriaSerializer(materia, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        materia = Materia.objects.get(id=pk)
        materia.delete()
        return Response('Materia Apagada')

class AssinaturaAPIView(APIView):
    """
    API Assinatura
    """

    def get(self, request, pk=''):
        if pk == '':
            assinatura = Assinatura.objects.all()
            serializer = AssinaturaSerializer(assinatura, many=True)
            return Response(serializer.data)
        else:
            assinatura = Assinatura.objects.get(fiap=pk)
            serializer = AssinaturaSerializer(assinatura)
            return Response(serializer.data)


    def post(self, request):
        # print(request.data[0]['fiap'])
        serializer = AssinaturaSerializer(data=request.data, many=True)
        fiap = Fiap.objects.all().last()
        request.data[0]['fiap'] = fiap.id
        # print(request.data[0]['fiap'])
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        assinatura = Assinatura.objects.get(fiap=pk)
        serializer = AssinaturaSerializer(assinatura, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        assinatura = Assinatura.objects.get(id=pk)
        assinatura.delete()
        return Response('Assinatura Apagada')

class FiapAPIView(APIView):
    """
    API Fiap
    """

    def get(self, request, pk=''):
        if pk == '':
            fiap = Fiap.objects.all()
            serializer = FiapSerializer(fiap, many=True)
            return Response(serializer.data)
        else:
            fiap = Fiap.objects.get(id=pk)
            serializer = FiapSerializer(fiap)
            return Response(serializer.data)


    def post(self, request):
        serializer = FiapSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        fiap = Fiap.objects.get(id=pk)
        serializer = FiapSerializer(fiap, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        fiap = Fiap.objects.get(id=pk)
        fiap.delete()
        return Response('Fiap Apagada')

class FiapBackendAPIView(APIView):

    def get(self, request):
        s = request.GET.get('s')
        sort = request.GET.get('sort')
        page = int(request.GET.get('page', 1))
        per_page = int(request.GET.get('size', 1))
        fiap = Fiap.objects.all()

        if s:
            fiap = fiap.filter(progresso__icontains=s)

        if sort == 'asc':
            fiap = fiap.order_by('dataInicio')
        elif sort == 'desc':
            fiap = fiap.order_by('-dataInicio')

        total = fiap.count()
        start = (page- 1) * per_page
        end = page * per_page


        serializer = FiapSerializer(fiap[start:end], many=True)
        return Response({
            'data': serializer.data,
            'total': total,
            'page': page,
            'last_page': math.ceil(total / per_page)
        })



class FrequenciaAPIView(APIView):
    """
    API Frequencia
    """

    def get(self, request, pk=''):
        if pk == '':
            frequencia = Frequencia.objects.all()
            serializer = FrequenciaSerializer(frequencia, many=True)
            return Response(serializer.data)
        else:
            frequencia = Frequencia.objects.get(fiap=pk)
            serializer = FrequenciaSerializer(frequencia)
            return Response(serializer.data)


    def post(self, request):
        fiap = Fiap.objects.latest('id')
        request.data[0]['fiap'] = fiap.id
        serializer = FrequenciaSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        frequencia = Frequencia.objects.get(fiap=pk)
        serializer = FrequenciaSerializer(frequencia, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        frequencia = Frequencia.objects.get(id=pk)
        frequencia.delete()
        return Response('Frequencia Apagada')

class AproveitamentoAPIView(APIView):
    """
    API Aproveitamento
    """

    def get(self, request, pk=''):
        if pk == '':
            aproveitamento = Aproveitamento.objects.all()
            serializer = AproveitamentoSerializer(aproveitamento, many=True)
            return Response(serializer.data)
        else:
            aproveitamento = Aproveitamento.objects.get(fiap=pk)
            serializer = AproveitamentoSerializer(aproveitamento)
            return Response(serializer.data)


    def post(self, request):
        fiap = Fiap.objects.latest('id')
        request.data[0]['fiap'] = fiap.id
        serializer = AproveitamentoSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        aproveitamento = Aproveitamento.objects.get(fiap=pk)
        serializer = AproveitamentoSerializer(aproveitamento, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        aproveitamento = Aproveitamento.objects.get(id=pk)
        aproveitamento.delete()
        return Response('Aproveitamento Apagado')

class AprendizagemAPIView(APIView):
    """
    API Aprendizagem
    """

    def get(self, request, pk=''):
        if pk == '':
            aprendi = Aprendizagem.objects.all()
            serializer = AprendizagemSerializer(aprendi, many=True)
            return Response(serializer.data)
        else:
            aprendi = Aprendizagem.objects.get(fiap=pk)
            serializer = AprendizagemSerializer(aprendi)
            return Response(serializer.data)


    def post(self, request):
        fiap = Fiap.objects.latest('id')
        request.data[0]['fiap'] = fiap.id
        serializer = AprendizagemSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        aprendi = Aprendizagem.objects.get(fiap=pk)
        serializer = AprendizagemSerializer(aprendi, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        aprendi = Aprendizagem.objects.get(id=pk)
        aprendi.delete()
        return Response('Aprendizagem Apagada')

class OcorrenciaAPIView(APIView):
    """
    API Ocorrencia
    """

    def get(self, request, pk=''):
        if pk == '':
            ocorrencia = Ocorrencia.objects.all()
            serializer = OcorrenciaSerializer(ocorrencia, many=True)
            return Response(serializer.data)
        else:
            ocorrencia = Ocorrencia.objects.get(fiap=pk)
            serializer = OcorrenciaSerializer(ocorrencia)
            return Response(serializer.data)


    def post(self, request):
        fiap = Fiap.objects.latest('id')
        request.data[0]['fiap'] = fiap.id
        serializer = OcorrenciaSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        ocorrencia = Ocorrencia.objects.get(fiap=pk)
        serializer = OcorrenciaSerializer(ocorrencia, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        ocorrencia = Ocorrencia.objects.get(id=pk)
        ocorrencia.delete()
        return Response('Ocorrencia Apagada')

class ObservacaoAPIView(APIView):
    """
    API Observacao
    """

    def get(self, request, pk=''):
        if pk == '':
            observa = Observacao.objects.all()
            serializer = ObservacaoSerializer(observa, many=True)
            return Response(serializer.data)
        else:
            observa = Observacao.objects.get(fiap=pk)
            serializer = ObservacaoSerializer(observa)
            return Response(serializer.data)


    def post(self, request):
        fiap = Fiap.objects.latest('id')
        request.data[0]['fiap'] = fiap.id
        serializer = ObservacaoSerializer(data=request.data, many=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({"msg": "Inserido com sucesso"})
        #return Response({"id": serializer.data['id']})
        # return Response(serializer.data, status=status.HTTP_201_

    def put(self, request, pk=''):
        observa = Observacao.objects.get(fiap=pk)
        serializer = ObservacaoSerializer(observa, data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response(serializer.data)

    def delete(self, request, pk=''):
        observa = Observacao.objects.get(id=pk)
        observa.delete()
        return Response('Observacao Apagada')

class Avancar_turmasAPIView(APIView):
    def get(self, request):
        turmas = Turma.objects.all()
        turmas_list = []
        numInArray = 0
        novas_turmas = []
        # print('part1')
        # for turma in turmas:
        #     turmas_list.append(turma)
        print(turmas)

        for turma in turmas:
            numInArray = 0
            for carac in str(turma):
                if carac.isdecimal():
                    caracter = carac
                    temp = int(carac) + 1
                    temp_turma = str(turma)
                    tur = temp_turma.replace(temp_turma[numInArray], str(temp))
                    novas_turmas.append(tur)
                    break
                numInArray += 1
            turma_atual = Turma.objects.filter(id=turma.id).first()
            # print(turma_atual)
            turma_atualizada = { 'cod_turma' : novas_turmas[-1] }
            serializer = TurmaSerializer(turma_atual, data=turma_atualizada)
            serializer.is_valid(raise_exception=True)
            # print(serializer)
            # print(serializer.data)
            serializer.save()

        turmas2 = Turma.objects.all()
        serializerTurma = ObservacaoSerializer(turmas2, many=True)
        return Response("Atualizada com Sucesso!!!")

class Anteceder_turmasAPIView(APIView):
    def get(self, request):
        turmas = Turma.objects.all()
        turmas_list = []
        numInArray = 0
        novas_turmas = []
        # print('part1')
        # for turma in turmas:
        #     turmas_list.append(turma)
        print(turmas[0].id)

        for turma in turmas:
            numInArray = 0
            for carac in str(turma):
                if carac.isdecimal():
                    caracter = carac
                    temp = int(caracter) - 1
                    temp_turma = str(turma)
                    tur = temp_turma.replace(temp_turma[numInArray], str(temp))
                    novas_turmas.append(tur)
                    break
                numInArray += 1
            turma_atual = Turma.objects.filter(id=turma.id).first()
            # print(turma_atual)
            turma_atualizada = { 'cod_turma' : novas_turmas[-1] }
            serializer = TurmaSerializer(turma_atual, data=turma_atualizada)
            serializer.is_valid(raise_exception=True)
            # print(serializer)
            # print(serializer.data)
            serializer.save()

        turmas2 = Turma.objects.all()
        serializerTurma = ObservacaoSerializer(turmas2, many=True)
        return Response("Atualizada com Sucesso!!!")
