#! /bin/python
from storageclient.cleversafe import CleversafeClient
import json
from creds import *

print endpoint
print secret
print access

creds = json.load(open('creds.json', 'r'))
cc = CleversafeClient(creds)


