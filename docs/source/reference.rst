=========
Reference
=========

--------
twomeans
--------

.. function:: twomeans(m1 = NULL, m2 = NULL, n1 = NULL, n2 = NULL, nratio = NULL, sd = NULL, sd1 = NULL, sd2 = NULL, sig.level = 0.05, power = 0.80)

   Two-sample t-test power calculation

    :param m1: Mean of a group 1 (e.g., the control-group)
    :param m2: Mean of a group 2 (e.g., the experimental-group)
    :param n1: Number of obs. in group 1 (e.g., the control-group)
    :param n2: Number of obs. in group 2 (e.g., the control-group)
    :param nratio: Specify the ratio of group 1 to group 2.
    :param sd: Standard deviation of each group, i.e., sd = sd1 = sd2
    :param sd1: Standard deviation of a group 1 (e.g., the control-group)
    :param sd2: Standard deviation of a group 2 (e.g., the experimental-group)
    :param sig.level: significance level; default is sig.level = 0.05
    :param power: one minus the probability of type II error, default is power = 0.8
    :rtype: A power.htest object with results in a structured list

---------
clustered
---------

.. function:: clustered(unclustered, rho, obsclus = NULL, numclus = NULL))

   Power calculations in an experiment with group clusters

    :params unclustered: Results from twomeans not adjusting for clusters
    :params rho: Specifies the intraclass correlation coefficient
    :params obsclus: Number of observations in each cluster
    :params numclus: Maximum number of clusters
    :rtype: A power.htest object with results in a structured list
