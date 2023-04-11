Action Items:

See https://github.com/madprogramer/clinical-differential-privacy-project/issues .

2023-03-28:
* Geo-indish paper
  * definition: 
  * A note on the unit of measurement
  * Discretization -> Can be used to map to a grid.
  * Proof using polar coordinates, difficult to generalise to 3+ dimensions
* Idea: k-nearest neighbour attack
  * If x in dataset D, is a match of v from dataset D2 
  * d = Sum squares of x_i - v_i for all i in M features, skipping j if either x_j or v_j is unknown.
  * Alternatively d = sum of (x_i != NA)(v_i != NA)(x_i - v_i)(x_i - v_i)

* Picking 5 variables we can map to 2D projection, and then adding noise to it?

* Two levels here: We cannot release a full dataset,
  * yes we can.
  * Geo-indishtinguability makes an argument for it.
  * Acknowledges that correlations are ignored.
    * HMMs can help assess risk.

* Raul suggestion: Stick to visualization only, that is a type of aggregate to focus on.
* Raul suggestion: Don't call it differential privacy, just call it noise. Netflix example.

* #1: Stick to clustering algorithms & visualization.
* #2: Release a model instead of data itself.

* Example: Inference from age on diagnosis. Try to keep it relevant and simple.

* For Raul: Ask what is the issue with releasing full data set.


* IMPORTANT:
https://dl.acm.org/doi/pdf/10.1145/2857705.2857708

* interactive vs. non-interactive

2023-03-22:
* https://docs.google.com/document/d/16SQIQYUeT5XIVROm2xb5vTpRjnQxrZtbSB2f83jqHQs/edit#
* Discussed issue with publishing entire dataset (?)
  * There are many ways to side-step this. 
* Discussed issue with membership-inference attacks
  * ARM supports scikit, Tensorflow is focussed on neural networks.
* BIG Suggestion from Raul:
  * Can we generalize geo-indishtinguishability to feature spaces?
    * If we can, then that solves both RQ1 and RQ2.
    * Primary use-case wuold be machine learning (supervised training or unsupervised clustering).
    * TODO: (Thursday) Design k-nearest neighbour attack
    * TODO: (Friday) Thesis Writing, also good for keeping track of things.
    * TODO: (Saturday) Redefine geo-indishtinguability DP for feature-spaces. https://www.eecis.udel.edu/~ruizhang/CISC859/S17/Paper/p26.pdf
    * TODO: (Sunday) Design a mechanism for purturbing the feature-location of data (ignore categoricals for now)
    * TODO: (Monday) Alternate clustering strategies
    * TODO: (Tuesday) Alternate distance metrics

