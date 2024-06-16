# urls.py
from django.urls import path
from .views import empresa_create_view, endereco_create_view, iso_create_view, all_addresses_map,empresa_detail,empresa_list,empresa_delete,empresa_edit,endereco_delete,endereco_edit,iso_delete,iso_edit,login_view,logout_view

urlpatterns = [

    path('',all_addresses_map , name='all-addresses-map'),
    path('login/', login_view, name='login'),
    path('logout/',logout_view,name ='logout'),
    #path('empresa/nova/', empresa_create_view, name='empresa_create'),
    path('clientes/<int:empresa_id>/endereco/add/', endereco_create_view, name='endereco_create'),
    path('clientes/<int:empresa_id>/iso/add/', iso_create_view, name='iso_create'),
    path('clientes/', empresa_list, name='empresaList'),
    path('clientes/Add/', empresa_create_view,name='empresa_create'),
    path('clientes/Edit/<int:pk>', empresa_edit,name='empresa_edit'),
    path('clientes/Delete/<int:pk>', empresa_delete,name='empresa_delete'),
    path('clientes/View/<int:pk>', empresa_detail,name='empresa_detail'),
    path('endereco/<int:empresa_id>/<int:pk>/edit/', endereco_edit, name='endereco_edit'),
    path('endereco/<int:empresa_id>/<int:pk>/delete/', endereco_delete, name='endereco_delete'),
    path('iso/<int:empresa_id>/<int:pk>/edit/', iso_edit, name='iso_edit'),
    path('iso/<int:empresa_id>/<int:pk>/delete/', iso_delete, name='iso_delete'),
]
