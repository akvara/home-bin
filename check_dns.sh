#!/bin/bash

while true; do
  nslookup -q=TXT _acme-challenge.kvaraciejus.lt ns3.hostex.lt
  sleep 60
done

