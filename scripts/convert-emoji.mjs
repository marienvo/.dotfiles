// The difference between ⌨ (U+2328) and ⌨️ (U+2328, U+FE0F) lies in the
// variation selector-16 (VS16, U+FE0F) that follows the second character.
import clipboardy from 'clipboardy';

function toColoredEmoji(symbol) {
	return symbol + '\uFE0F';
}

// Getting the symbol from the command line arguments.
const symbol = process.argv[2];

if (!symbol) {
	console.error('Please provide a symbol as an argument.');
	process.exit(1);
}

const coloredEmoji = toColoredEmoji(symbol);

// Output the colored emoji to the console
console.log(coloredEmoji);

clipboardy.writeSync(coloredEmoji);
console.log('Written to clipboard')