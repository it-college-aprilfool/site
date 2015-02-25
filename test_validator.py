import nose
import os
import re
import copy
from py_w3c.validators.html.validator import HTMLValidator

files = []
results = {}

for root, dirs, file in os.walk('.'):
	for name in file:
		if re.search('.*\.html?$',name):
			validator = HTMLValidator()
			filepath = os.path.join(root,name)
			validator.validate_file(filepath)
			results[filepath] = copy.copy(validator)



def validation(errortype):
	if errortype not in ('errors','warnings'):
		raise NotImplementedError(errortype + ' is not implemented at Validator Object')

	count = 0
	for path,result in results.items():

		obj = None
		if errortype == 'errors':
			obj = result.errors
		elif errortype == 'warnings':
			obj = result.warnings
		else:
			raise ValueError(errortype + 'is invalid value') 

		print '* ' + path + ': ' + str(len(obj)) + ' ' + errortype
		if len(obj) > 0:
			errorcount = 0
			for error in obj:
				errorcount += 1
				print '    ' + str(errorcount) +'. line ' + error['line'] + ': ' + error['message'].rstrip('\n')
		count += len(obj)

	return count

def test_has_no_errors():
	assert validation('errors') == 0

def test_has_no_warnings():
	assert validation('warnings') == 0
