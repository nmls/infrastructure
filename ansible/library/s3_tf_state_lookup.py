#!/usr/bin/python

from ansible.module_utils.basic import *

import json
import boto3

def lookup(args):
  # This code needs reviewing and error handling!

  client = boto3.client("s3", region_name=args["region"])

  key_obj  = client.get_object(Bucket=args["bucket"], Key=args["bucket_key"])
  key_body = key_obj['Body'].read()

  key_body = json.loads(key_body)

  tf_key = args['tf_key'].split('.')

  resource_type = tf_key[0]
  resource_name = tf_key[1]
  resource_property = tf_key[2]

  res = resource_type+"."+resource_name

  for mod in key_body["modules"]:
    if res in mod["resources"].keys():
        return {"data": mod["resources"][res]["primary"]["attributes"][resource_property]}

  return {"data": {}}

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

