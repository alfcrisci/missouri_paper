## Predicting Presences and Audience using Twitter Based Metrics


**Alfonso Crisci**(3), **Valentina Grasso**(2,3), **Simone Menabeni** (1), **Paolo Nesi**(1), **Gianni Pantaleo** (1)



[1] DISIT Lab, Distributed [Systems and internet | Data Intelligence and] Technologies Lab
Dep. of Information Engineering (DINFO), University of Florence, Italy, Fax: 0039-055-2758570, tel: 0039-3355668674, http://www.disit.dinfo.unifi.it, http://www.disit.org/tv, paolo.nesi@unifi.it

[2] LAMMA Consortium, Tuscany Region-CNR, Sesto Fiorentino, Italy, grasso@lamma.rete.toscana.it, v.grasso@ibimet.cnr.it, Fax: 0039-055-444083, tel: 0039-055-4483068, http://www.lamma.rete.toscana.it

[3] CNR IBIMET National Research Council, Firenze, Italy,.a.crisci@ibimet.cnr.it Fax: 0039-055-308910, tel: 0039-0553033711, http://www.ibimet.cnr.it


### Abstract

The predictive skill of Twitter data have been already put in evidence in different fields: business, health, market and many other ones. It is based on the use of conversational volume metrics, calculated on the tweet counts in a specific twitter stream, retrieved by single/multiple query thanks to TwitterVigilance platform. Preliminary analysis and opportune metric definitions are ever required to feed reliable predictive  models face to the aim of quantitative sociological prediction. In this work some Twitter-based metrics have been identified and investigate in order to able a reliable predictions in two different cases: (i) the number of visitors at EXPO2015, in Milan (Italy); (ii) the assessement of audience of a popular television programme (i.e., X Factor season 9 in Italy) where people are highly involved trough a  participative support of media actors by using Twitter's posts. All results are provided and validated in a well described framework that puts in evidence how to manage and to exploit the twitter data predictive skills in different contexts. 
Concerning the attendees in a large event continuos scenario, as in EXPO2015 case, predictive models are  based on a preliminary identication of best twitter related predictors and a similar approach is followed for XF9 audience's prediction. Moreover, the work also shows the importance of the use of calendar variables and socail media temporal lagged data. In EXPO2015 case the latters are intrisically taking into account adoptingBox-Jenkings methodologies (ARIMA-ARIMAX modeling) , but also in the second one (XF9 case) where data are collected during the days before the event itself. The positive sentiment score, assesed by platform also provides a strong indication to perform the identification of the winner of the X Factor 9. All experiments reported have been based on the collected data via TwitterVigilance, a tool developed and adopted in some smart city projects and presented in this this paper.


## Statistical framework  for quantitative prediction by using TwitterVigilance outcomes

