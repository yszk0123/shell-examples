# Prerequisites

- Install [shellcheck](https://github.com/koalaman/shellcheck)

# Development

## Test

`$ ./scripts/test.sh`

## Lint

`$ ./scripts/lint.sh`

# How to use 'test/helpers/assert.sh'

```shell
#!/bin/zsh
. "$(dirname "${BASH_SOURCE:-$0}")/helpers/assert.sh"

<test code>

assert_end
```
