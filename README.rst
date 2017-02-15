=====
kafka
=====

Install and configure a Kafka broker.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available states
================

.. contents::
    :local:

``kafka.user``
--------------

It creates the ``kafka`` user and group.

``kafka.binaries``
------------------

It downloads and extracts Kafka binaries from the tarball.

``kafka.configure``
-------------------

It configures the Kafka broker.

``kafka.systemd``
-------------------

It adds and enables a systemd unit for the Kafka broker.

References
==========

-  `Apache Kafka <https://kafka.apache.org/>`__
-  `Salt Formulas <https://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`__
