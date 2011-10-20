(function() {
  var Cjsv, Jsv;
  var __slice = Array.prototype.slice;
  Jsv = require("./jsv").JSV;
  Cjsv = (function() {
    function Cjsv() {
      this.env = Jsv.createEnvironment();
      this.msg = "A custom function did not validate.";
    }
    Cjsv.prototype.validate = function() {
      var data, i, report, schema, validator, validators, _len;
      data = arguments[0], schema = arguments[1], validators = 3 <= arguments.length ? __slice.call(arguments, 2) : [];
      report = this.env.validate(data, schema);
      if (report.errors.length === 0) {
        for (i = 0, _len = validators.length; i < _len; i++) {
          validator = validators[i];
          if (!validator(data, schema)) {
            report.errors.push(this.msg);
          }
        }
      }
      return report;
    };
    return Cjsv;
  })();
  module.exports = Cjsv;
}).call(this);
