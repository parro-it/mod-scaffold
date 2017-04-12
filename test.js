'use strict';
const test = require('ava');
const execa = require('execa');

const bin = `${__dirname}/init.sh`;

test('exports a function', async t => {
	const {stdout} = await execa(bin, ['template','test-result']);
	t.is('stdout', 'function');
});

