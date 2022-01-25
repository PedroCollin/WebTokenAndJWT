from django.contrib import admin
from .models import *

class detAluno(admin.ModelAdmin):
    list_display = ('id','nome','ra','cpf', 'turma')
    list_display_links = ('id',)
    search_fields = ('nome',)
    list_per_page = 10

class detColaborador(admin.ModelAdmin):
    list_display = ('id','nome','identificador','senha','nivelAcesso')
    list_display_links = ('id',)
    search_fields = ('nome',)
    list_per_page = 10

class detTurma(admin.ModelAdmin):
    list_display = ('id','nome','periodo', 'dataInicio')
    list_display_links = ('id',)
    search_fields = ('nome',)
    list_per_page = 10

class detMateria(admin.ModelAdmin):
    list_display = ('id','nome')
    list_display_links = ('id',)
    search_fields = ('nome',)
    list_per_page = 10

class detAssinatura(admin.ModelAdmin):
    list_display = ('id','docente','coordenador','social','aluno','responsavel', 'fiap')
    list_display_links = ('id',)
    search_fields = ('nome',)
    list_per_page = 10

class detFiap(admin.ModelAdmin):
    list_display = ('id','progresso','aluno','turma','materia','dataInicio','dataFinal','usuario')
    list_display_links = ('id',)
    search_fields = ('aluno',)
    list_per_page = 10

class detFrequencia(admin.ModelAdmin):
    list_display = ('id','aulasprevistas','ausencias','fiap')
    list_display_links = ('id',)
    search_fields = ('fiap',)
    list_per_page = 10

class detAproveitamento(admin.ModelAdmin):
    list_display = ('id','materia','notamedia','notaaluno','notarec','fiap')
    list_display_links = ('id',)
    search_fields = ('fiap',)
    list_per_page = 10

class detAprendizagem(admin.ModelAdmin):
    list_display = ('id','atencao','compreensao','comprometimento','relacionamento','Outros','fiap')
    list_display_links = ('id',)
    search_fields = ('fiap',)
    list_per_page = 10

class detOcorrencia(admin.ModelAdmin):
    list_display = ('id','advverbal','advescrita','afastamento','cancelmatricula','fiap')
    list_display_links = ('id',)
    search_fields = ('fiap',)
    list_per_page = 10

class detObservacao(admin.ModelAdmin):
    list_display = ('id','observacao','fiap','data')
    list_display_links = ('id',)
    search_fields = ('fiap',)
    list_per_page = 10

class detEmpresa(admin.ModelAdmin):
    list_display = ('id','nome')
    list_display_links = ('id',)
    list_per_page = 10

class detImportancia(admin.ModelAdmin):
    list_display = ('id','nivel')
    list_display_links = ('id',)
    list_per_page = 10

class detSatisfacao(admin.ModelAdmin):
    list_display = ('id','nivel')
    list_display_links = ('id',)
    list_per_page = 10

class detPergunta(admin.ModelAdmin):
    list_display = ('id','descricao')
    list_display_links = ('id',)
    list_per_page = 10

class detFormulario(admin.ModelAdmin):
    list_display = ('id','aluno','pergunta','importancia','satisfacao','feedback')
    list_display_links = ('id',)
    list_per_page = 10


admin.site.register(Turma, detTurma)
admin.site.register(Aluno,detAluno)
admin.site.register(Usuario,detColaborador)
admin.site.register(Materia,detMateria)
admin.site.register(Assinatura,detAssinatura)
admin.site.register(Fiap,detFiap)
admin.site.register(Frequencia,detFrequencia)
admin.site.register(Aproveitamento,detAproveitamento)
admin.site.register(Aprendizagem,detAprendizagem)
admin.site.register(Ocorrencia,detOcorrencia)
admin.site.register(Observacao,detObservacao)

admin.site.register(Empresa,detEmpresa)
admin.site.register(Importancia,detImportancia)
admin.site.register(Satisfacao,detSatisfacao)
admin.site.register(Pergunta,detPergunta)
admin.site.register(Formulario,detFormulario)
admin.site.register(uploadCsv)


