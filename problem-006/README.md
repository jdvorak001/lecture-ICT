Úloha č. 6
==========

Část 1: Získání dat (unixový shell)
-----------------------------------

Napište a odlaďte shellový skript, který z [Portálu otevřených dat Evropské unie](https://data.europa.eu/euodp/en/data/dataset/cordisH2020projects/resource/de329b9f-bf9a-43ed-a5a8-d45f104b858e) získá aktuální soubor [cordis-h2020organizations.csv](https://cordis.europa.eu/data/cordis-h2020organizations.csv) dokumentující účast organizací na projektech programu Horizon 2020.
Pokud již soubor máte stažený a na serveru se nezměnil, již ho znovu nestahujte.

Nápověda: Stahování souborů se provádí příkazem `wget` nebo `curl`; můžete si vybrat, který chcete použít. Skript bude velmi jednoduchý.

  
Část 2: Zpracování a vizualizace dat (R)
----------------------------------------

Ze staženého souboru `cordis-h2020organizations.csv` vyberte organizace z České republiky
a pro každou z nich zjistěte, kolika projektů se účastnila a jaká byla celková výše příspěvku Evropské komise pro ni.
Tyto údaje zobrazte ve vhodném grafu.

Nápověda: Použijte knihovnu `dplyr` pro načtení a zpracování dat a knihovnu `ggplot2` pro výrobu grafu.
