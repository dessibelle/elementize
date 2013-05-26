#Elementize

jQuery plugin used to replace any chemical element symbols encountered inside the matched elements with periodic table blocks, inspired by the Breaking Bad intro titles.

##Usage

1. Add `elemetize.min.js` and `elemetize.min.css` to you markup
2. Use `$(...).elementize()` on the elements you would like to elementize 

The below code illustrates an example usage, all available options and their default values.

    $('p').elementize({
        matchCase: true,            // Matches only "Be", not "BE", "be" or "bE"
        firstWordOnly: false,       // Matches only the first word in the element contents
        numberAsSpan: false,        // Inserts atomic number in a span element rather than data-attribute and :after pseudo-element
        style: 'colorize'           // 'clear', 'breaking-bad'
    });

##Known limitations

Currently all contained HTML elements in matched elements will be replaced by their respective `innerText`, as `innerText` rather than `innerHTML` is used for reading their contents. The reason for this is as to avoid replacing the HTML element themselves, as well as their attributes. It is there for recommended that you narrow down your selector as much as possible to only target exactly the elements you want to elementize.
