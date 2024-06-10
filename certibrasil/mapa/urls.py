# urls.py
from django.urls import path
from .views import empresa_create_view, endereco_create_view, iso_create_view, all_addresses_map

urlpatterns = [
    path('',all_addresses_map , name='all-addresses-map'),
    path('empresa/nova/', empresa_create_view, name='empresa_create'),
    path('empresa/<int:empresa_id>/endereco/nova/', endereco_create_view, name='endereco_create'),
    path('empresa/<int:empresa_id>/iso/nova/', iso_create_view, name='iso_create'),
]
