from django.test import TestCase

from app.apps.profiles.tests.factories import ProfileFactory


class TestProfile(TestCase):
    """Test suite for the Profile model"""

    def setUp(self) -> None:
        self.profile = ProfileFactory()

    def test_create_profile(self):
        """Test creating a new profile"""
        assert self.profile  # the profile should exist

    def test_profile_str(self):
        """Test the __str__ method of the profile"""
        assert str(self.profile) == self.profile.username
