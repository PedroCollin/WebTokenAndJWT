from django.urls import path, include

from rest_framework.routers import DefaultRouter

from .views import SatisfacaoViewSet

router = DefaultRouter()
router.register("satisfacao", SatisfacaoViewSet, basename="satisfacao")

urlpatterns = [
    path("", include(router.urls)),
]