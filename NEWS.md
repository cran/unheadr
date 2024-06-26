# unheadr 

# unheadr 0.1.0

* Added a `NEWS.md` file to track changes to the package.
* Added a `.slice_groups` argument to `unbreak_vals` to either keep or discard the variable with broken values and slice the extra rows afterwards. 

* Reworded all the documentation with more adequate terms (i.e. embedded subheaders).

# unheadr 0.1.1
* Added more tests, spreadsheet-related functions, and better documentation.

# unheadr 0.2.0
* Cleanup and preparation for release.

# unheadr 0.2.1
* Minor patch to address breaking changes planned for `tibble`. 

# unheadr 0.2.2
* Adds `annotate_mf_all()` function to translate meaningful formatting for all cells in a spreadsheet.
* Adds `regex_valign()` function for aligning character strings with one element for each line.

# unheadr 0.3.0
* Adds `mash_colnames` to make many header rows into column names.
* Drops leading dot notation from `unbreak_vals` _slice/__groups_ argument and ultimately deprecates the argument.
* Two datasets added for teaching and demonstration purposes.

# unheadr 0.3.1
* More informative warning messages for `mash_colnames`
* Re-converted character columns in new datasets.

# unheadr 0.3.2

* Fixed issue in `mash_colnames` that broke output when separator was not an underscore.
* Improve wording in documentation for unbreaking trailing halves of broken values.

# unheadr 0.3.3

* Documentation fix for HTML5 checks

# unheadr 0.4.0

* Add function for cleaning line breaks

* Update non standard evaluation in most functions

* Replace deprecated mutate operations