Twitter data have strong predictive power and generally are used to predict many social targets of interest. One of the work's aims is to define a comprehensive statistical approach to perfom a best exploitation of Twitter data in regard to sociological prediction. The nature of connections existing between social media data and any quantitative sociological variables related to an event could be informed by the relation existing by the event and its storyline retrieved by users/keytag/hashtag contained in social media's messages concerning the event itsself. Following these considerations is important, when social media data are available, which are the specific and their best composition of predictors in order to build an effective and perfomant initial data working matrix. The one was built merging, by time index, the sociological predictands (attendees, audience) and various all tweet metrics, and their derivative, extracted from platform in the specific channel related to the event investigated. This guess work matrix, after model selection, will be used to perform statistical predictions. Because many relations between social media content ( and/or activity metrics) and the sociological predicted variables are a priori unknown, it is necessary to start any investigations with the possible largest number of potential predictors. Other source of reliable predictors could be searched in the calendar variables linked to social media data and from the data subaggregate, calculate as component of channel and defined by the partial queries , identifiable in the main one instancing twitter channel. The latters could give most useful predictors, that could be enhance strongly prediction the specific sociological variable investigated. Following this way lagged and derived predictors could provide a great enhancement in predictions. In the work we have investigated two forms of derived predictors : the ratio between tweets and retweet amount of channel sub aggregation (EXPO2015 case) and the 5-day previous amount of tweets and retweets (XF9 case). These considerations whe have suggest us that in periodic and in temporally irregular events, common in mass media events, the calendar factors (as: month, weekday, year, etc.) loss their predictive strength, but the ones are often crucial when continuous time bounded events are considered as in EXPO2015 case. The statistical framework proposed, that concern the case presented, distinguishes two complementary steps. In the first one all significant predictors are identified and extracted from the initial work matrix, while in the second one effective predictive models are built selecting only preformat predictors. In the first step a multiple linear regression (ML) scheme have worked well and predictor selection was provided by using minimum Aikake Information Criterion. The stepAIC() function of R MASS package (Venables & Ripley, 2002) in backward modality is used. Final predictive models, in wide accord with literature, are built by using autoregressive integrated moving average models (ARIMA). In the work the role of exogenous covariates was mainly investigated (ARIMAX).The order The variables used are derived from previous step (ML-AIC model selection) to achieve the predictive skill of social media data and to avoid the excessive load of predictive noise only ratio (Retweets/tweets) variables are used. The single sociological index ARIMA model estimations are also carried out to inform us which are the baseline of predictability of the dependent variable used (EXPO2015) to be compared with the one given by final predictive ARIMAX model, in order to evaluate twitter contribute in term of error bias reduction. 


### Attendeess prediction model EXPO2015

In this case, where the prediction of number of visitors is expected as in similar cases, the autoregressive integrated moving average (ARIMA) modeling approach including seasonality and exogenous variables (ARIMAX) are the most suitable solution to able accurate predictions. This models are included and represent an evolution of Box-Jenkins approach [Asteriou & Hall ,2011]. The autoregressive part (AR) of model creates the basis of the prediction that is improved by a moving average modeling of errors made in the previous time instants of prediction(MA). ARIMAX models for time series' prediction exploiting Twitter data as supplementary information has been proposed in several works for the prediction and in particular for flu incidence [Broniatowski et al,2015]. The use of exogenuos covariate adds respect to the simple univariate ARIMA use other relevant predictive's skill only if exist a linkage between twitter conversation and the event itself. Following this consideration the reliable covariate used, that consist in Twitter count derived time series, are individuated measuring their statistical association with the predictand by using a minimal  AIC criterion. Thanks to stepAIC() function of R MASS package the predictor's selection is carried out inside a linear regressive scheme. The predictors individuate and delivered by the linear model summary [see tab XX]  are three and named as #RaiExpo RT/T ratio,#AlbertoDellaVita RT/T ratioand #expo2015 RT/T ratio. They are derived predictors (ratio between retweet and tweets of single hashtag) and show a deep association with daily EXPO2015 visitors. Another criteria of predictor's choices for prediction is the belonging at same kind of metrics,(  i.e the ratio). This fact reduces the biases linked to inomogenenuos variances that in the modelsassure their better perfomance.


