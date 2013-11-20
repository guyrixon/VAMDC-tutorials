.. _python:

Python Scripting 
========================

.. note::
    Before we start, let it be said that while automatic and repeated requests are a valid application of the tools described below, it might be considered impolite to carry things too far. Queries can take considerable computational resources to run, which should be kept in mind when scripting queries. Not sending parallel queries to the same node or introducing a short delay might be worth considering.

Sending a query to a single node
-----------------------------------

Queries to VAMDC data nodes are standard HTTP requests. Scripting with Python
is a feasible way of automating such queries. Instead of the built-in HTTP Python module, we here use the one called ``requests`` which should be installable on most systems via::

    $ pip install requests

and imported from within Pyhon as::

    import requests

Setting up the URL parameters for a static query in a Python script can be done like this::

    PARAMETERS = { 'FORMAT' : 'XSAMS',
               'LANG'    : 'VSS2',
               'QUERY'    : "SELECT * WHERE ATOMSYMBOL = 'Mg'"

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
Running the GET request goes similar to above::

    response = requests.get('http://node.url/tap/sync', params=PARAMETERS)

Now ``response.text`` is the actual XML payload. (Note that a data node may
chose to return the statistics headers *only* for a HEAD request; they might be
missing in ``response.headers`` this time.)

To simply save the requested data to a file, do::

    open('/path/to/file.xml','w').write(response.text)


Handling the returned data
------------------------------

Once you have a valid ``response``, the way to proceed very much depends on you
goal. One can use an XML library to parse the document, e.g. *lxml*::

    from lxml import etree as E
    tree = E.fromstring(response.text.replace('xmlns=','xmlns:foo='))
    
Here we deactivate the namespace by replacing the declaration in the header, before we let lxml parse the string; this lets us skip using the tags' namespace prefix in the following.

The ``tree`` object is a hierarchical structure of elements and their attributes which can be used to extract or transform data. For example, let's assume you are interested in the wavelengths of radiative transitions, which reside in an element *<Wavelength>*. To extract all these from the tree::

    w_list=tree.findall('.//Wavelength')
    for w in w_list:
        val = w.find('Value')
        print val.text, val.get('units') 

which should yield output like::

    234.11800000 A
    234.11801889 A
    235.18900000 A

Note that we needed some knowledge of the XSAMS schema here, namely that the value for the wavelength is inside a *<Value>* element which has an attribute for the unit.

The full documentation for *lxml* is available at http://lxml.de/ and going further into it is beyond the scope of this document.

There are other ways of treating XML in Python, one more example being *xmltodict* (https://github.com/martinblech/xmltodict), a module that parses the XML into native Python dictionaries.


Send data to a Processor
------------------------------

Instead of treating the XML output yourself, one can let a *Processor Service*
do something to the data first. (See below on how to find the existing
Processors.) Processors are accessed though a POST request that contains *either* a URL which delivers data in XSAMS format, or an uploaded XML-file.

For example::

    from time import sleep
    response = requests.post('http://url/to/processor/service',data={'url':response.url})
    while response.status_code == 202:
        sleep(5)
        response = requests.get(response.url)

What happens here? The Processor answers the POST request with a redirect to a
new URL where the result will be available. This new URL will give a 202
(Accepted) response to indicate that the result is not yet ready. So we wait
for a few seconds and reload the URL with a GET request.

For a file upload, the initial request would instead look like::

    response = requests.post('http://url/to/processor/service',files={'upload':open('/path/to/file.xml')})


The processed output will be in ``response.text`` as before. This can be any kind of data format, depending on the chosen Processor.


Use the registry to find data nodes
-------------------------------------

The registry is where the list of data nodes and processor services can be obtained. For manual access visit http://registry.vamdc.eu/

We provide a small Python module that facilitates access and can serve as an example for custom access. It requires the module *suds* (to be installed, as usual, with *pip* or your systems package manager) and can be obtained from https://raw.github.com/VAMDC/ClientTools/master/python/registry.py

Please make sure this is in the same directory as your script or in your PYTHONAPTH, so that we can do::

    import registry


This module provides two simple function that return a list of names and URLs::

    nodes = registry.getNodeList()
    processors = registry.getProcessorList()

Which can be used, for example, like this to see which query keywords the data nodes support::

    for node in nodes:
        print node['name'],
        cap_url = node['url'] + 'capabilities'
        try:
            resp = requests.get(cap_url, timeout=3)
            cap=lxml.etree.fromstring(resp.text.lower())
            print ' ok'
        except:
            print 'failed'
            continue
        for restr in cap.findall('.//restrictable'):
            print ' ', restr.text


Further examples
---------------------

There is a code repository for client scripts and tools at https://github.com/VAMDC/ClientTools where you can find more examples of Python scripts.
