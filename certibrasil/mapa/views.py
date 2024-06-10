# views.py
from django.shortcuts import render, redirect
from .forms import EmpresaForm, EnderecoForm, ISOForm
from .models import Empresa

def empresa_create_view(request):
    if request.method == 'POST':
        empresa_form = EmpresaForm(request.POST)
        if empresa_form.is_valid():
            empresa = empresa_form.save()
            # Redirecionar para uma página de sucesso ou outra ação
            return redirect('success_url')
    else:
        empresa_form = EmpresaForm()
    return render(request, 'empresa_form.html', {'empresa_form': empresa_form})

def endereco_create_view(request, empresa_id):
    empresa = Empresa.objects.get(id=empresa_id)
    if request.method == 'POST':
        endereco_form = EnderecoForm(request.POST)
        if endereco_form.is_valid():
            endereco = endereco_form.save(commit=False)
            endereco.empresa = empresa
            endereco.save()
            return redirect('success_url')
    else:
        endereco_form = EnderecoForm()
    return render(request, 'endereco_form.html', {'endereco_form': endereco_form, 'empresa': empresa})

def iso_create_view(request, empresa_id):
    empresa = Empresa.objects.get(id=empresa_id)
    if request.method == 'POST':
        iso_form = ISOForm(request.POST)
        if iso_form.is_valid():
            iso = iso_form.save(commit=False)
            iso.empresa = empresa
            iso.save()
            return redirect('success_url')
    else:
        iso_form = ISOForm()
    return render(request, 'iso_form.html', {'iso_form': iso_form, 'empresa': empresa})

def home(request):
    return render(request, './index.html')
