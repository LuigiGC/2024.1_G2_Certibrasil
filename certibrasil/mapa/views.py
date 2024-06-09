from .models import Cliente,Endereco,Certificacao
from django.shortcuts import render, get_object_or_404, redirect

def login(request):
    return render(request, '.\login.html')

def home(request):
    return render(request, './index.html')

def cadastro(request):
    return render(request, './cadastro.html')