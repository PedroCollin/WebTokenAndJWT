from django.urls import path, include

from rest_framework.routers import DefaultRouter
from . import views

router = DefaultRouter()
router.register("Turma", views.TurmaAPI)
router.register("Aluno", views.AlunoAPI)

urlpatterns = [
    path('', include(router.urls))
]