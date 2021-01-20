# Libraries
library(prophet)
library(lubridate)
library(ggplot2)

# Ethereum data
library(readr)
data <- read_csv("C:/Users/Darshan Vithlani/criptoes10.csv", 
                     col_types = cols(close = col_number()))
#View(criptoes)
#data <- read.csv(file.choose(), header = T)
data$Date <- mdy(data$Date)
str(forecast)
# Log transformation
ds <- data$Date
#data$close <- as.numeric()
y <- data$close
y <- log(data$close)
df <- data.frame(ds, y)
1827
z <- "2020-10-18"-data$Date[2]
class(forecast)
View(data)
# Forecasting with Facebook's prophet package
m <- prophet(df,interval.width = .0005)
future <- make_future_dataframe(m, periods = 1825)
forecast <- predict(m, future)
forecast[nrow(forecast),'yhat']

# Plot forecast
plot(m, forecast)
mdyprophet_plot_components(m, forecast)

# Model performance
pred <- forecast$yhat[1:734]
actual <- m$history$y
plot(actual, pred)
summary(lm(actual~pred))
?cross_validation()
x <- cross_validation(m, 10, units = 'days')
performance_metrics(x, rolling_window = 0.1)
plot_cross_validation_metric(x,
                             metric = 'mae',
                             rolling_window = 0.2)