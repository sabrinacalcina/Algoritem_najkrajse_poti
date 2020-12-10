# Celotna priprava vseh reči, ki jih potrebujemo neposredno za naivni algoritem

# In[123]:


#prvo narediva vektorja xr in xl, za začetek najinega algoritma
st_opazanj, st_vozlisc, st_pov_grafa, min_cena, max_cena = 20, 30, 200, 0, 10

[seznam_gra, utezi] = graf(st_opazanj, st_vozlisc, st_pov_grafa, min_cena, max_cena)
#velikost d in avr_pov ga ne moti
d = numpy.diag(kov_matrika(utezi))
avr_pov = [i * 1/len(utezi) for i in [sum(x) for x in zip(*utezi)]]
E = 0.3

x = vektorcki_x(seznam_gra[0], 1, 4)
print(len(x))
#VIDALIJEV PREDLOG ZA ARGLEXMIN
def arglexmin(seznam_x, vektorji):
    xmin = min(([numpy.dot(numpy.array(v), numpy.array(x)) for v in vektorji], x) for x in seznam_x)
    return (xmin, xmin[0][0]+xmin[0][1])


[najmanjsi_xl, cenal] = arglexmin(x, [avr_pov, d])
#[najmanjsi_xl, cenal] = arglexmin(x, [numpy.dot((1-E), avr_pov), numpy.dot(E, d)])
najmanjsi_xl_pravi = najmanjsi_xl[1]
print(najmanjsi_xl_pravi)


[najmanjsi_xr, cenar] = arglexmin(x, [d, avr_pov])
#[najmanjsi_xr, cenar] = arglexmin(x, [numpy.dot((1-E), d),numpy.dot(E, avr_pov)])
najmanjsi_xr_pravi = najmanjsi_xr[1]
print(najmanjsi_xr_pravi)




import sys
sys.setrecursionlimit(10000)
print(sys.getrecursionlimit())


# Naivni algoritem

# In[125]:


uer3 = []
def razisci3(x0, x1, pov, diag, poti):
    if x0 == x1:
        print("x0 in x1 sta enaka.")
    else:
        alfa_m = numpy.dot(diag,numpy.subtract(x1,x0)) / numpy.dot(numpy.subtract(pov,diag),numpy.subtract(x0,x1))
        vek_zv = numpy.add(numpy.dot(alfa_m, numpy.array(pov)), numpy.dot((1-alfa_m),numpy.array(diag)))
        v_zv_alfa = numpy.dot(alfa_m, numpy.array(pov))
        v_zv_ena_minus_alfa = numpy.dot((1-alfa_m),numpy.array(diag))
        x_zv = arglexmin(poti, [v_zv_alfa, v_zv_ena_minus_alfa])[0][1]
        #print(x_zv)
        #print(numpy.dot(vek_zv, x_zv))
        #print(numpy.dot(vek_zv, x0))
        if numpy.dot(vek_zv, x_zv) < numpy.dot(vek_zv, x0):
            print("Najdeno je bilo izboljšanje.")
            uer3.append(x_zv)
            razisci(x0, x_zv, pov, diag, poti)
            razisci(x_zv, x1, pov, diag, poti)
        else:
            print("Izboljšava ni najdena.")
            uer3.append(x0)
    #return(print(uer3))


razisci3(najmanjsi_xl_pravi, najmanjsi_xr_pravi, avr_pov, d, x)


with open("razisci3_{}_{}_{}_{}_{}.json".format(st_opazanj, st_vozlisc, st_pov_grafa, min_cena, max_cena), "w") as f:
    json.dump(uer3, f)
