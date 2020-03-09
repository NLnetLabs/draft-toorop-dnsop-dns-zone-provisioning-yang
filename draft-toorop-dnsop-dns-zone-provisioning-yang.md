%%%
Title = "A Data Model for configuring Domain Name System (DNS) Zone Provisioning on Authoritative Nameservers"
abbrev = "yang-dns-zone-provisioning"
docname = "@DOCNAME@"
category = "std"
ipr = "trust200902"
area = "Internet"
workgroup = "DNSOP Working Group"
date = 2020-03-09T00:00:00Z

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
managing zone provisioning, to be used in a managing zone provisioning
method, such as catalog zones or NETCONF.

{mainmatter}

# Introduction

This document describes a data model for configuring DNS Zone provisioning
on authoritative nameservers. The model consists of a list of DNS Zones.
Besides the name of the zone, each zone 

# Tree Structure

This document defined the YANG module "ietf-dns-zone-provisioning", which
has the following tree structure.

<{{ietf-dns-zone-provisioning.tree}}

# YANG Module

<{{ietf-dns-zone-provisioning.yang}}

# IANA Considerations

This document registers the following namespace URI in the "ns"
subregistry of the "IETF XML Registry" [RFC3688]:

URI:
   urn:ietf:params:xml:ns:yang:ietf-restconf-subscribed-notifications

Registrant Contact:  The IESG.

XML:  N/A; the requested URI is an XML namespace.

This document registers the following YANG module in the "YANG Module
Names" registry [RFC6020]:

Name:  ietf-restconf-subscribed-notifications

Namespace:
  urn:ietf:params:xml:ns:yang:ietf-dns-zone-provisioning

Prefix:  dnszp

Reference:  RFC ????

# Security considerations

# Acknowledgements {#acknowledgements}


