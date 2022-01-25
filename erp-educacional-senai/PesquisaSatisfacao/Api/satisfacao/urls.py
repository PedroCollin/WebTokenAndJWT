
from django.contrib import admin
from django.urls import path, include
from aplications.formulario import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('passTurma/<str:xturma>', views.getTurma, name='getTurma'),
    path('api/v1/', include('djoser.urls')),
    path('api/v1/', include('djoser.urls.authtoken')),
    path('api/v1/', include('aplications.pergunta.urls')),
    path('api/v1/', include('aplications.formulario.urls')),
    path('api/v1/', include('aplications.aluno.urls')),
    path('api/v1/', include('aplications.colaborador.urls')),
    path('api/v1/', include('aplications.empresa.urls')),
    path('api/v1/', include('aplications.importancia.urls')),
    path('api/v1/', include('aplications.satisfacao.urls')),
    path('api/v1/', include('aplications.turma.urls')),
    ]