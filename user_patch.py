import json
import re

with open('config.py', 'r') as fh:
	config = fh.read()

usr_json = json.load(open('cfg/users.json', 'r'))

usr_str = '%s,' % ',\n'.join(["'{}': '{}'".format(u, p) for u, p in usr_json.items()])

new_config = re.sub('USER_PASSWORD = \{([^}]+)\}', 'USER_PASSWORD = {\g<1>%s\n}' % usr_str, config)

with open ('config.py', 'w') as fh:
	fh.write(new_config)
