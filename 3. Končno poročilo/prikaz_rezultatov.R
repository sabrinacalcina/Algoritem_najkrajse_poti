data = c(3,4,5,6,7,8,9)
stetja = c(31/15, 37/15, 61/15, 86/15, 98/15, 41/5, 134/15)
stetja_improved = c(58/15, 61/15, 16/5, 4, 64/15, 52/15, 23/5)
plot(data, stetja, xlab = "Velikosti n x n", ylim = c(1,9), ylab = "Število kompuptacij", main = "Število komputacij v mrežastih grafih", pch = 19, col = "red")
points(data, stetja_improved, ylim = c(1,9),pch = 20, col = "blue", lty = 1)
legend("topleft", pch = c(19, 20), col=c("red", "blue"), legend = c("naivni algoritem", "izboljsani algoritem"))


naivni_cas = c(0.0007750352223714192, 0.005333328247070312, 0.029491297403971353, 0.24377485911051433, 1.1785194079081218, 7.369742608070373, 40.05112845897675)
improved_cas = c(0.11759552160898844, 0.01871970494588216, 0.02815687656402588, 0.16979921658833821, 0.6485042889912923, 2.3898878415425617, 17.061191765467324)
plot(data, naivni_cas, xlab = "Velikosti n x n", ylab ="Komputacijski čas (v sekundah)",type="l",lwd = "2", col="red", main = "Komputacijski časi za oba algoritma")
lines(data, improved_cas, col = "blue", type="l",lwd = 2)
legend("topleft",  legend = c("naivni algoritem", "izboljsani algoritem"), col=c("red", "blue"), lwd= "2")



