import test from 'ava';
import modScaffold from './';

test('exports a function', t => {
	t.is(typeof modScaffold, 'function');
});
