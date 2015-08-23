#!/usr/bin/env python

import sys
import json
import subprocess
import collections

json_data = subprocess.check_output('aws ec2 describe-instances', shell=True)
data = json.loads(json_data)

eb_hosts = collections.defaultdict(list)

for reservation in data['Reservations']:
    for instance in reservation['Instances']:
        host = instance['PublicDnsName']
        if not host:
            continue
        for tag in instance['Tags']:
            if tag['Key'] == 'elasticbeanstalk:environment-name':
                eb_env = tag['Value']
                break
        else:
            continue
        eb_hosts[eb_env].append(host)

for eb_env, hosts in eb_hosts.iteritems():
    print eb_env
    for host in hosts:
        print ' - %s' % host
    print
