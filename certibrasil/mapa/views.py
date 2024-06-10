# views.py
from django.shortcuts import render, redirect
from .forms import EmpresaForm, EnderecoForm, ISOForm
from .models import Empresa,ISO,Endereco
import json
import folium 

from geopy.geocoders import Nominatim

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


def all_addresses_map(request):
    state = request.GET.get('uf')
    city = request.GET.get('cidade')
    neighborhood = request.GET.get('bairro')

    addresses = Endereco.objects.all()
    print(addresses)
    states = Endereco.objects.values_list('uf', flat=True).distinct()
    cities = Endereco.objects.values_list('cidade', 'uf').distinct()
    neighborhoods = Endereco.objects.values_list('bairro', 'uf', 'cidade').distinct()


    if state:
        addresses = addresses.filter(uf=state)
        cities = Endereco.objects.filter(uf=state).values_list('cidade', 'uf').distinct()
    if city:
        addresses = addresses.filter(cidade=city)
        neighborhoods = Endereco.objects.filter(uf=state, cidade=city).values_list('bairro', 'uf', 'cidade').distinct()
    if neighborhood:
        addresses = addresses.filter(bairro=neighborhood)

    # Calculate the center of the map based on filtered addresses
    center_lat, center_lon = -14.2350, -51.9253  # Default center: Brazil
    if addresses.exists():
        latitudes = [addr.latitude for addr in addresses if addr.latitude]
        longitudes = [addr.longitude for addr in addresses if addr.longitude]

        if latitudes and longitudes:
            center_lat = sum(map(float, latitudes)) / len(latitudes)
            center_lon = sum(map(float, longitudes)) / len(longitudes)
        else:
            # If no latitude/longitude, use geolocation based on other Endereco fields
            geolocator = Nominatim(user_agent="core")
            location_str = state or city or neighborhood or None
            if location_str:
                location = geolocator.geocode(location_str)
                if location:
                    center_lat = location.latitude
                    center_lon = location.longitude

    m = folium.Map(location=[center_lat, center_lon], zoom_start=12)

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
            folium.Marker(
                [lat, lon],
                popup=f"{endereco.uf}, {endereco.cidade}",
                tooltip=endereco.bairro
            ).add_to(m)

    map_html = m._repr_html_()

    return render(request, './index.html', {
        'map_html': map_html,
        'uf': state,
        'cidade': city,
        'bairro': neighborhood,
        'ufs': states,
        'cidades': json.dumps(list(cities)),
        'bairros': json.dumps(list(neighborhoods)),
    })
