Frequently-asked questions about building nodes
===============================================

Python or Java?
---------------

Node software is available and supported in both Python and Java; both are valid choices. However, the vast majority of nodes use the Python software and far more people associated with VAMDC know how to use that implementation. The parts of the software that the node builder must write are different in the two systems, so it's not easy to translate a node from one to the other.

Which Python version? or My Python won't run your software
----------------------------------------------------------

You need Python 2.7. The current (12.07 system) node-software won't work at all with Python 2.5 or 3.x. Python 2.5 and 2.6 are a grey area, but I've seen enough problems not to trust the node software with those versions.

How do I install on MacOS?
--------------------------

Installing the VAMDC software works on MacOS in the same way as any other platform. However, the third-party infrastructure needs special help. Apple do not include the necessary components with MacOS, so you must either build them from source or get suitable binaries.

Building from source is tortuous, and the problems and fixes change with each issue of MacOS. The only approach that I have found to work is to install binaries using MacPorts. Note that this will install a separate copy of Python 2.7 from that which came with MacOS.
