============
Installation
============

Currently, `pwrcalc` has not been released on CRAN, so you must rely upon either an external package for installing `pwrcalc` or you can install the package manually.

----
ghit
----

`ghit` is a user-written package to install packages from GitHub, which is were `pwrcalc` lives. Run the following two-lines of code and you should be up and running with `pwrcalc`.

.. code-block:: r

	install.packages('ghit')
	ghit::install_github('vikjam/pwrcalc')


--------
devtools
--------

Alternatively, `devtools` is another user-written package that allows you to install packages from GitHub. `devtools` mainly helps users create R packages, so you'll get a lot of other tools that come along with `devtools`.

.. code-block:: r

	install.packages('devtools')
	devtools::install_github('vikjam/pwrcalc')


-------------------
Manual installation
-------------------

Finally, if neither of the previous installations options work for you. You can download the latest release_ from GitHub. Download the file with the extensions `.tar.gz`. And then use these instructions_ to install the downloaded file.

.. _release: https://github.com/vikjam/pwrcalc/releases
.. _instructions: http://outmodedbonsai.sourceforge.net/InstallingLocalRPackages.html