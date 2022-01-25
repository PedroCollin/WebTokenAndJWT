from django.contrib import admin
from .models import Aluno

# Register your models here.
class AlunoAdmin(admin.ModelAdmin):
    list_display = ('id', 'nome', 'ra')

admin.site.register(Aluno, AlunoAdmin)