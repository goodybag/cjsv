Jsv = require("./lib/jsv").JSV

class Cjsv
	constructor: () ->
		@env = Jsv.createEnvironment()
		@msg = "A custom function did not validate."
	
	validate: (data, schema, validators...) ->
		report = @env.validate(data, schema)
		if report.errors.length == 0
			for validator, i in validators
				if !validator(data, schema)
					report.errors.push @msg
		return report

module.exports = Cjsv