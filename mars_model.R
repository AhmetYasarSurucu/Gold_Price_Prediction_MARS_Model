# Gerekli kütüphaneleri yükleme
library(caret)      # Makine öğrenimi modelleri için
library(earth)      # MARS modeli için
library(dplyr)      # Veri manipülasyonu için
library(readxl)     # Excel dosyalarını okumak için
library(ggplot2)    # Görselleştirme için

# Veriyi yükle
data <- read_csv('Duzenlenmis_calısma_veri.csv')


colnames(data)

# Bağımsız ve bağımlı değişkenleri ayır
# Bağımsız değişkenleri ayır (Acilis_Altin haricindeki tüm sütunlar)
#X <- subset(data, select = -c(Acilis_Altin, Hac._SP500))

# Bağımsız ve bağımlı değişkenleri ayır
X <- subset(data, select = c('Acilis_BIST', 'Acilis_Dax', 'Acilis_Dolar', 
                             'Acilis_Dow', 'Acilis_Petrol', 'Acilis_NASDAQ', 
                             'Acilis_Nikkei', 'Acilis_SP500','ABD_Tufe','Reel_Faiz_Orani','Acilis_Gumus'))

# Bağımlı değişken olarak Reel Faiz Oranı'nı seç

y <- data$Acilis_Altin

# Veriyi eğitim ve test setlerine ayır
set.seed(42)  # Sonuçların tekrarlanabilir olması için
trainIndex <- createDataPartition(y, p = .8, list = FALSE)
X_train <- X[trainIndex, ]
X_test <- X[-trainIndex, ]
y_train <- y[trainIndex]
y_test <- y[-trainIndex]

# İlk MARS modeli (degree=1) oluşturma
mars1 <- earth(y_train ~ ., data = data.frame(X_train, y_train), penalty = -1, degree = 1, nprune = 10, nk = 100, pmethod = "forward")

# Model özetini gösterme ve önemli katsayıları çıkarma
summary(mars1, style = "max", digits = 3)
summary(mars1)$coefficients %>% head(10)

# Değişken önemini değerlendirme
evimp(mars1)

# Modeli görselleştirme
plotmo(mars1) # Grafikler oluşturma

# Katsayıların anlamlılığını test etme
bx = model.matrix(mars1)
m.lm = lm(y_train ~ bx[,-1])
summary(m.lm)

# Tahmin yapma
predmars1 <- predict(mars1, newdata = X_test)

# Tahmin değerlerini ve gerçek değerleri görselleştirme
ggplot(data.frame(y_test, predmars1), aes(x = y_test, y = predmars1)) + 
  geom_point() +
  geom_abline(intercept = 0, slope = 1) +
  labs(x = 'Gerçek Değerler', y = 'MARS Tahminleri') +
  theme_bw()

# Tahmin değerlerini karşılaştırma
plot(y_test, predmars1) 

