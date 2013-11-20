Example of collisional node
===========================

Materials
---------

This example uses some data from IDEDB, contributed by Johannes Postler. One collision is included. This example demonstrates a node constructed on an existing database [#]_. The data are provided as an SQL dump for MySQL [#]_.

* :download:`Collision data <thud/thud.sql>`


The Python files were derived from the empty example-node in the node-software by Guy Rixon during the Innsbruck tutorial of early 2013 [#]_.
They "wire up" just enough of the data to get the single collision to come out in XSAMS. This node is not complete and the software is not derived from the operational IDEADB node. The files suit the 12.07 version of the node software, which you need to download separately.  When you have that tree of software installed on the demonstration machine, you should copy the first three Python files from this page into the directory *NodeSoftware/nodes/thud/node/* [#]_. You then need to edit *NodeSoftware/nodes/thud/settings.py* to get a runnable node. I've included on this page a *settings.py* that should work if your RDBMS is MySQL, set up according to the infrastructure checklist elsewhere in this tutorial package.

* :download:`models.py <thud/models.py>`
* :download:`dictionaries.py <thud/dictionaries.py>`
* :download:`queryfunc.py <thud/queryfunc.py>`


Recommended order of demonstration
----------------------------------

This is an outline. Follow the node-software user-guide for the details. You will need to run through this sequence before the tutorial to make sure that you understand all the details and can avoid the traps.

#. Copy in the *settings.py* file so that Django can see the database.
#. Show how Django can create a *models.py* file by inspection of the database. [#]_
#. Explain that one would now fine-tune *models.py* manually, with a text editor. Copy in the supplied *models.py*, replacing Django's version.
#. Explain that the node software know knows the structure of the database but not how it maps to VSS2 or XSAMS. [#]_
#. Copy in the *dictionaries.py* file [#]_, explain what it means, and demonstrate that the node now understands queries. [#]_
#. Show the node's capabilities document and explain how this links the node to the registry. [#]_
#. Show how to test the node in the TAP validator.
#. Optionally, show how to enable the node software in a production-quality web-server.

.. rubric:: Footnotes

.. [#] Therefore it would be appropriate to load the database before the tutorial, so that the audience are not distracted by this step. Of course, if the students build the node for themselves then they too will have to load the database and it should be made clear to them that this step is not required for a genuine, pre-existing database.

.. [#] If you were not using MySQL, this dump file might not load cleanly. Assuming that you *are* using the right RDBMS, you load it using the *mysql* command-line tool that comes with the RDBMS. From inside the tool give the command *use thud* to select the database and then *source thud.sql* to load the data from the the file in the current directory.

.. [#] Literally during the tutorial. I foolishly tried to write the Python in front of the audience, on the projector. It was a near-death experience, and I had to abort that session of the tutorial. I subsequently spent most of the night debugging the Python so that we could finish the tutorial next morning. Making nodes from scratch in real time is *not* fun, hence these prepared examples. However, it's worth noting that one *can* work it out, without detailed guidance, in about four hours, starting from a rather hazy understanding of how the node software deals with collisional data.

.. [#] This is a *new* node created for and in this demonstration. The existing node *IDEADB* in the node-software tree should not be used for the demonstration. It is sufficiently different from the example node that it would cause confusion. Therefore, you should copy *NodeSoftware/ExampleNode* with all its files and sub-directories to *NodeSoftware/thud* and then overwrite the Python files noted above.

.. [#] I would not try to actually use Django's attempt at *models.py* as it stands: it is probably not quite complete enough to run the node.

.. [#] You could emphasise this by running valid queries, all of which will come back with 400 status because the node doesn't understand any restrictables.

.. [#] For a really effective demonstration, if you have time, consider loading first a stripped down copy of *dictionaries.py* and then progressively adding restrictable and returnable while showing the audience how the node's capabilities grow. If the students are installing the example node for themselves, then they should certainly do this exercise. 

.. [#] A suitable query is TBD.

.. [#] You could actually register the demonstration node, but please only the *development* registry, not the production registry! If you do this, please mark the registration "deleted" at the end of the demonstration.