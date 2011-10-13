Custom JSV
==========

Cjsv is a layer that sits on top of \[[JSV](https://github.com/garycourt/JSV)\] to provide custom validation functionality after the JSON Schema validation process. For now, it only provides functionality to pass in any number of functions that return true or false to determine whether the data was good. Error reporting ties into Jsv's existing error report, but it's not nearly as robust yet. I think I might have to slightly alter Jsv to get the robustness we're looking for.

## Example
Let's take a looksie at a coffeescript example:
	Cjsv = require("./cjsv")
	myValidator = new Cjsv
	
	someSchema = {
		type: "object"
		properties: {
			firstName: {type: "string", required: true}
			lastName: {type: "string", required: true}
		}
	}

	someData = 
		firstName: "John"
		lastName: "Fawcett"

	# some arbitrary validation
	# both firstName must both be either gte or lt 5
	weirdNameValidator = (data, schema) ->
		if data.firstName.length >= 5
			return (data.lastName.length >= 5)
		return (data.lastName.length < 5)

	# Validate the data and get the results
	report = myValidator.validate(
		someData,
		someSchema,
		weirdNameValidator
	)

	if report.errors.length > 0
		console.log report.errors