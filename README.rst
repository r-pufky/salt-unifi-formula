=====
unifi
=====

Salt formula to install and configure ubiquiti unifi.

.. note::

    See the full `Salt Formulas installation and usage instructions
    http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html`_.

    See pillar.example, defaults.yaml for setup.


Available states
================

.. contents::
    :local:


``unifi``
---------

Installs the unifi service.


``unifi.cert``
--------------

Installs a custom SSL certificate for unifi.

Set cert data in `unifi:lookup:keystore:ssl_cert` with GPG encryption first.

``unifi.password``
------------------

Sets the unifi keystore password.

Ensure `unifi:lookup:keystore:password` is set to your NEW password.
Ensure `unifi:lookup:keystore:password_old` is set to your OLD password.

Both of these should be GPG encrypted in pillar.

This is intended to be used as a manual state. Don't run this everytime.
