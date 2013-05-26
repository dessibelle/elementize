#Elementize

Javascript (jQuery plugin) for replacing any chemical element symbols encountered inside the matched element contents with periodic table blocks, inspired by the Breaking Bad intro titles.

[Live example](http://dessibelle.github.io/elementize/example.html)

##Usage

1. Add `elementize.min.js` and `elementize.min.css` to you markup
2. Use `$(...).elementize();` on the elements you would like to elementize 

The below code illustrates an example usage, all available options and their default values.

```javascript
$('p').elementize({
    matchCase: true,            // Matches only "Be", not "BE", "be" or "bE"
    firstWordOnly: false,       // Matches only the first word in the element contents
    numberAsSpan: false,        // Inserts atomic number in a span element rather than data-attribute and :after pseudo-element
    style: 'colorize'           // Any of the following coloring styles: 'colorize', 'breaking-bad', 'clear'
});
```

##Known limitations

Currently all contained HTML elements in matched elements will be replaced by their respective `innerText`, as `innerText` rather than `innerHTML` is used for reading their contents. The reason for this is as to avoid replacing the HTML element themselves, as well as their attributes. It is there for recommended that you narrow down your selector as much as possible to only target exactly the elements you want to elementize.
