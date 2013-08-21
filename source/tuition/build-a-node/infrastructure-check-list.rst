Infrastructure check-list for Python node-software
==================================================

Before running the node software provided by VAMDC, you need to have installed some third-party components. To date, no known operating system has all of these installed as required. Getting these components to install cleanly can take much time (days, in the worst cases), so should be done well in advance of the tutorial.

* **Python**. Must be v2.7; no other versions will work completely.
* **MySQL server**. The system works with other RDBMS, but presenters should alway use the recommended one. MariaDB is an acceptable fork of MySQL.
* **Python client for MySQL**.
* **PyParsing** library (for SQL parsing).
* **Django**, at a compatible version (node-software documentation says to use v1.3, I've used 1.4 successfully; but the user-written parts of the node may have to change slightly between Django versions).
* A **web server** (choice of Apache httpd or Gunicorn). Most of the tutorial work should be done using Django's build-in HTTP-server. You only need the grown-up server to demonstrate the last stages of installation, and the tutorial may not get that far. If you use Apache httpd, then you also need **mod_wsgi**.
* A **git client**, but only if you intend to teach the class how to share their node software through GitHub. If you do cover this, then you also need a (free) **GitHub account** for the presenter.
* **Perl** 5.x, but only if you want to run the alternative database-loading script provided with the spectroscopic example. If you use the loading method based on VAMDC publishing software then you need only Python. 

If you are building on a Debian-flavoured Linux you should be able to get all these parts from the package repository of your Linux distro. Other distros may not be so helpful [#]_. On MacOS, the least-painful approach seems to be to use MacPorts [#]_. Solaris: no chance. And don't even think about doing it on Windows.

I cannot stress too strongly how much time this software stack can waste *until* you have it correctly installed. After that, it's fine and stable, and needs little attention. So you desperately need to run through all the steps of your tutorial ahead of time, proving that your third-party components can sustain it.

The installation of the infrastructure is part of the node-building process, but it varies so much from platform to platform that it's probably not worth doing it in front of the class (even if you are sure that it will work quickly and first time).


Having installed the software you need to set up the databases and access to the same for VAMDC software.

* Make sure that you have a password-protected account *root* in the MySQL RDBMS [#]_.

* Create, in the RDBMS, an account called *vamdc* with password *testing* [#]_.

* Create a database called *tignanello* for the spectroscopic example [#]_.

* Create a database called *thud* for the collisional example [#]_.

* Grant all (i.e. read and write) access on both databases to the account *vamdc@localhost*. The *@localhost* restricts access such that the node software must be on the computer running the RDBMS, which is almost certainly how you will run the tutorial.

Note that these steps are part of the installation of the node and, when demonstrating, you should do them in view of the class. I.e., having done them privately for familiarisation, do them again for teaching. All the RDBMS commands are idempotent, so you don't need to undo you first set-up.

For more detail in each of these processes, please see the node-software manual.




.. rubric:: Footnotes

.. [#] For example, on RHEL, I had to install a separate copy of Python 2.7 because the system Python was the wrong version.

.. [#] Building from source on MacOS leads inexorably to failure, hatred and possible seppuku.

.. [#] This is completely separate from the *root* account that controls the operating system of the computer.

.. [#] You could use any name and password, but the *setting.py* files in the example nodes include these values. For a real node, of course, you wouldn't use a password written on a web site.

.. [#] Because it's like Chianti but not quite the same.

.. [#] Because it's a debased, comic-opera version of an elegant set of collisional data.