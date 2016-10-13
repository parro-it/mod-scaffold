import test from 'ava';
import modScaffold from './main';

test('exports a function', t => {
	t.is(typeof modScaffold, 'function');
});
