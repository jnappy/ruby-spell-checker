## Curriculum Spellchecker

This is a simple ruby script written to spellcheck a folder with markdown files.  

To get it running locally:

- [install MacPorts](https://guide.macports.org/chunked/installing.macports.html)
- [install aspell](https://docs.moodle.org/19/en/Configuring_aspell_on_Mac_OS_X) (`sudo port install aspell` and `sudo port install aspell-dict-en`)
- `gem install 'spellchecker'`
- replace this path with the local path to the directory you would like to spell-check:
    <p align="center">
      <img src="https://i.imgur.com/sWU3fLC.png">
    </p>
- `ruby spell-checker.rb`
