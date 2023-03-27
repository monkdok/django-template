from django.contrib import admin
from django.contrib.admin import ModelAdmin

from .models import Profile


@admin.register(Profile)
class ProfileAdmin(ModelAdmin):
    """Register Profile model"""
