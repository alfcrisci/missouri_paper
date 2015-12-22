##########################################################

# Please verify installation of any package 

# install.packages(c("MASS","xts","gvlma","forecast","lubridate","sjPlot","Metrics","forecast","ggplot2","reshape2","scales")


library(MASS)
library(xts)
library(gvlma)
library(forecast)
library(lubridate)
library(sjPlot)
library(Metrics)
library(forecast)
library(ggplot2)
library(reshape2)
library(scales)

##########################################################
# tools for exporting results

library(xtable)
library(pander)
library(memisc)
library(texreg)

##########################################################


setwd("/home/alf/Scrivania/lav_DISIT_abstract/missouri_paper")

# citation("Metrics")
# citation("forecast")
# citation("MASS")
# citation("gvlma")
# citation("xts")
# citation("lubridate")


#######################################################################################################
# Load data

expo2015=read.csv("expo2015_work_matrix.csv")


#######################################################################################################
# set up calendar variables and eliminate no useful variables

dates_expo=as.Date(expo2015$date)
expo2015$wday=as.factor(wday(dates_expo))
rownames(expo2015)=dates_expo
expo2015$date=NULL

#######################################################################################################
# sub queries of Expo2015 channel Twitter Vigilance

Q_EXPO2015=c("@4expo","@Pad_Ita2015","@EUExpo2015",
             "@ExpoinCitta","@askexpo","@RaiExpo",
             "#ExpoMilano2015","@cartadimilano","#alberodellavita")

#######################################################################################################
# Linear modeling with model selection with backward AIC esclusion
# training period 01-08-2015 - 10-10-2015 71 days testing period 15 days 11-10-2015-26-10-2015

model_sel=stepAIC(lm(expo_p ~.-TW_RTW_expo2015 -1,data=expo2015[1:71,]))


#######################################################################################################
# Check model assunption 

gv_expo2015_model <- gvlma(model_sel)
gv_expo2015_model

#######################################################################################################
# Assessement and instancing data.frame variables

expo2015$predicted_ML=as.numeric(predict(model_sel,expo2015))

pred_conf=predict(model_sel,expo2015,interval="confidence")

expo2015$arima_reg=NA
expo2015$arima_pure=NA


capture.output(htmlreg(list(model_sel),
                       caption="Linear Modeling for Expo2015"),file="MultRegr_EXPO15.htm")

#######################################################################################################
# Arima prediction fitting 

# to establish order of model 

guess_fit_arima<- auto.arima(expo2015$expo_p)

summary(guess_fit_arima)

# ARIMAX no covariates but imposing seasonality ( weekly cycle) and dritf for trend.

model_nocov <- Arima(expo2015$expo_p[1:71], order=c(2,1,2), seasonal=list(order=c(1,0,0), period=7,include.drift=T))

fc_nocov=forecast(model_nocov,h=21)

#######################################################################################################
# creating covariate  for arimax forecast

xreg_expo2015=expo2015[c("RaiExpo_ratio","alberodellavita_ratio","expo2015_ratio")]
reg=xreg_expo2015[1:71,]
row.names(reg)=NULL
newreg=data.frame(xreg_expo2015[72:92,])
row.names(newreg)=NULL

# ARIMAX with covariates #######################################################################################

model <- Arima(expo2015$expo_p[1:71], order=c(2,1,2), seasonal=list(order=c(1,0,0), period=7,include.drift=T),xreg=reg)


capture.output(htmlreg(list(model_nocov,model),model.names = c("ARIMA", "ARIMAX")
                       caption="Predictiv Models"),file="ARIMA_EXPO15.htm")


fc=forecast(model,xreg=newreg)

expo2015$arima_reg[72:92]=fc$mean
expo2015$arima_pure[72:92]=fc_nocov$mean
expo_ML_prediction=predict(model_sel,expo2015, interval = "prediction")
expo2015_forecast=cbind(dates_expo,expo2015[c("expo_p","predicted_ML","arima_reg","arima_pure")])

write.csv(expo_ML_prediction,"results/expo_ML_prediction.csv")
write.csv(fc,"results/fc_prediction.csv")
write.csv(fc_nocov,"results/fc_nov_prediction.csv")
write.csv(expo2015_forecast,"results/expo2015_forecast_prediction.csv")


########################################################################################################################################à
# Verification fitness of forecasts

# Arima

forecast_rmse_arima_reg=rmse(fc$mean[1:15],expo2015$expo_p[72:86])
forecast_rmse_arima_pure=rmse(fc_nocov$mean[1:15],expo2015$expo_p[72:86])

# Multiple linear modelling

