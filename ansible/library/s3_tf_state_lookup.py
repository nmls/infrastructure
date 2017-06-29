#!/usr/bin/python

from ansible.module_utils.basic import *

import json
import boto3

def lookup(args):
  return {"data": "value from terraform here"}

def main():
  args = {
    "bucket": {"required": True, "type": "str"},
    "bucket_key":    {"required": True, "type": "str"},
    "tf_key":    {"required": True, "type": "str"},
    "region":    {"required": True, "type": "str"}
  }

  mod = AnsibleModule(argument_spec=args)
  res = lookup(mod.params)

  mod.exit_json(changed=False, result=res["data"])

if __name__ == '__main__':
  main()

