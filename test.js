const test = require('ava');
const modScaffold = require('./');

test('exports a function', t => {
	t.is(typeof modScaffold, 'function');
});
