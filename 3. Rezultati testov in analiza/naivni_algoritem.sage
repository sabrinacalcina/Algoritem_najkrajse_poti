# Naivni algoritem

# In[127]:


#prvo narediva vektorja xr in xl, za začetek najinega algoritma
#def graf(st_opazanj, st_vozlisc, st_pov_grafa, min_cena, max_cena)

[seznam_gra, utezi] = graf(20, 20, 100, 0, 10)
d = numpy.diag(kov_matrika(utezi))
avr_pov = [i * 1/len(utezi) for i in [sum(x) for x in zip(*utezi)]]
E = 0.3

x = vektorcki_x(seznam_gra[0], 1, 13)

vektor_xl =  numpy.add(numpy.dot((1-E), numpy.array(avr_pov)), numpy.dot(E,numpy.array(d)))
print(vektor_xl)
xl= numpy.dot(vektor_xl, numpy.array(x[0]))
print(xl)

vektor_xr = numpy.add(numpy.dot(E, numpy.array(avr_pov)), numpy.dot((1-E),numpy.array(d)))
print(vektor_xr)
xr= numpy.dot((vektor_xr), numpy.array(x[0]))
print(xr)
