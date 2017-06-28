#! /bin/python	
import requests

data = '''
{
  "auth": {
    "identity": {
      "methods": [
        "password"
      ],
      "password": {
        "user": {
          "name": "14871752 OTC-EU-DE-00000000001000020005",
          "password": "Sv4oeuaoeub0d4s3ti",
          "domain": {
            "name": "ee495c5ac5cf40df83fd39abc2447ab4"
          }
        }
      }
    },
    "scope": {
      "project": {
        "name": "eu-de"
      }
    }
  }
}
'''
r = requests.post('https://iam.eu-de.otc.t-systems.com/v3/auth/tokens', data=data )
print (data)
print (r)
print (r.text.encode('utf-8'))

