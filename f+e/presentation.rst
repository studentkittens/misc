:title: Filesync
:author: Christopher Pahl, Christoph Piechula
:description: The Hovercraft! tutorial.
:keywords: presentation, backend, impress.js, hovercraft, go-lang
:css: presentation.css

----

.. utility roles

.. role:: underline
    :class: underline

.. role:: blocky
   :class: blocky

.. role:: tiny
   :class: tiny

:id: first 

:tiny:`Forschung und Entwicklung zum Thema:`
Dateisynchronisation

.. image:: images/p2p.png
   :width: 40%
   :align: center

.. note::

   Notes.

----

:blocky:`Was haben wir vor`

.. note::

   Warum nicht zentral?

   Vorgehen: 
   
   - Erst Masterarbeit, evtl. mit F&E.
   - Dann Exist Gründerkredit um Weiterentwicklung zu gewährleisten.
   - Ziel: Wissenschaftliche Mitarbeiter um Forschung zu ermöglichen.

   Knoten-Typen:

   - Normaler Client
   - Archivierungsknoten
   - Backupknoten
   - ...
   
.. note::

    - Nicht verhandelbar. :-)

.. raw:: html

   <center>

,, ``git`` *für große Dateien in einfach.*''

.. raw:: html

   </center>

- Dezentrale, sichere Alternative zu Dropbox und Konsorten.
- Entwicklung eines simplen Prototypen als Masterarbeit.
- Einsatz bewährter Sicherheits-Standards.
- Heterogenes Netzwerk mit verschiedenen Knoten-Typen. 

**Hauptaugenmerk:**

  - Datenintegrität und Sicherheit.
  - aber auch einfache Benutzbarkeit.
  - Kontrolle der Daten liegt vollständig beim Nutzer.

----

|
|
|
|
|
|
|
|
|
|
|
|

:blocky:`Dezentrales Netz`

.. image:: images/network.png
   :width: 120%
   :align: center

----

:blocky:`Kernpunkte`

- Open Source Software und offene Entwicklung.
- Erweiterung durch Unternehmen, User und Interessenten.
- Entwicklung in der Programmiersprache `Go` ⇒  Portabel.
- ``ipfs`` als mögliche Basis ⇒ Effiziente Übertragung.
- Möglichkeit zur Volltextsuche über alle Dokumente.

.. image:: images/oss.png
   :width: 25%
   :align: center

.. image:: images/glenda.png
   :width: 25%
   :align: center


.. image:: images/ipfs.png
   :width: 25%
   :align: center

----

:blocky:`Weitere Ideen`

.. note::

    - XMPP: Anbindung an LDAP möglich. 

- Nutzung vorhandener ``XMPP`` Infrastruktur für dezentrale Kommunikation.
- Dadurch erweiterbar: Authentifizierung über ``XMPP`` und Anbindung an ``LDAP``
  möglich. 
- Unternehmenstaugliche Zwei-Faktor-Authentifizierung über beispielsweise
  RSA-Token oder Yubikey möglich.
- Mögliche Versionsverwaltung mittels Archivknoten.

.. image:: images/xmpp.png
   :width: 25%
   :align: center

.. image:: images/yubikey.png
   :width: 20%
   :align: center

.. image:: images/ldap.png
   :width: 20%
   :align: center

.. image:: images/vcs.png
   :width: 30%
   :align: center

---- 

:id: fin

**Fragen?**
