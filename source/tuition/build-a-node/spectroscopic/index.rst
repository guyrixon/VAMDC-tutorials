Example of spectroscopic node
=============================

Materials
---------

This example uses some data from Chianti: a few records from each table. The data are provided in ASCII tables. To read them into the database, I include mapping files for the VAMDC publishing software, which is the approved way of loading the database. 

* :download:`Line data <lines.in>`
* :download:`Species and state data <states.in>`
* :download:`Mapping file for VAMDC publishing software <mapping.py>`

The mapping generates files *states.out* and *lines.out* which supply the tables *states* and *transitions* [#]_ respectively. The third table, *species*, is derived from the *states* table by an SQL command. The SQL script *schema.sql* creates the empty tables [#]_ and *ingest.sql* fills them.

* :download:`Schema-creation script <schema.sql>`
* :download:`Ingestion script <schema.sql>`

The Python files modelling the node are adapted from the Chianti node running in the 12.07 system and therefore need that edition of the node software. When you have that tree of software installed on the demonstration machine, you should copy these Python files from this page into the directory *NodeSoftware/nodes/tignanello/node/* [#]_. 

* :download:`models.py <models.py>`
* :download:`dictionaries.py <dictionaries.py>`
* :download:`queryfunc.py <queryfunc.py>`

You then need to edit *NodeSoftware/nodes/tignanello/settings.py* to get a runnable node. I've included on this page a *settings.py* that should work if your RDBMS is MySQL, set up according to the infrastructure checklist elsewhere in this tutorial package.

* :download:`settings.py <settings.py>`


Recommended order of demonstration
----------------------------------

This is an outline. Follow the node-software user-guide for the details. You will need to run through this sequence before the tutorial to make sure that you understand all the details and can avoid the traps.

#. Create the *tignanello* database and assign access to the *vamdc* user. Leave the database empty for now.
#. Copy in the *settings.py* file so that Django can see the database.
#. Copy in the *models.py* file and let Django create the (empty) database tables from the models. Show the audience what Django has made. [#]_
#. Show the mapping file of the publishing software to the audience and explain how what it does.
#. Run the publishing software, load the database and show the audience what was loaded.
#. Explain that the node software now knows the structure of the database but not how it maps to VSS2 or XSAMS. [#]_
#. Copy in the *dictionaries.py* file [#]_, explain what it means, and demonstrate that the node now understands queries. [#]_
#. Show the node's capabilities document and explain how this links the node to the registry. [#]_
#. Show how to test the node in the TAP validator.
#. Optionally, show how to enable the node software in a production-quality web-server.

.. rubric:: Footnotes

.. [#] Naming this table "lines" interacts badly with the SQL command-line, therefore it is called "transitions".

.. [#] It should be possible to ignore *schema.sql* and to let Django create the empty database from the Python model. The second script, *ingest.sql*, should be able to write to tables generated in that way.

.. [#] This is a *new* node created for this demonstration. The existing node *chianti* in the node-software tree should not be used for the demonstration. It is sufficiently different from the example node that it would cause confusion. The files for the *tignanello* node should be present in the node-software tree when it is checked out from GitHub.

.. [#] You can show Django's view of things from the Python command-line; the node software documentation has the spells. You can show MySQL's view of the database using the *mysql* command-line tool. 

.. [#] You could emphasise this by running valid queries, all of which will come back with 400 status because the node doesn't understand any restrictables.

.. [#] For a really effective demonstration, if you have time, consider loading first a stripped down copy of *dictionaries.py* and then progressively adding restrictable and returnable while showing the audience how the node's capabilities grow. If the students are installing the example node for themselves, then they should certainly do this exercise. 

.. [#] A suitable query is *select all where AtomSymbol='O'*. You could also select a range of wavelength.

.. [#] You could actually register the demonstration node, but please only the *development* registry, not the production registry! If you do this, please mark the registration "deleted" at the end of the demonstration.