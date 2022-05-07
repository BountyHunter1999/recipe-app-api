from django.test import TestCase

from app.calc import add, subtract


class CalcTests(TestCase):

    def test_add_numbers(self):
        """
        Test that two numbers are added together
        """
        self.assertEqual(add(2, 8), 10)

    def test_subtract_numbers(self):
        """
        Test that two numbers are subtracted from each other
        """
        self.assertEqual(subtract(8, 2), 6)
