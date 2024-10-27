library(dplyr)
library(readr)

# Fonksiyon tanımı
read_and_select <- function(file_path) {
  read_csv(file_path, locale = locale(decimal_mark = ",")) %>%
    select(`Tarih`, `Açılış`,`Hac.`)  # Tarih kolonu da ekleniyor
}

# Dosyaları oku ve yalnızca Açılış, Hacim ve Tarih sütunlarını tut
Altin_Vadeli <- read_and_select("Altin_Vadeli_Islemleri_Gecmis_Verileri.csv")
BIST_Gecmis <- read_and_select("BIST_Gecmis_Verileri.csv")
DAX_Gecmis <- read_and_select("DAX_Gecmis_Verileri.csv")
Dolar_Endeksi <- read_and_select("Dolar_Endeksi_Vadeli_Islemleri_Gecmis.csv")
Dow_Jones <- read_and_select("Dow_Jones_Industrial_Average_Gecmis.csv")
Ham_Petrol <- read_and_select("Ham_Petrol_WTI_Vadeli_Islemleri_Gecmis.csv")
NASDAQ_Gecmis <- read_and_select("NASDAQ_Composite_Gecmis_Verileri.csv")
Nikkei_225 <- read_and_select("Nikkei_225_Gecmis_Verileri.csv")
SP_500 <- read_and_select("SP_500_Gecmis_Verileri.csv")

# Verileri tarih kolonuna göre birleştir
merged_data <- Altin_Vadeli %>%
  full_join(BIST_Gecmis, by = "Tarih", suffix = c("_Altin", "_BIST")) %>%
  full_join(DAX_Gecmis, by = "Tarih", suffix = c("", "_DAX")) %>%
  full_join(Dolar_Endeksi, by = "Tarih", suffix = c("", "_Dolar")) %>%
  full_join(Dow_Jones, by = "Tarih", suffix = c("", "_Dow")) %>%
  full_join(Ham_Petrol, by = "Tarih", suffix = c("", "_Petrol")) %>%
  full_join(NASDAQ_Gecmis, by = "Tarih", suffix = c("", "_NASDAQ")) %>%
  full_join(Nikkei_225, by = "Tarih", suffix = c("", "_Nikkei")) %>%
  full_join(SP_500, by = "Tarih", suffix = c("", "_SP500"))

# Sonucu görüntüle
print(merged_data)


write_csv(merged_data, "birlesik_veri.csv")


