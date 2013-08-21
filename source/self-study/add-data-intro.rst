.. _add-data-intro:

Adding your data to VAMDC: an outline
=====================================

To add your data to VAMDC you must enter them into a VAMDC node. Each node contains a database and a web service that makes the data available remotely, over the WWW. Nodes provide data in a consistent format, using the XSAMS data-model. You can either make a new node for your data or make arrangements to add your data to an existing node.

Building a new node gives your data more visibility in VAMDC, but you will need some technical skills in computing, as described below. Contributing data to an existing node involves little technical work, but the identity of your data-set is subsumed in the wider data collection of the node. However, the attribution of individual records of the collection is preserved in the database and in XSAMS.

Inside a node, the data are stored in a relational database. The web-service part of the node turns VAMDC searches into queries on the database and writes out the results of the queries in XSAMS. Nodes are not built around collections of static files because it is hard to search such files. Much of the web-service software is common to all nodes, and is provided by VAMDC, but each node has a few, small, local modules that adapt the common software to the node's database.

Therefore, your task in setting up a new node is to load your data into a relational database and to write the software customisations that allow your database to be represented in XSAMS. You do not need to translate the data into XSAMS manually. Some programming will be involved, in either Python or Java (most nodes are written in Python).

If you already have your data in a relational database you can use that and write the web-service customisations to suit. If you have your data in ASCII files, then you will have to design the table structure of the database and write a short program to transcribe your files. You may be able to reuse the design from an existing node, in which case you can copy that node's software. If you are contributing data into an existing node then you will need to work out how your data fit into that database; the node will not accommodate an extra, different database for your data.

Having prepared a database and node software, you next need to host them on a server computer that is connected to the internet. If you do not wish to run such a server, you can have you node hosted at an existing site on VAMDC. In this case, you still have a distinct and new node that you control but somebody else looks after the day-to-day running.

Finally, to make your node available, you register it in the VAMDC registry. This registry is a list of nodes, stating where to find each nodes web service and outlining the kind of data provided by the node.

For each of the technical processes, help is available from VAMDC in the form of guides, tutorials, examples of working nodes and advice from VAMDC staff. If you can tell us how your data fit into the XSAMS data model we can make the rest of the process easy.