Client = {
	type: "object"
	properties: {
		firstName: {type: "string", required: true}
		lastName: {type: "string", required: true}
		###phone: {type: "string"}
		email: {
			type: "string"
			index: true
			unique: true
			pattern: '/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/'
		}
		password: {
			type: "string"
			pattern : '/.{5,}/'
			required: true
		}
		created: {
			"type": "string"
			"format": "utc-millisec"
			"default": new Date().toUTCString()
			index: true
		}###
	}
}

module.exports.Client = Client