---
documentclass: scrartcl
title: Zusammenfassung Softwaresysteme -- Compilerbau
author: Cats and elks
date: \today
---

# Softwaresysteme

## 16 März 2015

- CH{1-3} Grammatiken

## 23 März 2015 - Lexikalische Analyse

- Zeichenstrom -> [Scanner (flex)] --> Tokens --> [Parser (yacc/bison)]
- Token - syntakisch atomare Einheit (mit value/attribut/typ/zeile-spalte/...)
- Lexem - Zeichen die zu einem Token geführt haben.
- C Variablen als reguläres (Token)Muster:  [a-Z_][a-Z0-9_]*
- NEA und DEA: (nicht)deterministischer Zustandsautomat.
  Jeder NEA kann in ein DEA überführt werden.
  Jeder DEA kann durch eine CH3 Sprache dargestellt werden.
  Jeder CH3 Sprache kann durch einen regulären Ausdruck darstellen.
- C: Automaten mit Tabelle und switch/case oder goto implementieren.
- .i -> lex -> .yy.c -> gcc -> .o

Siehe auch ~/simple.i

Idee:

QueryParser von moosecat durch flex/bison ersetzen.

Beispiele:

(artist:Knorkator | b:"Hasen Chart*") + a t:b d:2001-2003

=> (artist:Knorkator OR album:"Hasen Chart*") AND (artist:a OR album:a OR
title:a) AND title:b AND (date:2001 OR date:2002 OR date:2003)

## 30 März 2015 - Syntaktische Analyse

TOP Down

    1. Tokenstrom von links nach rechts. (Auch Recursive Descent Parser)
    2. Leicht als prozeduales Programm implementierbar.

    Def. LL(1) Grammatik: 

        1. "1" bedeuet: Pro Terminal gibt es exakt eine Ableitung.
        2. schrecklich (ineffizient) zu implementieren.

Kellerautomat:

    - Bestandteile: EingabeABC, AusgabeABC, Band, Kellerspeicher (== Stack),
      Lesekopf mit übergangsfunktionen.
    - Eigentliche Hauptfunktion: Klammernzählen (das was ein CH3-Parser wie
      Regex nicht kann)
    - yacc baut (aus theorethischer Sicht) einfach nur die Übergangsfunktionen.


Bottom Up

    1. Auch LR Parser (l = tokenstrom v. l nach rechts generiert), r = parser
       liefert rechtsableitung der eingabe.
    
    - Reduce: Rechte Seite gefunden -> anwenden
    - Shift: Schieben auf Keller wenn keine Reduktion möglich.
    - Reduce-Reduce Konflikt: Entsteht wenn ein Lookahead Symbol zu zwei
      Produktionen reduzieren kann.

YACC

    - name.y -> [bison] -> y.tab.h, y.tab.c