forecast_rmse_lin_train=rmse(expo2015$predicted_ML[1:72],expo2015$expo_p[1:72])
forecast_rmse_lin_test=rmse(expo2015$predicted_ML[72:86],expo2015$expo_p[72:86])


res_rmse=data.frame(ARIMAX=forecast_rmse_arima_reg,
           ARIMA=forecast_rmse_arima_pure,
           Multiple_Regr_train=forecast_rmse_lin_train,
           Multiple_Regr_test=forecast_rmse_lin_test)
           

#######################################################################################################
# Creating time series object and Plotting time series results

expo2015_ts=as.xts(expo2015)

png("charts/expo_modeling.png",height = 600,width = 1200)
plot(expo2015_ts[,"expo_p"][1:86], ylab = "Expo 2015 Visitors",main = "Forecasting Visitor Expo2015",sub="Training period: 01-08-2015/10-10-2015 71 days \nTest period: 15 days period 11-10-2015/25-10-2015")
lines(x = expo2015_ts[,"arima_reg"][1:86], col = "red")
lines(x = expo2015_ts[,"arima_pure"][1:86], col = "green")
lines(x = expo2015_ts[,"predicted_ML"][1:71], col = "orange")
legend('bottomright', c("Expo Visitor TS","ARIMA","ARIMAX covariate","Train Diagnostic ML model"), col=c("black","darkgreen","red","orange"), lty=1, cex=.85)
dev.off()

#################################################################################################################
# XF9 case: Load matrix data.

XF9_data=read.csv("XF9_mat_work.csv")  

XF9_data$data=as.Date(XF9_data$data,format="%m/%d/%Y")

########################################################################à
# naming and data matrix set uo

names(XF9_data)

# [1] "Event"                "P_Auditel"            "P_PSKY"               "share"                "u_unique"             "TW_picco._min"       
# [7] "TW_RTW_XF9_day"       "TW_RTW_XF9_dayafter"  "TW_RTW_XF9_2day"      "TW_XF9_day"           "RTW_XF9_day"          "TW_XF9_dayafter"     
# [13] "RTW_XF9_dayafter"     "TW_XF9_2day"          "TW_RTW_XF9_week"      "TW_XF9_week"          "TRW_XF9_week"         "TW_XF9_week_declared"
########################################################################à
# Work matrix creation 

XF9_data_sky=na.omit(XF9_data[c("data","P_PSKY","TW_RTW_XF9_week","TW_XF9_week")])
XF9_data_sky$RTW_XF9_week_ratio=XF9_data_sky$TW_RTW_XF9_week/XF9_data_sky$TW_XF9_week

########################################################################################################################################################################ààà

# Linear modeling with P_sky

model_sky_XF9=lm(P_PSKY ~ . -data -1,data=XF9_data_sky)

summary(model_sky_XF9)

sjt.lm(model_sky_XF9,file="model_sel_sky_XF9.htm")

gv_sky_XF9 <- gvlma(model_sky_XF9)

pander(gv_sky_XF9)

XF9_pred_sky<- as.data.frame(predict(model_sky_XF9,interval="prediction"))

write.csv(XF9_pred_sky,"results/XF9_predictions_sky.csv")

XF9_pred_sky$obs=XF9_data_sky$P_PSKY
XF9_pred_sky$event=XF9_data_sky$data
XF9_rmse_sky=rmse(XF9_pred_sky$fit,XF9_pred_sky$obs)

plot_XF9_sky<- melt(XF9_pred_sky[c("event","fit","obs")], id.vars="event")


########################################################################################################################################################################ààà
# Plot results

ggplot(plot_XF9_sky, aes(x=event, y=value,fill=variable))+ geom_bar(stat = "identity", position=position_dodge(), colour="black" )+    
  geom_errorbar(aes(ymin=c(rep(0,length(XF9_pred_sky$lwr)),XF9_pred_sky$lwr), 
                    ymax=c(rep(0,length(XF9_pred_sky$upr)),XF9_pred_sky$upr),
                    size=.2,    # Thinner lines
                    width=.3
                    ),show_guide=FALSE)+
  ylab("Audience Count SKY Platform")+
  xlab("Date XF9") + 
  scale_x_date(labels = date_format("%m/%d"), breaks = date_breaks("week"))+
  scale_fill_manual(values=c("#999999", "#E69F00"),name="Prediction XF9 Audience Sky ",labels=c("Prediction", "Observed"))

ggsave("graphs/prediction_Sky.png")

########################################################################
# Output

mtable_XF9 <- mtable('Model XF9 Sky' = model_sky_XF9,
                    summary.stats = c('R-squared','F','p','N'))


capture.output(htmlreg(mtable_XF9),"results/XF9_model_summaries.html")
########################################################################

