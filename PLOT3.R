#Cargando los archivos
setwd("/Users/gloriacarolina/Documentos/COUSERA/DATES SCIENCE/datasciencecoursera/MODULO 4")
destino1 <- "/Users/gloriacarolina/Documentos/COUSERA/DATES SCIENCE/datasciencecoursera/MODULO 4/household_power_consumption.txt"
HPC <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", stringsAsFactors=FALSE, dec="." )
summary(HPC)
dim(HPC) ##Para ver el tamaño del archivo (Resumen de filas y columnas)

#Seleccionar la fecha y hora establecida: 2007-02-01 y 2007-02-02 y
HPC_Date <- HPC[HPC$Date %in% c("1/2/2007", "2/2/2007"),] #Para que me busque las fechas determinadas a las posteriores (,)
#Encadenar las variables con $ para realizar los gráficos
GlobalActivePower <- as.numeric(HPC_Date$Global_active_power)
GlobalReactivePower <- as.numeric(HPC_Date$Global_reactive_power)
Voltage <- as.numeric(HPC_Date$Voltage)
GlobalIntensity <- as.numeric(HPC_Date$Global_intensity)
SubMet1 <- as.numeric(HPC_Date$Sub_metering_1)
SubMet2 <- as.numeric(HPC_Date$Sub_metering_2)
SubMet3 <- as.numeric(HPC_Date$Sub_metering_3)

#Construir un gráficos Energy Submetering vs Date (Plot 3)
HPC_Time <- strptime(paste(HPC_Date$Date, HPC_Date$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(HPC_Time, SubMet1, xlab="", ylab="Energy Sub Metering", type="l" )
lines(HPC_Time, SubMet2, col="red", type="l")
lines(HPC_Time, SubMet3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, lwd = 2.5)
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off() #Siempre recuerde cerrar el dispositivo
