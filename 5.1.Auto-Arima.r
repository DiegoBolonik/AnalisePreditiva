library(forecast)
library(ggplot2)

#Best model: ARIMA(1,1,1)(1,1,2)[12]
#AIC=180.78   AICc=180.97   BIC=205.5
modelo = auto.arima(co2, trace = T)
print(modelo)

#Best model: ARIMA(0,1,3)(0,1,1)[12]
#AIC=176.86   AICc=177   BIC=197.47
modelo2 = auto.arima(co2, trace = T,stepwise = F, approximation = F )
print(modelo2)

prev1 = forecast(modelo,h=12)
plot(prev1)

prev2 = forecast(modelo2,h=12)
plot(prev2)

print(prev1$mean)
print(prev2$mean)

plot(prev1)
lines(prev2$mean, col="red")