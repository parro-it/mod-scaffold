'use strict';
const test = require('ava');
const execa = require('execa');

const bin = `${__dirname}/init.sh`;

test('init template script is executed', async t => {
	const {stdout} = await execa(bin, ['test-template','test-result']);
	const lines = stdout.split('\n');
	t.is(lines[lines.length - 1], 'the answer is 42');
});

