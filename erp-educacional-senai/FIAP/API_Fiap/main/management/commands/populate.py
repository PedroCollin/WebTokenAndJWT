from django.core.management import BaseCommand
from faker import Faker
from main.models import Fiap
from random import randrange
import datetime

class Command(BaseCommand):
    def handle(self, *args, **options):
        faker = Faker()

        for _ in range(20):
            Fiap.objects.create(
                progresso=str(randrange(1,3)),
                aluno = randrange(1,2),
                turma = randrange(1,3),
                materia =randrange(1,3),
                dataInicio = datetime.datetime.now(),
                dataFinal = datetime.datetime.now(),
                usuario = randrange(1,3)
            )