module.exports = OpenSettings = {};

OpenSettings.settings = function(app, callback) {
	cordova.exec(
		// Success callback
		callback,
		// Failure callback
		function(err) { console.log('OpenSettings.settings error'); },
		// Native Class Name
		"OpenSettings",
		// Name of method in native class.
		"settings",
		// array of args to pass to method.
		[]
	);
};

OpenSettings.bluetooth = function (app, callback) {
	cordova.exec(
		// Success callback
		callback,
		// Failure callback
		function(err) { console.log('OpenSettings.bluetooth error'); },
		// Native Class Name
		"OpenSettings",
		// Name of method in native class.
		"bluetooth",
		// array of args to pass to method.
		[]
	);
};

OpenSettings.bluetoothStatus = function (app, callback) {
	cordova.exec(
		// Success callback
		callback,
		// Failure callback
		function(err) { console.log('OpenSettings.bluetoothStatus error'); },
		// Native Class Name
		"OpenSettings",
		// Name of method in native class.
		"bluetoothStatus",
		// array of args to pass to method.
		[]
	);
};

OpenSettings.bluetoothChange = function (callback) {
	cordova.exec(
		// Success callback
		callback,
		// Failure callback
		function(err) { console.log('OpenSettings.bluetoothChange error'); },
		// Native Class Name
		"OpenSettings",
		// Name of method in native class.
		"bluetoothChange",
		// array of args to pass to method.
		[]
	);
};

return OpenSettings;