|  Predictor name                     |    Estimate| Std. Error| t value| Pr(>&#124;t&#124;)|
|:----------------------|-----------:|----------:|-------:|------------------:|
|Sunday                 | 114896.9721| 28197.4828|  4.0747|             **0.0002** ***|
|Monday                 |  97666.0099| 27865.0961|  3.5050|             **0.0009** ***|
|Tuesday                | 107884.1513| 29797.4481|  3.6206|             **0.0007** ***|
|Wednesday              | 107190.5918| 28433.5776|  3.7699|             **0.0004** ***|
|Thursday                 | 114916.4552| 28069.3198|  4.0940|             **0.0001** ***|
|Friday                  | 108168.4328| 29280.1646|  3.6943|             **0.0005** ***|
|Saturday                  | 159424.8594| 28536.6530|  5.5867|             **0.0000** ***|
|RTW_4expo              |  -1606.3206|  1037.9168| -1.5476|             0.1277|
|RTW_askexpo            |   -468.3146|   137.4050| -3.4083|             **0.0013** ***|
|RTW_RaiExpo            |   3955.4524|  1232.9568|  3.2081|             **0.0023** ***|
|TW_RTW_4expo           |   1505.5976|  1037.9817|  1.4505|             0.1528|
|TW_RTW_askexpo         |    254.6677|    47.7627|  5.3319|             **0.0000** ***|
|TW_RTW_RaiExpo         |  -3104.7233|   977.6499| -3.1757|             **0.0025** ***|
|TW_RTW_cartadimilano   |     73.6980|    51.8333|  1.4218|             0.1609|
|TW_RTW_alberodellavita |    498.1847|    84.7418|  5.8789|             **0.0000** ***|
|**expo2015_ratio**         |  25757.7658| 12228.1564|  2.1064|             **0.0399** **|
|**alberodellavita_ratio**  | -64255.7817| 15941.8328| -4.0306|             **0.0002** ***|
|**RaiExpo_ratio**          | -18431.4667|  5123.0176| -3.5978|             **0.0007** ***|

Table  EXPO2015 diagnostic model summary table showing coefficient and Wald's test significance ( Acceptance p-value level= 0.05).

Expo2015 presences show a heavy association with the day of week, and it's quite in this kind of events. Saturday is the day that show the maximum impact and Monday the day with minimum one on EXPO2015's precence of visitors. The hashtag #alberodellavita is the most strong twitter's content associated with the daily event populatity.It is linked to the view of  aestethic manufacts inside the exposition area that area ppreciated by visitors becoming a milestone in users' conversations. The comprehensive amount of EXPO2015 channel, stated by #expo2015 hashtag,  and the televisive social tag as#RaiExpo are also good predictors. The ones with the first cited  are the predictors selected, and are used by using their  ratio retweet/native tweets of volume. The ratio metric confirms that to be a measure of social media amplification of the twitter hashtag streams.
If this case seasonal ARIMA models are used and is not to be necessary the use of calendar variables as predictors,but their role is important in diagnostic phase because help to individuates other classes of predictors.
EXPO2015 work data matrix is a set of time series that starts at 01-08-2015 and ends at 31-10-2015. The training period to build-up the predictive model, that  to be tested, are individuated in the first 71 days of the series, whiletest period covers the last two weeks of the event (11-10-2015/31-27/10/2015). We consider that fifty days as a good predictive horizon for a suitable model validation, considering that this kind of predictand shows often a non-stationary behaviour in time. The reason could be searched in local trend's presence as  Expo2015 tweets ha ve showed in the last two month of event.
The order of ARIMA modeling and the corresponded six parameters (p,d,q,P,D,Q) , in the work was provided thanks to auto.arima() function of R forecast package by using the univariate daily time series of visitors. 
The validation of predictions is based on the root mean square error (RMSE) metric that be applied on the predicted values and the correpondent observed ones related to test period. 
The final seasonal ARIMAX model  includes weekly periodicity (p=7) and have shown the best predictive accuracy in terms of RMSE face to the analogue univariate seasonal ARIMA model that have worked without covariates. The selected linear regressive model, obtained in diagnosis and selection step, didn't shown a good predictive perfomance in this case and can't to be used in operative way ( see tab XX). Formally covariates in ARIMA models are a weighting scheme for autoregressive terms and have the following form: 

                                                                     (Eq 1)

The order of  ARIMA-ARIMAX model found are p=2,d=1,q=2 and  P=1,D=0,Q=0 for the seasonal part of model. The predictive model, with co-regressors could be represented as:
                                                                    
                                                                     (Eq 2)


Where: ,  are the autoregressive components weighting factors;  seasonal weighting factor at 7 days; ,  the moving average weighting factors;  is an independent variable with normal distribution and zero mean. Thus, by substituting (2) in (1), it is possible to obtain the equation to estimate  with respect the past measures,\beta is the vector of future exogenous covariables; 
The table of the final  predictive ARIMAX Model estimates are:

ARIMA(2,1,2)(1,0,0)[7] | ar1   |     ar2 |    ma1   |     ma2 |   sar1        | RaiExpo_ratio | alberodellavita_ratio | expo2015_ratio|
Coefficients:          | 0.8274| -0.2741 |  -1.0441 | 0.0747  |  0.8311       |      110.3563 | -20445.657            | 6155.865|
s.e.                   | 0.5257|   0.3386|  0.5488  |  0.5359 |  0.0636       |      1338.9837|  8380.614             | 8332.086|


![expomodeling]((graphs/Expo_modeling_nesi.png) 

Figure xxxx Expo2015 time series predicitons and observed.

The figure XXX reports the comparison among the four models used in this case and the reported time series of EXPO2015 visitors: prediction  of Linear Model ( ML  model): the univariate ARIMA (2,1,2) model without seasonality; the ARIMA(2,1,2)(1,0,0)[7] ARIMA model without covariate, and ARIMAX(2,1,2)(1,0,0)[7] with exogenous covariables. From the results reported in Table XXX, it is evident that the selected model ARIMAX(2,1,2)(1,0,0)[7]+Z have the lower RMSE (root mean square error) with respect the real presences in the prediction period. 

Predictive Model ( Order) |RMSE |Mean error | Period| 
Multiple Linear regression | 17113,91 | - | Training period: 1 August to 10 October|
Multiple Linear regression | 71887,68 | -38788,22| Test period : 11th to 27 October|
ARIMA(2,1,2)(1,0,0)[7] | 16581,3 | -9929,00| Test period : 11th to 27 October|
ARIMAX(2,1,2)(1,0,0)[7]+Z| 14102,71 |-3752,27| Test period : 11th to 27 October|

Table ARIMA coefficients table. 


#### Case Study on X Factor 9 Italy, 2015: predicting the audience

X Factor is a well-known television music competition format born in UK and then exported abroad as to become the biggest television talent competition in Europe. In Italy in 2015 it was aired the 9th edition, XF9. The show is aired annually from September until December with first transmissions devoted to auditions and first singers selections (so called boot camps) followed by six weeks of weekly live shows where progressively less appreciated singers are eliminated except for the four best talents who reach the final, where the winner is voted by the public.
XFactor in Italy is broadcast on the pay-tv channel Sky1, but preliminary phases and the finale are aired also on free channels. The show begins at prime time and closes after mid night with Xtra Factor transmission that also attracts the same audience. Audience is typically young people also engaged on voting the singers and groups to eliminate or push them ahead. 
As for every talent competition, the participation of the public is critical for the success of XFactor show and social media play a critical role promoting singers, stimulating discussion and comments and pushing people to watch the show and vote for their favourites. Votes form the public during the XFactor finale reached 7 million, and the official hashtag #xf9 was the most widely used of the day (on the 10th December, final show day) both in Italy and in the worldwide Trending topic.The audience is typically for young people that are also engaged on voting the singers and groups to eliminate or push them ahead. The knowledge about the number of visitors, and thus of the prediction can be very important to sale the advertising delivered in the context of the television transmissions. XF9 organization has prepared a wide and effective dissemination and marketing campaign also including social media, and thus Twitter account and hashtags as the singers, and the judges, others have been produced spontaneously by the audience. 




Figure 5: Trends of twitter count for #XF9 on channel Xfactor9 on Twitter Vigilance.

XF9 channel on TwitterVigilance collected about 1.6 millions of tweets in Italian, that are mainly concentrated to the prime time and with much lower numbers in the days before the event, 435 of tweets and 57% of retweets (see Figure 5), and from XXXX unique users. The competition has led to 4 finalists in December 2015: Giosada, Urban Strangers, Davide Sciortino, Enrica Tara, and selecting the Giosada as winner. The metering of audience is typically performed by Auditel (described above) and via Smart Panel Sky. The official data can be accessed by Wikipedia: https://it.wikipedia.org/wiki/X_Factor_%28nona_edizione%29 The production of XF9 has planned an wide and effective maketing capaing, including Twitter user and hashtags as #XF9, #XTRA9 and later #xf9Live. At these, a number of hashtag has been added for the singers as: #UrbanStrangers, #comeva, #eleonora, #giosada, #Enrica, etc. But also for the judger/tutor, and for specific cases as: @DivanoRolling, #divanorolling, #GiosadaAlBallottaggio, #Elio, #elioperilsociale, etc. The trend of the other hashtags is reported in Figure 6. 







Figure 6: Trends of searches twitter volumes for the observed major hashtags on channel Xfactor9 of Twitter Vigilance.

#### Prediction XF9  audience model. 

In this case, the challenge was to predict the volume of the audience attending the TV event in the prime time one a week. the best predicitive model identification, in reason to the different time data structure and hence of predictions, may follow partially the procedure adopted for EXPO2015 case. In XF9 case it was not possible to identify valid training/test sets in reason to the low numerosity of work matrix, so the second step of ARIMA models set up is avoided and predictions were carried out by using only the best linear model obtained by predictor selection. The form is the same of equation 1.The target variable is represented by the users count declared by Sky Platform, that give the amount of device connected during the events. These data represent a good indicator of audience. The model fitting outcome is summarized by the following table and prediction/observed within interval of confidence ( 95%) are plotted in Figure 7.

         Predictors          |  Model XF9 Sky  coef ( & stderr)  
------------- | -------------|---------------------------------|
  **TW_RTW_XF9_week**        |    -22.257 (36.189)             |
     **TW_XF9_week**         |    43.475  (41.810)             |
  **RTW_XF9_week_ratio**     |    880089.617*** (61948.323)    |
  
  
 Outcomes         |  Model XF9 Sky  | 
 -------------    | -------------   |
  **R-squared**   |      0.996      |
  **F**           |      827.016    |
  **p**           |      < 0.0001   |
  **N**           |      13         |
  **RMSE**        |      85919.5    | 


Table XF9 prediction model with following Full amount of weekly tweets counts:TW_RTW_XF9_week, of native tweets TW_XF9_week and their ratio RTW_XF9_week_ratio


![XF9model]((graphs/prediction_Sky.png) 



Figure 7: Audience Prediction of  channel Xfactor9 of Twitter Vigilance.


Anyway results indicate a reliable perfomance of the simple linear regressive model (R squared =0.996 pvalue Fischer < 0.0001 ). This good results having reference to the use of lagged twitter predictors (RTW_XF9_week_ratio,TW_XF9_week) that are calculated on the week ( Day 1-5) preceding the event. The ratio between retweets and native tweets have shown more predictive sense and it is interpreted as a measure of expectations of people in regard to weekly event that have sure relation with social magnification detected by twitter channel activity.

## Reference

Broniatowski DA, Dredze M, Paul MJ, Dugas A (2015). "Using Social Media to Perform Local Influenza Surveillance in an Inner-City Hospital: A Retrospective Observational Study",JMIR Public Health Surveill 2015;1(1):e5,DOI: 10.2196/publichealth.4472

Asteriou D, Hall S G,(2011). "ARIMA Models and the Box–Jenkins Methodology". Applied Econometrics (Second ed.). Palgrave MacMillan. pp. 265–286. ISBN 978-0-230-27182-1.

Box G E P, Jenkins G,(1990)."Time  Series  Analysis,  Forecasting  and Control", Holden-Day, Incorporated.


