# Elementize

Javascript (jQuery plugin) for replacing any chemical element symbols encountered inside the matched element contents with periodic table blocks, inspired by the Breaking Bad intro titles.

[Live example](http://dessibelle.github.io/elementize/example.html)

## Usage

1. Add `elementize.min.js` and `elementize.min.css` to you markup
2. Use `$(...).elementize();` on the elements you would like to elementize 

The below code illustrates an example usage, all available options and their default values.

```javascript
$('p').elementize({
    matchCase: true,                // Matches only "Be", not "BE", "be" or "bE"
    displayAtomicNumber: true,      // Controls display of atomic number in the top right corner
    displayAtomicWeight: false,     // Controls display of atomic weight in the bottom right corner
    noPseudoElements: false,        // Inserts atomic number and weight in a span element rather than data-attribute and :before/:after pseudo-elements
    style: 'colorize'               // Any of the following coloring styles: 'colorize', 'breaking-bad', 'clear'
});
```

Symbols found inside the matched elements will be wrapped in a `span.elementize-element` (the block) and a `span.symbol` (the symbol). The atomic number will be stored as a `data`-attribute on the block container, or a `span.number` element depending on your settings. In addition, the outer `span.elementize-element` wrapper will have classes signifying element properties, such as `period-[1-7]`, `group-[0-18]` along with one or more descriptive names such as `halogen` or `alkali-metal`, facilitating highlighting of specific element groups etc.

## Known limitations

Currently each text node replaced will be wrapped in a `span`, which in turn contains another `span.elementize-element`, while it should be possible to just skip the top level `span` and append both replaced and untouched text nodes directly to their original parent node. This is due to the way replacements are made, and the only drawback appears to be superfluous `span` elements.
