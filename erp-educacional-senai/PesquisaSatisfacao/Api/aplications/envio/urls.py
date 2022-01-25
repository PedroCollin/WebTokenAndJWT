from django.urls import path, include

from rest_framework.routers import DefaultRouter

from .views import EnvioViewSet

router = DefaultRouter()
router.register("envio", EnvioViewSet, basename="envio")

urlpatterns = [
    path("", include(router.urls)),
]