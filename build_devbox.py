#!/usr/bin/env python

import sys
import os

def usage():
  print "Usage: %s <target_host> <comment>" % (sys.argv[0])
  sys.exit(0)

if len(sys.argv) < 3:
  usage()

target_host = sys.argv[1]
comment = sys.argv[2]
if target_host == "localhost":
  connection_local = ' --connection=local '
else:
  connection_local = ''

command = 'ansible-playbook -i "'+target_host+',"'+connection_local+' ansible/devbox.yml -e comment="'+comment+'"'

rc = os.system(command)
if rc != 0:
  sys.exit(1)

sys.exit(0)

