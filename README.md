# Ragel language support in Atom

This package adds syntax highlighting and snippets to [Ragel](http://www.colm.net/open-source/ragel/) files in the [Atom text editor](http://atom.io/).

## Install

Install the package `language-ragel` in Atom (Preferences -> Packages) or using Atom's package manager:

```bash
$ apm install language-ragel
```

## Use

The package has no way of knowing what your host language is, so you must help it in one of the following ways:

*either*  
**a)** Manually choose the correct grammar. Press `Ctrl-Shift-L` and select <code>Ragel in &lt;<i>your host language</i>&gt;</code>.

*or*  
**b)** Use the file extension of your host language as infix. E.g. name your file `my_machine.rb.rl` instead of `my_machine.rl` for Ruby.

## Snip

[List of available snippets](Snippets.md)

## Contribute

If you want to change the grammar, edit the template file `grammar.cson` and run `generate.rb`. Don't edit the files for individual host languages directly.

## Credits

The package is partially based on [this Ragel grammar for TextMate](https://github.com/textmate/ragel.tmbundle).
