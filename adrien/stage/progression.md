## 29/05

- traduction du code VHDL gérant l'accéléromètre en éclat, ne compile pas car trop lourd (pleins de registres)

## 31/05

- traduction réussie, compile mais ne produit pas l'effet désiré

## 03/06

- ajout de l'utilisation de VHDl externes

## 06/06

- fonctions vhdl externes marchent à peu près
- typer avec tyB fonctionne

## 07/06

- remplacer "external" par le vrai nom de l'external dans le VHDL lors de l'appel
- convertir arguments de l'external de std_logic_vector -> bon type
- convertir valeur de retour de l'external de bon type -> std_logic_vector
- gérer le cas unit
- fonction sans paramètre -> marche pas, même avec une fonction wrapper -> does not always return a value, sans wrapper -> fait n'importe quoi (allume 7 seg au lieu des LEDs)

## 18/06

- circuits externes fonctionnent : petite manip à faire à la main si on utilise pas SDI et SDO (enlever l'assignation du top) sinon ça synthétise pas
- accéléromètre fonctionne avec l'external
- enlever pb SDI / SDO (-> responsabilité de l'utilisateur)

## 19/06

- morphomaths commencées

## 20/06

- morphomaths :
    - morph_seq v1 : 12x12 4793 cycles
    - morph_seq v2 : 12x12 4724 cycles (erosion / dilatation en par)

## 24/06
- morphomaths :
    - erreur quand on factorise les accès mémoire, code hlpp marche pas avec des paires de `bool` ni des `int<2>` (overflow detected, `to_integer`)

## 26/06
- circuits externes : tout fonctionne, circuits partagés (2 cycles) ou dupliqués (instantanés)

## 27/06
- circuits externes : les circuits partagés prennent maintenant qu'un cycle à s'exécuter
- VGA fonctionnel en VHDL et Eclat pur

## 28/06
- dans VGA, impossible d'utiliser un vecteur de quadruplet dans un mapi. Exemple avec : let v = vect_create(1,(0,0,50,50)), dans le mapi les 4 éléments du quadruplet valent 51250...
    -> utilisation de vecteurs
- affichage de plusieurs éléments à l'écran
- ajout primitive `vect_first_where`

## 01/07
- pong commencé -> une balle et une raquette

## 03/07
- pong avec vecteurs : trop long à synthétiser (1h) test avec un triplet (balle, joueur1, joueur2), synthèse en 33s
  autant de cellules logiques utilisées
- pong fonctionnel jouable avec les deux boutons contre un adversaire naïf et score (pong_v3.ecl)

## 04/07
- version jouable avec l'axe y de l'accéléromètre qu'on peut calibrer et différents niveaux de vitesse, ajout du switch0 comme switch de pause (pong_v4.ecl) (51.94MHz)
- v4 avec des effets quand on tape la balle en étant en mouvement (pong_v5_lift.ecl) (42.58MHz)
- résolution bug de collisions (33.73 MHz)

## 05/07
- la balle retourne au centre après un but, idem pour les raquettes, et pause de 1sec avant le début du prochain round
- pause de 5 sec au début de la partie (le temps que l'écran affiche)
- v6 avec calculs de trajectoires plus fin de la part de l'adversaire mais fréquence très basse (14.69MHz)