# Elementize

Javascript (jQuery plugin) for replacing any chemical element symbols encountered inside the matched element contents with periodic table blocks, inspired by the Breaking Bad intro titles.

[Live example](http://dessibelle.github.io/elementize/example.html)

## Usage

1. Add `elementize.min.js` and `elementize.min.css` to you markup
2. Use `$(...).elementize();` on the elements you would like to elementize 

The below code illustrates an example usage, all available options and their default values.

```javascript
$('p').elementize({
    matchCase: true,            // Matches only "Be", not "BE", "be" or "bE"
    numberAsSpan: false,        // Inserts atomic number in a span element rather than data-attribute and :after pseudo-element
    style: 'colorize'           // Any of the following coloring styles: 'colorize', 'breaking-bad', 'clear'
});
```

Symbols found inside the matched elements will be wrapped in a container element (`span.elementize-element` - the block) and a symbol wrapper (`span.symbol` the symbol). The atomic number will be stored as a `data`-attribute on the block container, along with other meta data such as period (`.period-[1-7]`), group (`.group-[0-18]`) and one or more despriptive names such as `.halogon` or `alkali-metal`, facilitating highlighting of specific element groups etc.

## Known limitations

Currently each text node replaced will be wrapped in a `span`, which in turn contains another `span.elementize-element`, while it should be possible to just skip the top level `span` and append both replaced and untouched text nodes to directly to their original parent node. This is due to the way replacements are made, and the only drawback appears to be superfluous `span` elements.
