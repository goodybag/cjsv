Jsv = require("./lib/jsv").JSV
Cjsv = require("./cjsv")
Schema = require('./schemas')
console.log(Schema.Client)
validator = new Cjsv Jsv.createEnvironment()
console.log(validator.env)