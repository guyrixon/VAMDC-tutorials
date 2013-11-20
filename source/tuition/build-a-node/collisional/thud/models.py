"""
This module defines the database schema of the node.

Each model class defines a table in the database. The fields define the columns of this table.

"""

# library import
from django.db.models import *

class Species(Model):
    id = PositiveSmallIntegerField(primary_key=True, db_index=True)
    name = CharField(max_length=10, db_index=True)
    mass = DecimalField(max_digits=8, decimal_places=5)
    nuclear_charge = IntegerField()
    inchi = CharField(max_length=256)
    molecule= BooleanField()
    chemical_formula = CharField(max_length=128)
    cas = CharField(max_length=128)
    inchikey = CharField(max_length=20)
    isotope = BooleanField()

    class Meta:
        db_table = u'species'


class Collision(Model):
    id = IntegerField(primary_key=True)
    reactant = ForeignKey(Species, related_name='reactant')
    product = ForeignKey(Species, related_name='product')

    class Meta:
        db_table = u'collisions'

class DataSet(Model):
    id = IntegerField(primary_key=True)
    collision = ForeignKey(Collision)

    class Meta:
        db_table = u'datasets'

class TabData(Model):
    id = IntegerField(primary_key=True)
    dataset = ForeignKey(DataSet)
    x = TextField()
    xunit = CharField(max_length=8)
    xdesc = CharField(max_length=32)
    y = TextField()
    yunit = CharField(max_length=8)
    ydesc = CharField(max_length=32)
    count = IntegerField()

    class Meta:
        db_table = u'tabdata'

