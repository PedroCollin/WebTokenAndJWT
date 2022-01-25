from django.urls import path, include

from rest_framework.routers import DefaultRouter

from .views import EmpresaViewSet

router = DefaultRouter()
router.register("empresa", EmpresaViewSet, basename="empresa")

urlpatterns = [
    path("", include(router.urls)),
]