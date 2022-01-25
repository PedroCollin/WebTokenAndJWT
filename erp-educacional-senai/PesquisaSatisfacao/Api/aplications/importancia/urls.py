from django.urls import path, include

from rest_framework.routers import DefaultRouter

from .views import ImportanciaViewSet

router = DefaultRouter()
router.register("importancia", ImportanciaViewSet, basename="importancia")

urlpatterns = [
    path("", include(router.urls)),
]