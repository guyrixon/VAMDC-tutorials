Example of spectroscopic node
=============================

Materials
---------

This example uses some data from Chianti: a few records from each table. The data are provided in ASCII tables. To read them into the database, I include mapping files for the VAMDC publishing software, which is the approved way of loading the database. I also include the Chianti node's Perl script for loading the database. I suggest that you do not show this to the class, but you may use it to check your results when preparing the tutorial [#]_. Both methods should generate the same database.

* :download:`Line data <http:/tbd/>`
* :download:`Species and state data <http:/tbd/>`
* :download:`Mapping file for VAMDC publishing software <http:/tbd/>`
* :download:`Perl script for loading the data <http:/tbd/>`

The Python files are taken from the Chianti node running in the 12.07 system and therefore need that edition of the node software. When you have that tree of software installed on the demonstration machine, you should copy the Python files from this page into the directory *NodeSoftware/nodes/tignanello/node/* [#]_. You then need to edit *NodeSoftware/nodes/tignanello/settings.py* to get a runnable node. I've included on this page a *settings.py* that should work if your RDBMS is MySQL, set up according to the infrastructure checklist elsewhere in this tutorial package.

* :download:`models.py <http:/tbd/>`
* :download:`dictionaries.py <http:/tbd/>`
* :download:`queryfunc.py <http:/tbd/>`
* :download:`settings.py <http:/tbd/>`


Recommended order of demonstration
----------------------------------

This is an outline. Follow the node-software user-guide for the details. You will need to run through this sequence before the tutorial to make sure that you understand all the details and can avoid the traps.

#. Create the *tignanello* database and assign access to the *vamdc* user. Leave the database empty for now.
#. Copy in the *settings.py* file so that Django can see the database.
#. Copy in the *models.py* file and let Django create the (empty) database tables from the models. Show the audience what Django has made. [#]_
#. Show the mapping file of the publishing software to the auduence and explain how what it does.
#. Run the publishing software and show the audience what was loaded.
#. Explain that the node software know knows the structure of the database but not how it maps to VSS2 or XSAMS. [#]_
#. Copy in the *dictionaries.py* file [#]_, explain what it means, and demonstrate that the node now understands queries. [#]_
#. Show the node's capabilities document and explain how this links the node to the registry. [#]_
#. Show how to test the node in the TAP validator.
#. Optionally, show how to enable the node software in a production-quality web-server.

.. rubric:: Footnotes

.. [#] Run this script as *perl ingest-chianti-v7.pl > tignanello.sql* to get an SQL script that loads the data into the currently-selected database in MySQL. You can then run the SQL script from inside the *mysql* command-line client using the command *use tignanello* followed by *source tignanello.sql*.

.. [#] This is a *new* node created for and in this demonstration. The existing node *chianti* in the node-software tree should not be used for the demonstration. It is sufficiently different from the example node that it would cause confusion. Therefore, you should copy *NodeSoftware/ExampleNode* with all its files and sub-directories to *NodeSoftware/tignanello* and then overwrite the Python files noted above.

.. [#] You can show Django's view of things from the Python command-line; the node software documentation has the spells. You can show MySQL's view of the database using the *mysql* command-line tool. 

.. [#] You could emphasise this by running valid queries, all of which will come back with 400 status because the node doesn't understand any restrictables.

.. [#] For a really effective demonstration, if you have time, consider loading first a stripped down copy of *dictionaries.py* and then progressively adding restrictable and returnable while showing the audience how the node's capabilities grow. If the students are installing the example node for themselves, then they should certainly do this exercise. 

.. [#] A suitable query is *select all where AtomSymbol='Ti'*. You could also select a range of wavelength.

.. [#] You could actually register the demonstration node, but please only the *development* registry, not the production registry! If you do this, please mark the registration "deleted" at the end of the demonstration.