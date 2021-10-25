#!/usr/bin/env bash
echo Starting tunnel connection... Started.
ssh -N -L 5432:headlight.cluster-cyracjea4hxo.eu-west-1.rds.amazonaws.com:5432 ec2-user@54.194.19.176 -i ~/CCT/Headlight-etc/cct.pem
