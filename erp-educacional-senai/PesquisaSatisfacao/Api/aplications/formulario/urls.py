from django.urls import path, include

from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register("Formulario", views.FormularioApi)
router.register("Aluno", views.AlunoApi)
router.register("Pergunta", views.PerguntaApi)
router.register("Satisfacao", views.SatisfacaoApi)
router.register("Importancia", views.ImportanciaApi)
router.register("Envio", views.EnvioApi)

# urls consumidas pelo frontend:
router.register("Forms", views.QtdFormularios) # http://127.0.0.1:8000/api/v1/Forms/
router.register("ImportAlta", views.QtdImportanciaAlta) # http://127.0.0.1:8000/api/v1/ImportAlta/
router.register("ImportMedia", views.QtdImportanciaMedia) # http://127.0.0.1:8000/api/v1/ImportMedia/
router.register("ImportBaixa", views.QtdImportanciaBaixa) # http://127.0.0.1:8000/api/v1/ImportBaixa/
router.register("SatsOtima", views.QtdSatisfacaoOtima) # http://127.0.0.1:8000/api/v1/SatsOtima/
router.register("SatsBoa", views.QtdSatisfacaoBoa) # http://127.0.0.1:8000/api/v1/SatsBoa/
router.register("SatsRegular", views.QtdSatisfacaoRegular) # http://127.0.0.1:8000/api/v1/SatsRegular/
router.register("SatsRuim", views.QtdSatisfacaoRuim) # http://127.0.0.1:8000/api/v1/SatsRuim/
router.register("SatsNA", views.QtdSatisfacaoNA) # http://127.0.0.1:8000/api/v1/SatsNA/

urlpatterns = [
    path('', include(router.urls)),
]