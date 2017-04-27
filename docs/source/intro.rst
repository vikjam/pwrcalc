============
Introduction
============

-------------------
Why Power Analysis?
-------------------

Power influences many design aspects, including what research questions to pursue, how many treatment arms to employ, and even more fundamentally, whether or not to proceed with a potential research project. For example, it may be that a remedial education program boosts tests scores by 20 percent when comparing treatment and control groups, but due to limited power, the RCT is unable to detect this true effect (with 95% confidence). However, we can estimate whether a given design is likely to be able to detect a reasonable effect size ex ante, allowing us to properly manage partner expectations and make the most of limited research resources.

-----------------------------------------
Why Another Power Analysis Package for R?
-----------------------------------------

There exists a fine number of options for power calculations in R. From the default power_. command to pwr_. to samplesize_.. However, economists love Stata. For users new to both Stata and power calculations, replicating the examples used by economists in power calculation lectures can be a bit tricky. This is the impetus for pwrcalc.

.._power: https://stat.ethz.ch/R-manual/R-devel/library/stats/html/power.t.test.html
.._pwr: https://cran.r-project.org/web/packages/pwr/index.html
.._samplesize: https://cran.r-project.org/web/packages/samplesize/index.html