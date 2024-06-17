# views.py
from django.shortcuts import render, redirect,get_object_or_404
from .forms import EmpresaForm, EnderecoForm, ISOForm, UserForm
from .models import Empresa,ISO,Endereco
import json
import folium
from geopy.geocoders import Nominatim
from django.contrib.auth import authenticate, login,logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('all-addresses-map')
        else:
            messages.error(request, 'Usuário ou senha inválidos')
    return render(request, 'login.html')
@login_required
def logout_view(request):
    logout(request)
    return redirect('login')
@login_required
def empresa_create_view(request):
    if request.method == 'POST':
        empresa_form = EmpresaForm(request.POST)
        if empresa_form.is_valid():
            empresa = empresa_form.save()
            return redirect('empresaList')
    else:
        empresa_form = EmpresaForm()
    return render(request, 'empresa_form.html', {'empresa_form': empresa_form})
@login_required
def endereco_create_view(request, empresa_id):
    empresa = Empresa.objects.get(id=empresa_id)
    if request.method == 'POST':
        endereco_form = EnderecoForm(request.POST)
        if endereco_form.is_valid():
            endereco = endereco_form.save(commit=False)
            endereco.empresa = empresa
            endereco.save()
            return redirect('empresa_detail', pk=empresa_id)
    else:
        endereco_form = EnderecoForm()
    return render(request, 'endereco_form.html', {'endereco_form': endereco_form, 'empresa': empresa})
@login_required
def iso_create_view(request, empresa_id):
    empresa = Empresa.objects.get(id=empresa_id)
    if request.method == 'POST':
        iso_form = ISOForm(request.POST)
        if iso_form.is_valid():
            iso = iso_form.save(commit=False)
            iso.empresa = empresa
            iso.save()
            return redirect('empresa_detail', pk=empresa_id)
    else:
        iso_form = ISOForm()
    return render(request, 'iso_form.html', {'iso_form': iso_form, 'empresa': empresa})

@login_required
def all_addresses_map(request):
    state = request.GET.get('uf')
    city = request.GET.get('cidade')
    neighborhood = request.GET.get('bairro')

    addresses = Endereco.objects.all()
    states = Endereco.objects.values_list('uf', flat=True).distinct()
    cities = Endereco.objects.filter(uf=state).values_list('cidade', flat=True).distinct() if state else []
    neighborhoods = Endereco.objects.filter(uf=state, cidade=city).values_list('bairro', flat=True).distinct() if state and city else []

    if state:
        addresses = addresses.filter(uf=state)
    if city:
        addresses = addresses.filter(cidade=city)
    if neighborhood:
        addresses = addresses.filter(bairro=neighborhood)

    # Calcular o centro do mapa baseado nos endereços filtrados
    center_lat, center_lon = -14.2350, -51.9253  # Centro padrão: Brasil
    if addresses.exists():
        latitudes = [addr.latitude for addr in addresses if addr.latitude]
        longitudes = [addr.longitude for addr in addresses if addr.longitude]

        if latitudes and longitudes:
            center_lat = sum(map(float, latitudes)) / len(latitudes)
            center_lon = sum(map(float, longitudes)) / len(longitudes)
        else:
            geolocator = Nominatim(user_agent="core")
            location_str = state or city or neighborhood or None
            if location_str:
                location = geolocator.geocode(location_str)
                if location:
                    center_lat = location.latitude
                    center_lon = location.longitude

    m = folium.Map(location=[center_lat, center_lon], zoom_start=8)

    for endereco in addresses:
        lat, lon = endereco.latitude, endereco.longitude
        if lat is None or lon is None:
            location_str = None
            if endereco.cep:
                location_str = endereco.cep
            elif endereco.logradouro:
                location_str = endereco.logradouro
            elif endereco.bairro:
                location_str = endereco.bairro
            elif endereco.cidade:
                location_str = endereco.cidade
            elif endereco.uf:
                location_str = endereco.uf

            if location_str:
                location = geolocator.geocode(location_str)
                if location:
                    lat, lon = location.latitude, location.longitude

        if lat is not None and lon is not None:
            empresa = endereco.empresa
            iso_types = ', '.join([iso.iso_type for iso in empresa.certificacoes.all()])
            popup_text = f"{empresa.nome_empresa}<br>ISOs: {iso_types}" #não operacional feito:Luigi
            folium.Marker(
                [lat, lon],
                popup=popup_text,
                tooltip=endereco.bairro
            ).add_to(m)

    map_html = m._repr_html_()

    return render(request, './index.html', {
        'map_html': map_html,
        'uf': state,
        'cidade': city,
        'bairro': neighborhood,
        'ufs': states,
        'cidades': list(cities),
        'bairros': list(neighborhoods),
    })
@login_required
def empresa_detail(request, pk):
    empresa = get_object_or_404(Empresa, pk=pk)
    return render(request, './customer_detail_with_details.html', {'empresa': empresa})
@login_required
def empresa_list(request):
    empresas = Empresa.objects.all()
    return render(request, './customer_list.html', {'empresas': empresas})
@login_required
def empresa_edit(request, pk):
    empresa = get_object_or_404(Empresa, pk=pk)
    if request.method == 'POST':
        form = EmpresaForm(request.POST, instance=empresa)
        if form.is_valid():
            form.save()
            return redirect('empresaList')
    else:
        form = EmpresaForm(instance=empresa)
    return render(request, 'empresa_edit.html', {'form': form})
@login_required
def empresa_delete(request, pk):
    empresa = get_object_or_404(Empresa,pk=pk)
    if request.method == 'POST':
        empresa.delete()
        return redirect('empresaList')
    return render(request, 'empresa_confirm_delete.html', {'empresa': empresa})
@login_required
def endereco_edit(request, empresa_id, pk):
    endereco = get_object_or_404(Endereco, pk=pk, empresa_id=empresa_id)
    if request.method == 'POST':
        form = EnderecoForm(request.POST, instance=endereco)
        if form.is_valid():
            form.save()
            return redirect('empresa_detail', pk=empresa_id)
    else:
        form = EnderecoForm(instance=endereco)
    return render(request, 'endereco_edit.html', {'form': form})
@login_required
def endereco_delete(request,empresa_id, pk):
    endereco = get_object_or_404(Endereco, pk=pk, empresa_id=empresa_id)
    empresa_pk = endereco.empresa.pk
    if request.method == 'POST':
        endereco.delete()
        return redirect('empresa_detail',pk=empresa_id)
    return render(request, 'endereco_confirm_delete.html', {'endereco': endereco})
@login_required
def iso_edit(request, empresa_id, pk):
    iso = get_object_or_404(ISO, pk=pk, empresa_id=empresa_id)
    if request.method == 'POST':
        form = ISOForm(request.POST, instance=iso)
        if form.is_valid():
            form.save()
            return redirect('empresa_detail', pk=empresa_id)
    else:
        form = ISOForm(instance=iso)
    return render(request, 'iso_edit.html', {'form': form})
@login_required
def iso_delete(request,empresa_id, pk):
    iso = get_object_or_404(ISO,pk=pk, empresa_id=empresa_id)
    empresa_pk = iso.empresa.pk
    if request.method == 'POST':
        iso.delete()
        return redirect('empresa_detail',pk=empresa_id)
    return render(request, 'iso_confirm_delete.html', {'iso': iso})
