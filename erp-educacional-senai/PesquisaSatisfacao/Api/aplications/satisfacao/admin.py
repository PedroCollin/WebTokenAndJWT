from django.contrib import admin

from .models import Satisfacao

class displaySatisfacao(admin.ModelAdmin):
    list_display = ('id','desc')
    list_filter = ('desc',)
    search_fields = ('desc',)

admin.site.register(Satisfacao, displaySatisfacao)
