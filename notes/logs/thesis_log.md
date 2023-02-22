Action Items:

See https://github.com/madprogramer/clinical-differential-privacy-project/issues .

2023-02-22:

* TODO: Problem statement before Friday
* TODO: 3 Paragraphs: Setting the territory (domain and problem), Related problems (medical analysis on DP-data for minority groups), What we want to do (research questions, how much does DP impact X or Y; also talk about selecting sensitive attributes and impactful covariates). 
* TODO: Literature
* TODO: SEND TO RAUL
* TODO: Reading needed on Local Differential Privacy vs. DP on Individuals
* TODO: Swedish data will be requested after 
* TODO: Ask about cohort groups

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
