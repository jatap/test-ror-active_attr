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
