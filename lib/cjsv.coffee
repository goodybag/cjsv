Jsv = require("./jsv").JSV
env = Jsv.createEnvironment()

validate = (data, schema, validators...) ->
  report = env.validate(data, schema)
  if report.errors.length == 0
    console.log validators
    for validator, i in validators
      if !validator(data, schema)
        report.errors.push "custom function did not validate"
  return report

module.exports.validate = validate