2023-03-16:
* Talk about new dataset
* P(M(D) in O) <= P(M(D') in O) * e^epilon  
* Membership Inference for Training Datasets is a good way to frame it.
  * READ MEMBERSHIP INFERENCE PAPERS FROM RAUL.
* RQ 1: Does a concrete dataset have vulnerable data.
* Distance Metrics
* Swedish data not available yet, but perhaps un-needed.
* For next time: Come with Differential Privacy for Multivariate (RQ2)
* Reading needed for understanding dimensionality of response (1 vs. n)

2023-02-28:
* Talk about imputation paper
  * Good for privacy, bad for utility?
  * Worth investigating, but come back to this in the future
  * Keep attribute predictions indepedent
* Read through Desfontain, is there anything useful in the reading list 
  * https://desfontain.es/privacy/differential-privacy-reading-list.html
* DO NOT DP-IMPUTE!
  * You can impute on time-series.
* Tips for experiments:
  * Read some papers on synthetic data
  * Machine learning experiments are still relevant
  * Please also focus on sub-populations (minority groups)
* Expect little output over the course of these next 2 weeks.
* Focus on the method to analyze privacy and utility, not the synthetic data process
  * https://www.usenix.org/system/files/sec22summer_stadler.pdf 
* Design experiments, for next time.
* Asked about cohort groups, learned separation.

2023-02-24:
* Reading needed on Local Differential Privacy vs. DP on Individuals (DONE)
* https://desfontain.es/privacy/more-useful-results-dp.html

2023-02-23:

* Problem statement before Friday
* 3 Paragraphs: Setting the territory (domain and problem), Related problems (medical analysis on DP-data for minority groups), What we want to do (research questions, how much does DP impact X or Y; also talk about selecting sensitive attributes and impactful covariates). 
* Literature
* SEND TO RAUL for Review

2023-02-17:

1. New Dataset
  * a. Patient Treatments instead of Unique Patients
  * b. Swedish data may be coming in a few days
  * N Male=3882 N Female=11170 
  * Multiple treatments, multiple cohorts
    * Potential for causality investigation
2. Discuss how to compare distributions
  a. Define objective (f.x. SDAI at month X, or remission event at month X)
  b. Select sensitive attribute (Sex because of imbalance)
  c. Check if distributions change
    * i. Boxplots, distributions, survival analysis
    * ii. what measures are relevant here? (When machine learning is involved, we might instead of confusion matrices)
    * Absolute Difference (Subtract density areas under curve)
    * KL-Divergence (Entropy)
    * Mutual Information (Normalized?)
    * Kaplan–Meier and Cox Regression
    * Guessing Sensitivity: Estimating N or Clipping Data
    * Suggestion: Better to focus on real-data instead of classifiers
3. Writing
  * Need Zotero Archive
  * Any good journals/newsletters to follow? 
    * https://www.dpella.io/ 
    * https://desfontain.es/privacy/friendly-intro-to-differential-privacy.html
  * Problem statement before next Friday
  * Reading needed on Local Differential Privacy vs. DP on Individuals
  * 3 Paragraphs: Setting the territory (domain and problem), Related problems (medical analysis on DP-data for minority groups), What we want to do (research questions, how much does DP impact X or Y; also talk about selecting sensitive attributes and impactful covariates).
  * Sources
  * Differential Privacy.rdf
  * https://onlinelibrary.wiley.com/doi/10.1111/1475-6773.14000
  * https://www.pnas.org/doi/epdf/10.1073/pnas.2003714117
  * https://dl-acm-org.ep.ituproxy.kb.dk/doi/full/10.1145/3547139 
4. Reschedule
  a. Friday problematic
  b. Tuesday, Thursday have a Danish course
  c. Wednesday an assignment (CAN WORK)
  d. Moving to Monday would be best for me.
  e. Can skip this Monday.
  f. Re-exam from last semester (due March 15)
  g. Tuesday 10:15-11:15.

2023-02-10:

1. 
 * Don't Release Everything
 * Decide for yourself, based on data. 
 * Catch up on report, later.
2. 
 * Missing data?
   * Stereotyping (taking population mean/median) for DP.
     * Avoid calling it "bias".
   * Imputation for non-sensitive data.
3.
  * Gaussian can also be used for mitigating Laplace effect.
  * Keep reading :)
  * It is important to well define differential privacy.
    * **Pixel-DP may still be identifiable!**
    * Bayes Risk as alternative.
      * Based on patient-identification.
4.
  * Read your sensitivity definitions!
5. 
  * look into DP-classification, DP neural networks.
  * Control for DP vs. original datasets and check how
  predictions change, dependence to that.
  * Many machine learning papers tend to add noise
  to final output as well to have it distinct, in the case that it did occur in the original training data.
  * 
6.
  * https://itu-square.github.io/privugger/
  * Bayesian inference
7. 
  * does a DP model, still work?
  * K-L for benchmarks, bayesian modelling for visualizations

2023-02-03:

* Q1: What literature is relevant to us?
  * Thesis format is more strict about emphasizing previous research. ()
  * I assume some literature review from medical journals on DP projects will form the bulk of it.
    * Better to call it related work
  * Theoretical basis of DP and frameworks will be secondary.
    * Also define bias
  * I am a Mendeley fan also so that should make exchanging resources easier.
  * Will share Overleaf :)
  * Suggestion: Separate Background (DP Theory) and Related Work (Medical Domain)

* Q2: Do you think we need any kind of planning system?
  * Trello
  * Notion
  * GitHub issues (chosen)

* Q3: Do we need any kind of Supervision Agreement?
  * Probably not, because we started a bit early :)
  * However ITU thinks differently: 
    * The general project size guidelines are not suitable for the Computer Science thesis, because they often contain a lot of coding and very little text. Coding has a very compressed nature compared to text. Therefore, students agree upon the size of the project with the supervisor during the initial alignment of expectations in the supervision agreement.
    * So they want us to indicate

* Q4: Problem statement.
  * Deadline is last week of February.
  * Latest version is live on my GitHub, but I will refine it in the process of literature review.
  * https://github.com/madprogramer/clinical-differential-privacy-project#project-info
  * Please add a related work paragraph in the middle. AND THEN RESTATE YOUR APPROACH
    * Ask Raul for Mendeley archve

* Q5: Big Idea right now
  * Have the project as an R package
  * Conducting experiments based on what we find interesting
    * Thinking about metrics can wait a bit more. (KL-divergence and mutual information)
    * Theory: If a sensitive attribute gives us a good seperation in the outcome, then we don't want to elimininate information entirely.
  * Will interface with Python through wrappers, because there are a lot of DP tools that are python-only.
  * OpenDP is actually implemented in Rust. ( Concurrency is nice :) ) https://github.com/opendp/opendp
