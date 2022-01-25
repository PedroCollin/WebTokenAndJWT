from django.urls import path, include

from rest_framework.routers import DefaultRouter

from .views import PerguntasViewSet

router = DefaultRouter()
router.register("perguntas", PerguntasViewSet, basename="perguntas")

urlpatterns = [
    path("", include(router.urls)),
]