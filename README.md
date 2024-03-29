# clinical-differential-privacy-project
Differential Privacy Project in R

## Requirements:
1. Install R and RStudio.
2. [Install GSL on your OS.](https://solarianprogrammer.com/2020/01/26/getting-started-gsl-gnu-scientific-library-windows-macos-linux/#gsl_installation_macos)
3. If you are using R Version 4+, you will also have to install [devtools](https://devtools.r-lib.org/).
4. `devtools::install_github("RobinHankin/gsl")` in R console.
5. `devtools::install_github("brubinstein/diffpriv")` in R console.

## Project Info:

## Project Info:

### Project Title: Studying the Suitability of Differential Privacy for Biostatistics

#### Background: Epidemiology helps many clinicians and researchers to understand the distribution, patterns and determinants of health and disease conditions. However, a challenge exists in the form of patient data confidenciality (PDC). PDC means limited access to resources and data, as well as difficulty in replicating results. I seek to use Differential Privacy (DP) can remedy this, by making data less identifiable.

#### Related Work: The framework of Differential Privacy was laid forth by Dwork et al (2013). There is existing work which has attempted to incorporate DP into public health. Santos-Lozada et al. (2020) and Kurz et al. (2022) have examined a particular challenge in DP, where minority groups in healthcare may see disenfranchisment, in the form of overestimated mortality rates and declining Medicaid participation, respectfully. Another challenge is the case of missing data which is particularly common within the medical domain. Missing data, when not missing completely at random, can be quite revealing of the patients in the dataset and therefore warants special consideration in DP treatments (Das et al., 2022).

#### My Approach: This thesis will explore the different considerations needed to introduce Differential Privacy for Biostatistics. In particular, I advocate for the use of DP in privatizing research datasets, so that these datasets may later be re-usable for decision making at a clinical level. Thus, the healthcare professional should still maintain PDC with their patient, having access to said patient's precise data; only being able compare and contrast their patient's data against DP research data. My goal is to demonstrate the feasibility of a DP process that is both suitable in terms of utility for the clinician while not falling into any privacy-compromising pitfalls.

* RQ1: How do we determine what is sensitive data, and how can we estimate its sensitivity?

* RQ2: How can we handle multivariate data of different types? What set of mechanisms and parameters yield a good utility/privacy trade-off?

* RQ3: How do we apply DP mechanisms where missing data is common? 

* RQ4: Does the noise introduced by DP affect the utility of minorities or underrepresented groups? How much noise can be added so that utility is not lost for these groups?

#### References:

Das, S., Drechsler, J., Merrill, K., & Merrill, S. (2022). Imputation under differential privacy. arXiv preprint arXiv:2206.15063.

Dwork, Cynthia, and Aaron Roth. “The Algorithmic Foundations of Differential Privacy.” Foundations and Trends® in Theoretical Computer Science, vol. 9, no. 3–4, 2013, pp. 211–407. DOI.org (Crossref), https://doi.org/10.1561/0400000042.

Kurz, Christoph F., et al. “The Effect of Differential Privacy on Medicaid Participation among Racial and Ethnic Minority Groups.” Health Services Research, vol. 57, no. S2, Dec. 2022, pp. 207–13. DOI.org (Crossref), https://doi.org/10.1111/1475-6773.14000.

Santos-Lozada, Alexis R., et al. “How Differential Privacy Will Affect Our Understanding of Health Disparities in the United States.” Proceedings of the National Academy of Sciences, vol. 117, no. 24, June 2020, pp. 13405–12. DOI.org (Crossref), https://doi.org/10.1073/pnas.2003714117.

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
