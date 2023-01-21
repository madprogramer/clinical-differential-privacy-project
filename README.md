# clinical-differential-privacy-project
Differential Privacy Project in R

## Requirements:
1. Install R and RStudio.
2. [Install GSL on your OS.](https://solarianprogrammer.com/2020/01/26/getting-started-gsl-gnu-scientific-library-windows-macos-linux/#gsl_installation_macos)
3. If you are using R Version 4+, you will also have to install [devtools](https://devtools.r-lib.org/).
4. `devtools::install_github("RobinHankin/gsl")` in R console.
5. `devtools::install_github("brubinstein/diffpriv")` in R console.

## Project Info:

### Project Title: Studying the Suitability of Differential Privacy for Biostatistics

### Description: Epidemiology helps many clinicians and researchers to understand the distribution, patterns and determinants of health and disease conditions. However, a challenge exists in the form of patient data confidenciality (PDC). PDC means limited access to resources and data and difficulty in replicating results. Differential Privacy can remedy this, by making data less identifyable. This thesis will explore the different considerations needed to introduce Differential Privacy for Biostatistics.

### Potential Research Questions:
1. What is sensitive data?
 * During a presentation earlier this year, I had someone ask me the question: "DP may protect sensitive information, but at what stage does it become legally sufficient?"
 * From past experience, I know that as long as a client demonstrates some effort on their part to have protected personal information (as a data controller or processor) they are not found liable to charges realted to negligence. Not so long as they are proven to have violated a GDPR article, or some other legally defined right, on principle.
 * Even so, it is an important question to us, to be able to define what is sensitive data.
 * Obviously, there are bare essentials in the form of names, addresses, zip codes, id numbers.
 * And then there are variables which may be correlated to identity data, such as income status (may tell about the person's address).
 * The security literature is more technical in defining sensitive data, than the legal literature. So it may be best to take some notes from them in the background.  
2. How to handle multivariate data of different types? 
 * The current dataset I have access to has some 5000 patients and some 900 patient-features.
 * Some interesting columns are: age, sex, survey data, blood tests, drugs being taken, patient health scores over the course of up to 12 months since the start of treatment. 
 * Both continuous and catagorical variables are at work.
 * Not all patients are the same, different variables are relevant to specific patients. Therefore, **missing** data is fairly common.
 * More data may be on the way, as the project continues to mature. It is therefore, a good idea to avoid hard-coding the approach here.
3. How to pick a DP mechanism?
 * Traditionally, there have been 2-3 mechanisms widely in use:
   * The Laplace Mechanism for Continuous Variables
     * The [Snapping Mechanism](https://www.microsoft.com/en-us/research/wp-content/uploads/2012/10/lsbs.pdf) as a "better implementation", given that most Laplace Mechanism implementations are hampered by floating point precision.
   * The Geometric mechanism/Exponential Mechanism for Categorical Variables
 * The diffpriv package also introduces a newer technique: The Bernstein Mechanism:
   * For privately releasing multivariate real-valued functions. See the [bernstein](http://brubinstein.github.io/diffpriv/articles/bernstein.pdf) vignette for more.
4. How to determine a variable's sensitivity?
 * Sensitivity Analysis is the greatest bottleneck in involving multiple variables.
 * For each new variable we want to perturb, we have to determine a sensitivity for said variable.
   * Bernstein and a few newer mechanisms have their own ways of estimating sensitivity, potentially saving time.
5. How to pick an epsilon?
 * Epsilon is a parameter which allows us to adjust how much we want to allow the data to fluctuate.
 * High Epsilon means realistic data, Low Epsilon means more noise.
 * Having more data, allows for higher distortion to still retain statistical validity.
6. Considerations of training on DP-data? 
 * i.e. original patients in dataset are protected by DP, but a new patient being analyzed will (not necessarily) have their data DP
 * When we are interested in DP for regularization and mitiagating bias, it makes sense to train on DP data.
   * However, predicting on DP data will mean ignoring the current patient's specific condition:
     * True age, sexual dimorphism etc.
   * There is an argument to be made in this Thesis that for epidemiology, DP on training data is more valuable than DP on patient data.
     * A patient, a practicioner and their clinic already constitute a closed setting.
     * DP can help keep research open, but treatment and care precise.
7. Considerations of predicting on DP-data? 
 * i.e. original patients in dataset were (possibly) protected by DP, but a new patient being analyzed will always have their data DP)
 * Local Differential Privacy is all about keeping all client data (for testing and prediction) DP, at all times.
8. Can we mitigate bias?
  * In decision making a major problem is that of feedback-loops. If, for example, a recommendation system begins suggesting sub-optimal drugs for the elderly, based on their low life-expectancy, this would raise mortality of the elderly causing a harmful feedback loop. Instead in such a case, we would want to be able to examine the drug itself without decision-making being clouded with false assumptions.
  * Of particular interest is sex. Sexual dimorphism means that certain diseases may manifest differently in males and females of a species. However, feers of feedback-loops and other privacy concerns may scare patients away from revealing their biological sex.
  * Can DP, then offer us any workarounds?   
9. Can we avoid over-generalization?
  * A more interesting problem was brought up to me by Andrzej Wąsowski.
  * If DP is a kind of regularization, what happens in the case of class-imbalance?
  * If for example group A outnumbers group B, 9-to-1, then using DP to lower confidence of group-membership in the data, may produce models which assume a homogeneus membership of the majority group A. 
10. Comparison with other privacy algorithms (i.e. binning)
 * A criticism I have heard towards DP is: "Why would we trade accuracy for privacy? Surely, there must be a way to optimize for both".
 * I know that for example, anonymization techniques can be used to increase both accuracy and privacy. The problem is that this means losing precision.
   * f.x. representing patients as age-intervals [0-10, 11-20...] instead of their true age. But now, the cut-off's for a patient's condition are data-defined. And modeling will not be able to distinguish a 51 year-old from a 59 year-old.
 * Some basic comparison to different privacy algorithms can be relevant towards the end of the project. 

## More Reading:
* [The Algorithmic Foundations of Differential Privacy](https://www.cis.upenn.edu/~aaroth/Papers/privacybook.pdf)
* Potentially relevant dataset, PAD-UFES-20: a skin lesion dataset composed of patient data and clinical images collected from smartphones https://data.mendeley.com/datasets/zr7vgbcyr2/1
