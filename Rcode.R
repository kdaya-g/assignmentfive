library('tidyverse')

conflict = read.csv('conflict.csv')

conflict.am = conflict %>%
  filter(conflict$region %in% c('Americas'))

conflict.am.1 = conflict.am[!duplicated(conflict.am$dyad.name), ] 

conflict.am.1 = conflict.am.1 %>%
  filter(conflict.am.1$type.of.violence == 1)

conflict.am.2 = conflict.am[!duplicated(conflict.am$dyad.name), ] 

conflict.am.2 = conflict.am.2 %>%
  filter(conflict.am.2$type.of.violence == 2)

conflict.am.3 = conflict.am[!duplicated(conflict.am$dyad.name), ] 

conflict.am.3 = conflict.am.3 %>%
  filter(conflict.am.3$type.of.violence == 3)

conflict.am.2 = conflict.am %>%
  filter(conflict.am$type.of.violence == 2)
conflict.am.3 = conflict.am %>%
  filter(conflict.am$type.of.violence == 3)

conflict.am.3 = conflict.am.3 %>%
  filter(dyad.name %in% c('los zetas - civilians', 'Medellín Cartel - Civilians', 'Cartel del Norte del Valle - Civilians', 'Cali Cartel - Civilians', 'Buxton gang - Civilians', 'PEPES - Civilians', 'Mara Salvatrucha (Honduras) - Civilians'))

conflict.am.2$crime.dyad = ifelse(conflict.am.2$dyad.name %in% c('AUC -FARC',
                                  'MRTA - Senderp Luminoso', 
                                  'Santiago Xochiltepec - Santo Domingo Teojomulco', 
                                  'Supporters of Jean-Bertrand Aristide - Supporters of Roger Lafontant', 
                                  'Supporters of JLP - Supporters of PNP', 
                                  'Laime - Qaqachaca', 
                                  'AUC - ELN', 
                                  'FARC - Autodefensas Campesinas del Magdalena Medio', 
                                  'Ambalo Indians - Guambiano Indians', 
                                  'Huaorani - Tagaeri'), 'false', 'true')

library('maps')

conflict.am.2 = conflict.am.2 %>%
  filter(crime.dyad == 'true')

conflict.crime = rbind(conflict.am.2, conflict.am.3)

ggplot(data = conflict.crime)+
  geom_point(mapping = aes(x=start.date, y=best.guess.deaths, colour = country))

ggplot(data = conflict.crime) +
  geom_bar(mapping = aes(x=conflict.crime$start.date, colour = country))