%%%
Title = "A Data Model for configuring Domain Name System (DNS) Zone Provisioning on Authoritative Nameservers"
abbrev = "yang-dns-zone-provisioning"
docname = "@DOCNAME@"
category = "std"
ipr = "trust200902"
area = "Internet"
workgroup = "DNSOP Working Group"
date = 2020-04-13T00:00:00Z

[seriesInfo]
name = "Internet-Draft"
value = "@DOCNAME@"
stream = "IETF"
status = "standard"

[[author]]
initials = "P."
surname = "Lexis"
fullname = "Pieter Lexis"
organization = "PowerDNS"
[author.address]
 email = "pieter.lexis@powerdns.com"
[author.address.postal]
 city = "Den Haag" 
 country = "Netherlands"

[[author]]
initials = "L."
surname = "Lhotka"
fullname = "Ladislav Lhotka"
organization = "CZ.NIC"
[author.address]
 email = "lhotka@nic.cz"
[author.address.postal]
 country = "CZ"

[[author]]
initials = "P."
surname = "Spacek"
fullname = "Petr Spacek"
organization = "CZ.NIC"
[author.address]
 email = "petr.spacek@nic.cz"
[author.address.postal]
 country = "CZ"

[[author]]
initials = "O."
surname = "Sury"
fullname = "Ondrej Sury"
organization = "Internet Systems Consortium"
[author.address]
 email = "ondrej@isc.org"
[author.address.postal]
 country = "CZ"

[[author]]
initials="W."
surname="Toorop"
fullname="Willem Toorop"
organization = "NLnet Labs"
[author.address]
 email = "willem@nlnetlabs.nl"
[author.address.postal]
 street = "Science Park 400"
 city = "Amsterdam"
 code = "1098 XH"
 country = "Netherlands"
%%%

.# Abstract

This document describes a data model for configuring DNS Zone provisioning
on authoritative nameservers. This data model only includes definitions for
configuration of primary and secondary relationships.

The purpose of this document is to enumerate the properties involved in
managing zone provisioning, for usage in managing zone provisioning
methods, such as catalog zones or NETCONF.

{mainmatter}

# Introduction

This document describes a data model for configuring DNS Zone provisioning
on authoritative nameservers. The model consists of a list of DNS Zones.
Besides the name of the zone, each zone MAY contain properties for
provisioning of those zones on primary and secondary nameservers.

## Definitions

The key words "**MUST**", "**MUST NOT**", "**REQUIRED**",
"**SHALL**", "**SHALL NOT**", "**SHOULD**", "**SHOULD NOT**",
"**RECOMMENDED**", "**NOT RECOMMENDED**", "**MAY**", and
"**OPTIONAL**" in this document are to be interpreted as described in
BCP 14 [@!RFC2119] [@!RFC8174] when, and only when, they appear in all
capitals, as shown here.

## Properties for primary nameservers

The optional properties for primary nameservers are:

* `notify-to`

> Which value consists of an IP address (with optional port-number)
  of the secondary nameserver to notify about changes to the zone,
  and an optional TSIG key (See [@!RFC2845]) with which the NOTIFY
  message [@!RFC1996] - which is used to send the notification - is signed.

> If no port-number is given, port 53 is assumed.

* `allow-transfer`

> Which value consist of a subnet in which the IP address of the
  secondary nameserver requesting a transfer has to fall, with an
  optional TSIG key with which the transfer request (either AXFR
  AXFR [@!RFC5936] or IXFR [@!RFC1995]) has to be signed and which
  will be used to sign the messages that will convey the complete
  or partial DNS Zone.

## Properties for primary nameservers

The optional properties for secondary nameservers are:

* `allow-notify`

> Which value consist of a subnet in which the IP address of the
  primary nameserver which is signaling that the DNS Zone has changed
  must fall, and an optional TSIG with which the NOTIFY message use
  MUST be signed.

* `transfer-from`

> Which value consists of an IP address (with optional port-number) of
  the primary nameserver from which to transfer the complete or partial
  DNS Zone, with an optional TSIG which MUST be used to send the AXFR
  or IXFR request and with which the transferred Zone data MUST be
  verified.

> If no port-number is given, port 53 is assumed.

# Tree Structure

This document defined the YANG module "ietf-dns-zone-provisioning", which
has the following tree structure.

<{{ietf-dns-zone-provisioning.tree}}

# YANG Module

<{{ietf-dns-zone-provisioning.yang}}

# IANA Considerations

This document registers the following namespace URI in the "ns"
subregistry of the "IETF XML Registry" [RFC3688]:

* URI: urn:ietf:params:xml:ns:yang:ietf-restconf-subscribed-notifications

* Registrant Contact: The IESG.

* XML:  N/A; the requested URI is an XML namespace.

This document registers the following YANG module in the "YANG Module
Names" registry [@!RFC6020]:

  * Name:  ietf-restconf-subscribed-notifications

  * Namespace: urn:ietf:params:xml:ns:yang:ietf-dns-zone-provisioning

  * Prefix: dnszp

  * Reference: RFCXXXX

# Security considerations

Instances of the data model defined in this document contain
sensitive information with which eavesdroppers can interfere in DNS Zone
provisioning and potentially even alter DNS Zone content.
Care must be taken that instances of this data model are only conveyed
over secure authenticated and encrypted channels.

# Acknowledgements

Thanks to
