# Description

Application to test [active_attr] **Ruby** gem features.

[![Build Status](https://travis-ci.org/jatap/test-ror-active_attr.png)](https://travis-ci.org/jatap/test-ror-active_attr)

### Version

[active_attr] `~> 0.8.2`

### Personal assessments

> Nice library to handle common *model behaviours*.

| Rating   | Documentation | Usability |
| :-------:|:-------------:|:---------:|
| 8        | 8             | 10        |

### Wishlist

- [ ] handle associations.
- [ ] create a model, similar to BaseModel, with all goodies included.

### Notes

When testing **MassAssignment** module, be careful including new related instances inside *before* and *let* blocks. Is better to add this new instances into a `in` block.

## Author
This source code is written by [Julio Antúnez Tarín].

[Julio Antúnez Tarín]: http://twitter.com/jatap
[ruby]: https://www.ruby-lang.org/
[active_attr]: https://github.com/cgriego/active_attr

## Documentation lookup

fastri is unmaintained (last release 2008) and depends on the old RI API
(`rdoc/ri/ri_paths`, `ri_cache`) that RDoc removed, so its `fri`, `qri`,
`fastri-server` and `ri-emacs` executables no longer load; no maintained fork
exists, so it is no longer a dependency. Use plain `ri` instead (`ri
String#upcase`, or `ri -i` for interactive lookup); Emacs users can point
yari.el at `ri`. `yard server` is available for browsing the API docs.
