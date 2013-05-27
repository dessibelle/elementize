# Reference jQuery
$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
  elementize: (options) ->

    styles = [
      'clear'
      'colorize'
      'breaking-bad'
    ]

    # Default settings
    settings =
      matchCase: false
      noPseudoElements: false
      displayAtomicNumber: true
      displayAtomicWeight: false
      debug: false
      style: 'colorize'

    # List of symbols
    symbols = []
    regex_string = ""
    regex = null

    # Periodic table (from http://en.wikipedia.org/wiki/List_of_elements)
    periodic_table =
      uut: { name: 'Ununtrium', atomic_number: 113, symbol: 'Uut', group: 13, period: 7, weight: 286, density: 0 }
      uup: { name: 'Ununpentium', atomic_number: 115, symbol: 'Uup', group: 15, period: 7, weight: 288, density: 0 }
      uus: { name: 'Ununseptium', atomic_number: 117, symbol: 'Uus', group: 17, period: 7, weight: 294, density: 0 }
      uuo: { name: 'Ununoctium', atomic_number: 118, symbol: 'Uuo', group: 18, period: 7, weight: 294, density: 0 }
      he: { name: 'Helium', atomic_number: 2, symbol: 'He', group: 18, period: 1, weight: 4.002602, density: 0.0001785 }
      li: { name: 'Lithium', atomic_number: 3, symbol: 'Li', group: 1, period: 2, weight: 6.94, density: 0.534 }
      br: { name: 'Bromine', atomic_number: 35, symbol: 'Br', group: 17, period: 4, weight: 79.904, density: 3.122 }
      be: { name: 'Beryllium', atomic_number: 4, symbol: 'Be', group: 2, period: 2, weight: 9.012182, density: 1.85 }
      ba: { name: 'Barium', atomic_number: 56, symbol: 'Ba', group: 2, period: 6, weight: 137.327, density: 3.594 }
      ne: { name: 'Neon', atomic_number: 10, symbol: 'Ne', group: 18, period: 2, weight: 20.1797, density: 0.0008999 }
      na: { name: 'Sodium', atomic_number: 11, symbol: 'Na', group: 1, period: 3, weight: 22.98976928, density: 0.971 }
      mg: { name: 'Magnesium', atomic_number: 12, symbol: 'Mg', group: 2, period: 3, weight: 24.3050, density: 1.738 }
      al: { name: 'Aluminium', atomic_number: 13, symbol: 'Al', group: 13, period: 3, weight: 26.9815386, density: 2.698 }
      si: { name: 'Silicon', atomic_number: 14, symbol: 'Si', group: 14, period: 3, weight: 28.085, density: 2.3296 }
      cl: { name: 'Chlorine', atomic_number: 17, symbol: 'Cl', group: 17, period: 3, weight: 35.45, density: 0.003214 }
      ar: { name: 'Argon', atomic_number: 18, symbol: 'Ar', group: 18, period: 3, weight: 39.948, density: 0.0017837 }
      ca: { name: 'Calcium', atomic_number: 20, symbol: 'Ca', group: 2, period: 4, weight: 40.078, density: 1.54 }
      sc: { name: 'Scandium', atomic_number: 21, symbol: 'Sc', group: 3, period: 4, weight: 44.955912, density: 2.989 }
      ti: { name: 'Titanium', atomic_number: 22, symbol: 'Ti', group: 4, period: 4, weight: 47.867, density: 4.54 }
      cr: { name: 'Chromium', atomic_number: 24, symbol: 'Cr', group: 6, period: 4, weight: 51.9961, density: 7.15 }
      mn: { name: 'Manganese', atomic_number: 25, symbol: 'Mn', group: 7, period: 4, weight: 54.938045, density: 7.44 }
      fe: { name: 'Iron', atomic_number: 26, symbol: 'Fe', group: 8, period: 4, weight: 55.845, density: 7.874 }
      co: { name: 'Cobalt', atomic_number: 27, symbol: 'Co', group: 9, period: 4, weight: 58.933195, density: 8.86 }
      ni: { name: 'Nickel', atomic_number: 28, symbol: 'Ni', group: 10, period: 4, weight: 58.6934, density: 8.912 }
      cu: { name: 'Copper', atomic_number: 29, symbol: 'Cu', group: 11, period: 4, weight: 63.546, density: 8.96 }
      zn: { name: 'Zinc', atomic_number: 30, symbol: 'Zn', group: 12, period: 4, weight: 65.38, density: 7.134 }
      ga: { name: 'Gallium', atomic_number: 31, symbol: 'Ga', group: 13, period: 4, weight: 69.723, density: 5.907 }
      ge: { name: 'Germanium', atomic_number: 32, symbol: 'Ge', group: 14, period: 4, weight: 72.63, density: 5.323 }
      as: { name: 'Arsenic', atomic_number: 33, symbol: 'As', group: 15, period: 4, weight: 74.92160, density: 5.776 }
      se: { name: 'Selenium', atomic_number: 34, symbol: 'Se', group: 16, period: 4, weight: 78.96, density: 4.809 }
      kr: { name: 'Krypton', atomic_number: 36, symbol: 'Kr', group: 18, period: 4, weight: 83.798, density: 0.003733 }
      rb: { name: 'Rubidium', atomic_number: 37, symbol: 'Rb', group: 1, period: 5, weight: 85.4678, density: 1.532 }
      sr: { name: 'Strontium', atomic_number: 38, symbol: 'Sr', group: 2, period: 5, weight: 87.62, density: 2.64 }
      zr: { name: 'Zirconium', atomic_number: 40, symbol: 'Zr', group: 4, period: 5, weight: 91.224, density: 6.506 }
      nb: { name: 'Niobium', atomic_number: 41, symbol: 'Nb', group: 5, period: 5, weight: 92.90638, density: 8.57 }
      mo: { name: 'Molybdenum', atomic_number: 42, symbol: 'Mo', group: 6, period: 5, weight: 95.96, density: 10.22 }
      tc: { name: 'Technetium', atomic_number: 43, symbol: 'Tc', group: 7, period: 5, weight: 98, density: 11.5 }
      ru: { name: 'Ruthenium', atomic_number: 44, symbol: 'Ru', group: 8, period: 5, weight: 101.07, density: 12.37 }
      rh: { name: 'Rhodium', atomic_number: 45, symbol: 'Rh', group: 9, period: 5, weight: 102.90550, density: 12.41 }
      pd: { name: 'Palladium', atomic_number: 46, symbol: 'Pd', group: 10, period: 5, weight: 106.42, density: 12.02 }
      ag: { name: 'Silver', atomic_number: 47, symbol: 'Ag', group: 11, period: 5, weight: 107.8682, density: 10.501 }
      cd: { name: 'Cadmium', atomic_number: 48, symbol: 'Cd', group: 12, period: 5, weight: 112.411, density: 8.69 }
      in: { name: 'Indium', atomic_number: 49, symbol: 'In', group: 13, period: 5, weight: 114.818, density: 7.31 }
      sn: { name: 'Tin', atomic_number: 50, symbol: 'Sn', group: 14, period: 5, weight: 118.710, density: 7.287 }
      sb: { name: 'Antimony', atomic_number: 51, symbol: 'Sb', group: 15, period: 5, weight: 121.760, density: 6.685 }
      te: { name: 'Tellurium', atomic_number: 52, symbol: 'Te', group: 16, period: 5, weight: 127.60, density: 6.232 }
      xe: { name: 'Xenon', atomic_number: 54, symbol: 'Xe', group: 18, period: 5, weight: 131.293, density: 0.005887 }
      cs: { name: 'Caesium', atomic_number: 55, symbol: 'Cs', group: 1, period: 6, weight: 132.9054519, density: 1.873 }
      la: { name: 'Lanthanum', atomic_number: 57, symbol: 'La', group: 0, period: 6, weight: 138.90547, density: 6.145 }
      ce: { name: 'Cerium', atomic_number: 58, symbol: 'Ce', group: 0, period: 6, weight: 140.116, density: 6.77 }
      pr: { name: 'Praseodymium', atomic_number: 59, symbol: 'Pr', group: 0, period: 6, weight: 140.90765, density: 6.773 }
      nd: { name: 'Neodymium', atomic_number: 60, symbol: 'Nd', group: 0, period: 6, weight: 144.242, density: 7.007 }
      pm: { name: 'Promethium', atomic_number: 61, symbol: 'Pm', group: 0, period: 6, weight: 145, density: 7.26 }
      sm: { name: 'Samarium', atomic_number: 62, symbol: 'Sm', group: 0, period: 6, weight: 150.36, density: 7.52 }
      eu: { name: 'Europium', atomic_number: 63, symbol: 'Eu', group: 0, period: 6, weight: 151.964, density: 5.243 }
      gd: { name: 'Gadolinium', atomic_number: 64, symbol: 'Gd', group: 0, period: 6, weight: 157.25, density: 7.895 }
      tb: { name: 'Terbium', atomic_number: 65, symbol: 'Tb', group: 0, period: 6, weight: 158.92535, density: 8.229 }
      dy: { name: 'Dysprosium', atomic_number: 66, symbol: 'Dy', group: 0, period: 6, weight: 162.500, density: 8.55 }
      ho: { name: 'Holmium', atomic_number: 67, symbol: 'Ho', group: 0, period: 6, weight: 164.93032, density: 8.795 }
      er: { name: 'Erbium', atomic_number: 68, symbol: 'Er', group: 0, period: 6, weight: 167.259, density: 9.066 }
      tm: { name: 'Thulium', atomic_number: 69, symbol: 'Tm', group: 0, period: 6, weight: 168.93421, density: 9.321 }
      yb: { name: 'Ytterbium', atomic_number: 70, symbol: 'Yb', group: 0, period: 6, weight: 173.054, density: 6.965 }
      lu: { name: 'Lutetium', atomic_number: 71, symbol: 'Lu', group: 3, period: 6, weight: 174.9668, density: 9.84 }
      hf: { name: 'Hafnium', atomic_number: 72, symbol: 'Hf', group: 4, period: 6, weight: 178.49, density: 13.31 }
      ta: { name: 'Tantalum', atomic_number: 73, symbol: 'Ta', group: 5, period: 6, weight: 180.94788, density: 16.654 }
      re: { name: 'Rhenium', atomic_number: 75, symbol: 'Re', group: 7, period: 6, weight: 186.207, density: 21.02 }
      os: { name: 'Osmium', atomic_number: 76, symbol: 'Os', group: 8, period: 6, weight: 190.23, density: 22.61 }
      ir: { name: 'Iridium', atomic_number: 77, symbol: 'Ir', group: 9, period: 6, weight: 192.217, density: 22.56 }
      pt: { name: 'Platinum', atomic_number: 78, symbol: 'Pt', group: 10, period: 6, weight: 195.084, density: 21.46 }
      au: { name: 'Gold', atomic_number: 79, symbol: 'Au', group: 11, period: 6, weight: 196.966569, density: 19.282 }
      hg: { name: 'Mercury', atomic_number: 80, symbol: 'Hg', group: 12, period: 6, weight: 200.59, density: 13.5336 }
      tl: { name: 'Thallium', atomic_number: 81, symbol: 'Tl', group: 13, period: 6, weight: 204.38, density: 11.85 }
      pb: { name: 'Lead', atomic_number: 82, symbol: 'Pb', group: 14, period: 6, weight: 207.2, density: 11.342 }
      bi: { name: 'Bismuth', atomic_number: 83, symbol: 'Bi', group: 15, period: 6, weight: 208.98040, density: 9.807 }
      po: { name: 'Polonium', atomic_number: 84, symbol: 'Po', group: 16, period: 6, weight: 209, density: 9.32 }
      at: { name: 'Astatine', atomic_number: 85, symbol: 'At', group: 17, period: 6, weight: 210, density: 7 }
      rn: { name: 'Radon', atomic_number: 86, symbol: 'Rn', group: 18, period: 6, weight: 222, density: 0.00973 }
      fr: { name: 'Francium', atomic_number: 87, symbol: 'Fr', group: 1, period: 7, weight: 223, density: 1.87 }
      ra: { name: 'Radium', atomic_number: 88, symbol: 'Ra', group: 2, period: 7, weight: 226, density: 5.5 }
      ac: { name: 'Actinium', atomic_number: 89, symbol: 'Ac', group: 0, period: 7, weight: 227, density: 10.07 }
      th: { name: 'Thorium', atomic_number: 90, symbol: 'Th', group: 0, period: 7, weight: 232.03806, density: 11.72 }
      pa: { name: 'Protactinium', atomic_number: 91, symbol: 'Pa', group: 0, period: 7, weight: 231.03588, density: 15.37 }
      np: { name: 'Neptunium', atomic_number: 93, symbol: 'Np', group: 0, period: 7, weight: 237, density: 20.45 }
      pu: { name: 'Plutonium', atomic_number: 94, symbol: 'Pu', group: 0, period: 7, weight: 244, density: 19.84 }
      am: { name: 'Americium', atomic_number: 95, symbol: 'Am', group: 0, period: 7, weight: 243, density: 13.69 }
      cm: { name: 'Curium', atomic_number: 96, symbol: 'Cm', group: 0, period: 7, weight: 247, density: 13.51 }
      bk: { name: 'Berkelium', atomic_number: 97, symbol: 'Bk', group: 0, period: 7, weight: 247, density: 14.79 }
      cf: { name: 'Californium', atomic_number: 98, symbol: 'Cf', group: 0, period: 7, weight: 251, density: 15.1 }
      es: { name: 'Einsteinium', atomic_number: 99, symbol: 'Es', group: 0, period: 7, weight: 252, density: 13.5 }
      fm: { name: 'Fermium', atomic_number: 100, symbol: 'Fm', group: 0, period: 7, weight: 257, density: 0 }
      md: { name: 'Mendelevium', atomic_number: 101, symbol: 'Md', group: 0, period: 7, weight: 258, density: 0 }
      no: { name: 'Nobelium', atomic_number: 102, symbol: 'No', group: 0, period: 7, weight: 259, density: 0 }
      lr: { name: 'Lawrencium', atomic_number: 103, symbol: 'Lr', group: 3, period: 7, weight: 262, density: 0 }
      rf: { name: 'Rutherfordium', atomic_number: 104, symbol: 'Rf', group: 4, period: 7, weight: 267, density: 0 }
      db: { name: 'Dubnium', atomic_number: 105, symbol: 'Db', group: 5, period: 7, weight: 268, density: 0 }
      sg: { name: 'Seaborgium', atomic_number: 106, symbol: 'Sg', group: 6, period: 7, weight: 269, density: 0 }
      bh: { name: 'Bohrium', atomic_number: 107, symbol: 'Bh', group: 7, period: 7, weight: 270, density: 0 }
      hs: { name: 'Hassium', atomic_number: 108, symbol: 'Hs', group: 8, period: 7, weight: 269, density: 0 }
      mt: { name: 'Meitnerium', atomic_number: 109, symbol: 'Mt', group: 9, period: 7, weight: 278, density: 0 }
      ds: { name: 'Darmstadtium', atomic_number: 110, symbol: 'Ds', group: 10, period: 7, weight: 281, density: 0 }
      rg: { name: 'Roentgenium', atomic_number: 111, symbol: 'Rg', group: 11, period: 7, weight: 281, density: 0 }
      cn: { name: 'Copernicium', atomic_number: 112, symbol: 'Cn', group: 12, period: 7, weight: 285, density: 0 }
      fl: { name: 'Flerovium', atomic_number: 114, symbol: 'Fl', group: 14, period: 7, weight: 289, density: 0 }
      lv: { name: 'Livermorium', atomic_number: 116, symbol: 'Lv', group: 16, period: 7, weight: 293, density: 0 }
      b: { name: 'Boron', atomic_number: 5, symbol: 'B', group: 13, period: 2, weight: 10.81, density: 2.34 }
      c: { name: 'Carbon', atomic_number: 6, symbol: 'C', group: 14, period: 2, weight: 12.011, density: 2.267 }
      n: { name: 'Nitrogen', atomic_number: 7, symbol: 'N', group: 15, period: 2, weight: 14.007, density: 0.0012506 }
      o: { name: 'Oxygen', atomic_number: 8, symbol: 'O', group: 16, period: 2, weight: 15.999, density: 0.001429 }
      f: { name: 'Fluorine', atomic_number: 9, symbol: 'F', group: 17, period: 2, weight: 18.9984032, density: 0.001696 }
      h: { name: 'Hydrogen', atomic_number: 1, symbol: 'H', group: 1, period: 1, weight: 1.008, density: 0.00008988 }
      p: { name: 'Phosphorus', atomic_number: 15, symbol: 'P', group: 15, period: 3, weight: 30.973762, density: 1.82 }
      s: { name: 'Sulfur', atomic_number: 16, symbol: 'S', group: 16, period: 3, weight: 32.06, density: 2.067 }
      k: { name: 'Potassium', atomic_number: 19, symbol: 'K', group: 1, period: 4, weight: 39.0983, density: 0.862 }
      v: { name: 'Vanadium', atomic_number: 23, symbol: 'V', group: 5, period: 4, weight: 50.9415, density: 6.11 }
      y: { name: 'Yttrium', atomic_number: 39, symbol: 'Y', group: 3, period: 5, weight: 88.90585, density: 4.469 }
      i: { name: 'Iodine', atomic_number: 53, symbol: 'I', group: 17, period: 5, weight: 126.90447, density: 4.93 }
      w: { name: 'Tungsten', atomic_number: 74, symbol: 'W', group: 6, period: 6, weight: 183.84, density: 19.25 }
      u: { name: 'Uranium', atomic_number: 92, symbol: 'U', group: 0, period: 7, weight: 238.02891, density: 18.95 }

    initialize = (options) ->

      if options?.style? and not options.style in styles
        options.style = null

      # Merge default settings with options.
      settings = $.extend settings, options

      # Set up objects list
      for key, value of periodic_table
        symbols.push value.symbol

      regex_string = "(" + ( symbols.join "|" ) + ")"

      exp_settings = "g"
      exp_settings += "i" if not settings.matchCase

      regex = new RegExp regex_string, exp_settings


    # Simple logger.
    log = (msg) ->
      console?.log msg if settings.debug

    initialize options

    log "Elementize => Match case: #{settings.matchCase}"
    log "Elementize => Match initial: #{settings.matchInitial}"
    log "Elementize => Symbols: #{symbols}"

    elementGroupsForPeriodAndGroup = (period, group) ->
      groups = []

      if period == 7 and group in [9, 10, 11, 13, 14, 15, 16, 17, 18]
        groups.push "unknown-chemical-properties"

      else if group == 1 and period in [2, 3, 4, 5, 6, 7]
        groups.push "alkali-metal"
        groups.push "metal"

      else if group == 2 and period in [2, 3, 4, 5, 6, 7]
        groups.push "alkaline-earth-metal"
        groups.push "metal"

      else if (group == 0 and period in [6, 7]) or (group == 3 and period == 6)
        groups.push "metal"
        groups.push "inner-transition-metal"
        g = "actinide"
        g = "lanthanide" if period == 6
        groups.push g

      else if (period in [4, 5, 6, 7] and group in [4, 5, 6, 7, 8, 9, 10, 11, 12]) or (group == 3 and period in [4, 5])
        groups.push "metal"
        groups.push "transition-metal"

      else if (period == 3 and group == 13) or (period in [4, 5] and group in [13, 14]) or (period == 5 and group == 15) or (period == 6 and group in [13, 14, 15, 16])
        groups.push "metal"
        groups.push "post-transition-metal"

      else if (period == 2 and group == 13) or (group == 14 and period in [3, 4]) or (group == 15 and period in [4, 5]) or (period == 5 and group == 16)
        groups.push "metalloid"

      else if (period == 1 and group == 1) or (period == 2 and group in [14, 15, 16]) or (period == 3 and group in [15, 16]) or (period == 4 and group == 16)
        groups.push "nonmetal"
        groups.push "other-nonmetal"

      else if group == 17 and period in [2, 3, 4, 5, 6]
        groups.push "nonmetal"
        groups.push "halogen"

      else if group == 18 and period in [1, 2, 3, 4, 5, 6]
        groups.push "nonmetal"
        groups.push "noble-gas"

      return groups


    getTextNodesIn = (node, includeWhitespaceNodes) ->
      textNodes = []
      whitespace = /^\s*$/

      getTextNodes = (node) =>
        if node.nodeType == (Node?.TEXT_NODE or 3)
          if includeWhitespaceNodes or !whitespace.test node.nodeValue
            textNodes.push node
        else
          for nidx, childNode of node.childNodes
            getTextNodes childNode

      getTextNodes node
      return textNodes


    elementMarkup = (element) ->
      wrapper = document.createElement "div"
      wrapper.appendChild element
      return wrapper.innerHTML

    replaceCallback = (match, contents, offset, s) ->

      symbol = match.toLowerCase()
      element_data = periodic_table[symbol]

      classes = elementGroupsForPeriodAndGroup element_data.period, element_data.group

      if settings.displayAtomicNumber
        classes.push "display-atomic-number"
      if settings.displayAtomicWeight
        classes.push "display-atomic-weight"

      class_list = "elementize-element group-#{element_data.group} period-#{element_data.period} element-#{element_data.atomic_number}"
      class_list += " " + classes.join(" ")

      # Wrapper element
      wrap = document.createElement "span"
      wrap.setAttribute "class", class_list
      # Symbol element
      symbol = document.createElement "span"
      symbol.innerText = element_data.symbol
      symbol.setAttribute "class", "symbol"

      atomic_number = element_data.atomic_number
      atomic_weight = element_data.weight.toFixed(1)

      # Number attribute / element
      if settings.noPseudoElements
        number = document.createElement "span"
        number.innerText = atomic_number
        number.setAttribute "class", "number"
        wrap.appendChild number

        weight = document.createElement "span"
        weight.innerText = atomic_weight
        weight.setAttribute "class", "weight"
        wrap.appendChild weight
      else
        wrap.setAttribute "data-number", atomic_number
        wrap.setAttribute "data-weight", atomic_weight

      wrap.appendChild symbol

      return elementMarkup wrap

    # _Insert magic here._
    return @each ()->

      doneClass = "elementized"
      if not $(this).hasClass(doneClass)

        text_nodes = getTextNodesIn this, false

        log text_nodes

        $(text_nodes).each( () ->
          text_node = this

          content = text_node.data
          content = content.replace regex, replaceCallback

          if content != text_node.data

            replacement = document.createElement "span"
            replacement.innerHTML = content

            parent = text_node.parentNode

            log parent
            parent.replaceChild replacement, text_node
        )

        $(this).addClass doneClass
        $(this).addClass "style-#{settings.style}"

        # content = content.replace regex, replaceCallback
        # $(this).html content




