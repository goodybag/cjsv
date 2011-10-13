Cjsv = require("./cjsv")
Schema = require('./schemas')
myValidator = new Cjsv

data = 
	firstName: "john"
	lastName: "Fawcett"

# some arbitrary validation
# both firstName must both be either gte or lt 5
weirdNameValidator = (data, schema) ->
	if data.firstName.length >= 5
		return (data.lastName.length >= 5)
	return (data.lastName.length < 5)

report = myValidator.validate(
	data,
	Schema.Client,
	weirdNameValidator
)

if report.errors.length > 0
	console.log report.errors