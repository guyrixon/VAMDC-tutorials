# -*- coding: utf-8 -*-
"""
ExampleNode dictionary definitions.
"""

# The returnable dictionary is used internally by the node and defines
# all the ways the VAMDC standard keywords (left-hand side) maps to
# the internal database representation queryset (right-hand side)
#
# When writing this, it helps to remember that dictionary is applied
# in a loop to every matching *instance* of the queryset variables
# returned from queryfunc.py. So in the example below, all 'AtomStates'
# will be looped over by the node software, using the name 'AtomState'
# (singular). 'AtomState' will be one single instance of a matching
# database object, from which we extract everything we need by parsing
# the VAMDC_standard LHS of this dictionary to how it maps to our specific
# database on the RHS. So, when looping through all AtomState objects
# matching the given query, the generator will for example know that
# to get the AtomStateEnergy VAMDC value, it will need to look at
# the AtomState.energy, i.e. the "energy" property of the current
# database object being worked on.
#
# (if you look at queryfuncs.py, you'll see 'AtomStates' being
#  assigned)

RETURNABLES = {\
'NodeID':'ExampleNode', # required
############################################################
'MethodID':'Method.id',
'MethodCategory':'Method.category',
############################################################

'MoleculeInchi' : 'Molecule.inchi',
'MoleculeChemicalName' : 'Molecule.name',

'CollisionID' : 'CollTran.id',
'CollisionReactantSpecies' : 'Reactant.id',
'CollisionProductSpecies'  : 'Product.id',

'CollisionDataSetDescription' : u'Energy scan',

'CollisionTabulatedDataXDataList'    : 'TabData.x',
'CollisionTabulatedDataXDataListN'   : 'TabData.count',
'CollisionTabulatedDataXUnits'       : 'TabData.xunit',
'CollisionTabulatedDataXDescription' : 'TabData.xdesc',
'CollisionTabulatedDataYDataList'    : 'TabData.y',
'CollisionTabulatedDataYDataListN'   : 'TabData.count',
'CollisionTabulatedDataYUnits'       : 'TabData.yunit',
'CollisionTabulatedDataYDescription' : 'TabData.ydesc'
}

# The restrictable dictionary defines limitations to the search.
# The left-hand side is standardized, the righ-hand size should
# be defined in Django query-language style, where e.g. a search
# for the Species.atomic field  would be written as species__atomic.

RESTRICTABLES = {\
'MoleculeChemicalName' : 'reactant__name'
}

