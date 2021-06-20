# (1)
subway <- read.csv("./csv/subway.csv", sep = ",")
subway_latlong <- read.csv("./csv/subway_latlong.csv", sep = ",")

subway.tot <- merge(subway, subway_latlong, by.x = c("station"), by.y = c("STATION_CD"))

# (2)
aggregate(subway.tot[, c("on_tot", "off_tot")], by = list(subway.tot$stat_name, subway.tot$income_date), FUN = mean)

# (3)
subway.tot.2011 <- subset(subway.tot, substr(subway.tot$income_date, 1, 4) == "2011")
aggregate(subway.tot.2011[, c("on_tot", "off_tot")], list(subway.tot.2011$stat_name), FUN = mean)

# (4)
aggregate(subway.tot.2011[, c("on_tot", "off_tot")], list(subway.tot.2011$LINE_NUM), FUN = mean)
