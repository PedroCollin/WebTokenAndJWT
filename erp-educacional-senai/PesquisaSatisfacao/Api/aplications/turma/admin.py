from django.contrib import admin
from .models import Turma

# Register your models here.
class detTurma(admin.ModelAdmin):
    list_display = ['id', 'nome']
    list_display_links = ['nome']
    list_filter = ['nome']
    search_fields = ['nome']

admin.site.register(Turma, detTurma)