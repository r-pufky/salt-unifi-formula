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

Installs the unifi service. If an ssl_cert is specified in pillar, that cert
will be installed. Please GPG encrypt it!


``unifi.password``
------------------

Sets the unifi keystore password.

Your NEW password should be set in `config:password`.
Your OLD password should be set in `config:password_old`.
 * The default password is used as OLD if not specified.

Both of these should be GPG encrypted in pillar.

This is intended to be used as a manual state. Don't run this everytime.
