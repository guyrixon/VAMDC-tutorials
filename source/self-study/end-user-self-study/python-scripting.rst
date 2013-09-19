.. _python:

Python Scripting 
========================

Sending a query to a single node
-----------------------------------

Queries to VAMDC data nodes are standard HTTP requests. Scripting with Python
is a feasible way of automating such queries. Instead of the built-in HTTP Python module, we here use the one called ``requests`` which should be installable on most systems via::

	$ pip install requests


Setting up the URL parameters for a static query in a Python script can be done like this::

	PARAMETERS = { 'FORMAT' : 'XSAMS',
		       'LANG'	: 'VSS2',
		       'QUERY'	: "SELECT * WHERE ATOMSYMBOL = 'Mg'"

HEAD request
~~~~~~~~~~~~~~~~

It is good practise to run a HTTP HEAD request before retrieving the actual data, in order to check whether the query is feasable in terms of expected output. This can be done via::

	response = requests.head('http://node.url/tap/sync', params=PARAMETERS)

Now ``response`` is a Python object that has several properties of interest

* ``response.status_code`` holds the HTTP error code which should be 200 for a successful query.
* ``response.headers`` contains the HTTP headers among which there will be statistics on the amount of data returned.
* Use ``dir(response)`` for a full list of properties.

To only print the VAMDC headers::

	{k:v for k,v in response.headers.iteritems() if k.lower().startswith('vamdc')}

which would give something like::

	{'vamdc-approx-size': '7.41',
	 'vamdc-count-atoms': '6',
	 'vamdc-count-radiative': '5288',
	 'vamdc-count-species': '6',
	 'vamdc-count-states': '1272'}

meaning that the 5288 radiative transitions over 1272 states in 6 atoms for this query will result in approximately 7.5 MB of (uncompressed) XML output.


GET request
~~~~~~~~~~~~~~~
Running the request goes like::

	response = requests.get('http://node.url/tap/sync', params=PARAMETERS)

``response.text`` is the actual XML payload.

To simply save the requested data to a file, do::

	open('/path/to/file.xml','w').write(response.text)


Handling the returned data
------------------------------

Send data to a Processor
------------------------------

Use the registry to find data nodes
-------------------------------------


Further examples
---------------------

There is a code repository for client scripts and tools at https://github.com/VAMDC/ClientTools where you can find more examples of Python scripts.
