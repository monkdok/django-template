from django.contrib.auth import get_user_model
from factory.django import DjangoModelFactory


class ProfileFactory(DjangoModelFactory):
    """Factory for creating User instances"""

    username = 'test_user'
    password = 'password'

    class Meta:
        model = get_user_model()
