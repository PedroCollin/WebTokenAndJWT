from django.contrib import admin

from .models import Perguntas

class displayPerguntas(admin.ModelAdmin):
    list_display = ['id', 'pergunta']
    list_display_links = ['id', 'pergunta']
    list_filter = ['pergunta']
    search_fields = ['pergunta']

admin.site.register(Perguntas, displayPerguntas)
