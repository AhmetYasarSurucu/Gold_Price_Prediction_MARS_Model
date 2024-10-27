# Gerekli kütüphaneleri yükleyin
library(readr)

# CSV dosyalarını okuyun
Altin_Vadeli <- read_csv("Altin_Vadeli_Islemleri_Gecmis_Verileri.csv")
BIST_Gecmis <- read_csv("BIST_Gecmis_Verileri.csv")
DAX_Gecmis <- read_csv("DAX_Gecmis_Verileri.csv")
Dolar_Endeksi <- read_csv("Dolar_Endeksi_Vadeli_Islemleri_Gecmis.csv")
Dow_Jones <- read_csv("Dow_Jones_Industrial_Average_Gecmis.csv")
Ham_Petrol <- read_csv("Ham_Petrol_WTI_Vadeli_Islemleri_Gecmis.csv")
NASDAQ_Gecmis <- read_csv("NASDAQ_Composite_Gecmis_Verileri.csv")
Nikkei_225 <- read_csv("Nikkei_225_Gecmis_Verileri.csv")
SP_500 <- read_csv("SP_500_Gecmis_Verileri.csv")


# Tüm veri setleri için sütun isimlerini ve ilk 5 satırı bir listede göster
lapply(list(Altin_Vadeli, BIST_Gecmis, DAX_Gecmis, Dolar_Endeksi, Dow_Jones, 
            Ham_Petrol, NASDAQ_Gecmis, Nikkei_225, SP_500), 
       function(df) list(colnames(df), head(df, 5)))
