# vim-react-snippets

Taken from:
[mlaursen/vim-react-snippets README.md](https://github.com/mlaursen/vim-react-snippets/blob/main/README.md)


A collection of common Javascript and Typescript vim snippets for developing
[React] applications. The snippets within this repo rely on [LuaSnip] or
[UltiSnips] as the snippet provider.


## Cheatsheet

Most of the available snippets will be listed below to showcase the generated
code. Tabstops will be indicated with `$TABSTOP` or `$NAME` where `$NAME` is
replaceable. `$CFN` or `$CFN_` will indicate a snippet that uses the current
file name to generate the code.

Some snippets support an "inline" version as where the `const whatever =` will
be omitted. These snippets will be marked with ✨.

> Javascript snippets are not shown since I really only use Typescript now, but
> they are generally the same without the type definitions included.


### Function Components

#### Function Component Export

`fce` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export function $CFN(props: Readonly<$CFN_Props>): ReactElement {
  return <></>
}
```

#### Function Component Default Export

`fcde` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export default function $CFN(props: Readonly<$CFN_Props>): ReactElement {
  return <></>
}
```

#### Simple Function Component Export

`sfce` ->

```tsx
import { type ReactElement } from "react"

export function $CFN(): ReactElement {
  return <></>
}
```

#### Simple Function Component Default Export

`sfcde` ->

```tsx
import { type ReactElement } from "react"

export default function $CFN(): ReactElement {
  return <></>
}
```

#### Forwarded Function Component Export

`ffce` ->

```tsx
import { forwardRef, type ReactNode } from "react"

export interface $CFNProps {
  $TABSTOP
  children: ReactNode
}

export const $CFN = forwardRef<HTML$TABSTOPElement, Readonly<$CFN_Props>>(
  function $CFN(props, ref) {
    return <div ref={ref}></div>
  }
)
```

#### Forwarded Function Component Default Export

`ffcde` ->

```tsx
import { forwardRef, type ReactNode } from "react"

export interface $CFNProps {
  $TABSTOP
  children: ReactNode
}

export default forwardRef<HTML$TABSTOPElement, Readonly<$CFN_Props>>(
  function $CFN(props, ref) {
    return <div ref={ref}></div>
  }
)
```

### Server Components

#### Server Component Export

`sce` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export function $CFN(props: Readonly<$CFN_Props>): Promise<ReactElement> {
  return <></>
}
```

#### Server Component Default Export

`scde` ->

```tsx
import { type ReactElement, type ReactNode } from "react"

export interface $CFN_Props {
  $TABSTOP
  children: ReactNode
}

export default function $CFN(
  props: Readonly<$CFN_Props>
): Promise<ReactElement> {
  return <></>
}
```

#### Simple Server Component Export

`sfce` ->

```tsx
import { type ReactElement } from "react"

export function $CFN(): Promise<ReactElement> {
  return <></>
}
```

#### Simple Server Component Default Export

`sscde` ->

```tsx
import { type ReactElement } from "react"

export default function $CFN(): Promise<ReactElement> {
  return <></>
}
```

### Hooks and Effects

#### useState

`useS` ->

```ts
const [$STATE, set$STATE] = useState$TABSTOP($TABSTOP)
```

#### useReducer

`useRed` ->

```tsx
const [$STATE, $DISPATCH] = useReducer(function reducer(state: $STATE, action: $ACTION): $STATE {
  switch (action.type):
    default:
      return state
}, $INITIAL_STATE)
```

#### useEffect

`useE` ->

```ts
useEffect(() => {
  $TABSTOP
}, [])
```

#### useContext ✨

`useC` ->

```ts
const context = useContext($TABSTOP)
```

#### useCallback ✨

`useCB` ->

<!-- prettier-ignore -->
```ts
const $CALLBACK = useCallback(($TABSTOP) => {
  $TABSTOP
}, [])
```

#### useMemo ✨

`useM` ->

<!-- prettier-ignore -->
```ts
const $MEMOIZED = useMemo(() => ({
  $TABSTOP
}), [])
```

#### useMemo return (manual return required) ✨

`useMR` ->

<!-- prettier-ignore -->
```ts
const $MEMOIZED = useMemo(() => {
  $TABSTOP
}, [])
```

#### useRef ✨

`useR` ->

```ts
const $REF = useRef$TABSTOP(TABSTOP)
```

#### Create Context Provider

`ccp` ->

```tsx
import { createContext, useContext } from "react"

export interface $CFN_Context {}

const context = createContext<$CFN_Context | null>(null)
const { Provider } = context

export function use$CFN_Context(): $CFN_Context {
  const value = useContext(context)
  if (!value) {
    throw new Error("$CFN_Context must be initialized.")
  }

  return value
}
```

### Redux

#### useAppDispatch ✨

`useD` ->

```ts
const dispatch = useAppDispatch()
```

#### useSelector ✨

`useSL` ->

```ts
const $VALUE = useSelector(($STATE: AppState) => $SELECTOR)
```

#### useAppSelector ✨

`useAS` ->

```ts
const $VALUE = useAppSelector($STATE)
```

### Common

#### Destructured Const

`dc` ->

```ts
const { $TABSTOP } = $PROPS
```

```ts
dcuseSomeHook()
 ^ trigger completion here

const { $TABSTOP } = useSomeHook()
```

#### Export Destructured Const

`edc` ->

```ts
const { $TABSTOP } = $PROPS
```

#### if

`if` ->

```ts
if ($CONDITION) {
  $TABSTOP
}
```

#### else

`else` ->

```ts
else $TABSTOP{
  $TABSTOP
}
```

The `if` snippet can be triggered from the first tabstop to generate:

```ts
else if{
  $TABSTOP
}
```

into:

```ts
else if ($CONDITION) {
  $TABSTOP
}
```

#### switch

`switch` ->

```ts
switch ($KEY) {
  case $VALUE:
    $TABSTOP
    break
  default:
    $TABSTOP
}
```

#### for loop

`for` ->

```ts
for (let $I = $0, $I < $LIST.length; $I++) {
  const $ITEM = $LIST[$I]
  $TABSTOP
}
```

#### reduce

`reduce` ->

```ts
const $VALUE = $LIST.reduce<$TYPE_DEF>(($result, $item) => {
  $TABSTOP
  return $RESULT
}, $INITIAL)
```

#### noop

`noop` ->

```ts
const noop = (): void => {
  // do nothing
}
```

#### interface

`intf` ->

```ts
export interface $CFN_$TABSTOP {
  $TABSTOP
}
```

#### T generic

`<T` -> `<E $EXTENDS $TABSTOP>`

#### E extends HTMLElement

`<E` -> `<E extends HTMLElement = $HTMLElement>`

### JSDoc/TSDoc

#### Block Comment

`/**` ->

```ts
/**
 * $TABSTOP
 */
```

#### @example

`@e` ->

```ts
@example $EXAMPLE_NAME
\`\`\`$TSX
$TABSTOP
\`\`\`
```

#### @defaultValue

`@d` ->

```ts
@defaultValue \`$TABSTOP\`
```

#### @since

`@s` ->

```ts
@since $MAJOR.$MINOR.$PATCH
```

### Logging

| Shortcut | Nane                   | Expands to                              |
| -------- | ---------------------- | --------------------------------------- |
| `cl`     | Console Log            | `console.log($TABSTOP)`                 |
| `clv`    | Console Log Variable   | `console.log("$TABSTOP: ", $TABSTOP)`   |
| `ce`     | Console Error          | `console.error($TABSTOP)`               |
| `cev`    | Console Error Variable | `console.error("$TABSTOP: ", $TABSTOP)` |
| `cw`     | Console Warn           | `console.warn($TABSTOP)`                |
| `cwv`    | Console Warn Variable  | `console.warn("$TABSTOP: ", $TABSTOP)`  |
| `ct`     | Console Table          | `console.table($TABSTOP)`               |
| `cd`     | Console Debug          | `console.debug($TABSTOP)`               |
| `cdv`    | Console Debug Variable | `console.debug("$TABSTOP: ", $TABSTOP)` |

> Note: The logging commands that end in a `v` will have the cursor at the
> second `$TABSTOP` instead of the first so that autocompletion will work.

### Importing

| Shortcut | Name                 | Expands to                                       |
| -------- | -------------------- | ------------------------------------------------ |
| `imp`    | Import               | `import packageName from "package-name"`         |
| `impf`   | Import File          | `import File from "./File"`                      |
| `impd`   | Import Destructured  | `import { destructured } from "package-or/path"` |
| `impp`   | Import (Please?)     | `import "./file"`                                |
| `icn`    | Import Classnames    | `import cn from "classnames"`                    |
| `icnb`   | Import Cnbuilder     | `import { cnb } from "cnbuilder"`                |
| `ism`    | Import Styles Module | `import styles from "./$CFN.module.scss"`        |

### Exporting

| Shortcut | Name                | Expands to                              |
| -------- | ------------------- | --------------------------------------- |
| `exp`    | Export              | `export { default } from "./$CFN"`      |
| `expf`   | Export File         | `export $TABSTOP from "./$TABSTOP"`     |
| `expd`   | Export Destructured | `export { $TABSTOP } from "./$TABSTOP"` |
| `expa`   | Export All          | `export * from "$TABSTOP"`              |

### NODE_ENV

| Shortcut | Expands to                              |
| -------- | --------------------------------------- |
| `dev`    | `process.env.NODE_ENV !== "production"` |
| `prod`   | `process.env.NODE_ENV === "production"` |

### Tests

#### Describe a test

`desc` ->

```ts
describe('$CFN', () => {
  it('should $TABSTOP', () => {
    $TABSTOP
  )}
})
```

#### it should

`it` ->

```ts
it("should $TABSTOP", () => {
  $TABSTOP
})
```

#### it should (async)

`ita` ->

```ts
it("should $TABSTOP", async () => {
  $TABSTOP
})
```

#### Test Expect

| Shortcut | Name                | Expands to                                         |
| -------- | ------------------- | -------------------------------------------------- |
| `es`     | Expect Snapshot     | `expect(${container}).toMatchSnapshot()`           |
| `ett`    | Expect To Throw     | `expect(() => $TABSTOP).toThrow()`                 |
| `entt`   | Expect Not To Throw | `expect(() => $TABSTOP).not.toThrow()`             |
| `enc`    | Expect Not Called   | `expect($TABSTOP).not.toHaveBeenCalled()`          |
| `ecw`    | Expect Called With  | `expect($TABSTOP).toHaveBeenCalledWith($TABSTOP)`  |
| `ect`    | Expect Called Times | `expect($TABSTOP).toHaveBeenCalledTimes($TABSTOP)` |

#### Test Queries ✨

| Shortcut | Name                          | Expands to                                                                    |
| -------- | ----------------------------- | ----------------------------------------------------------------------------- |
| `sgbr`   | Screen Get By Role            | `const $TABSTOP = screen.getByRole("${button}", { name: "$TABSTOP" })`        |
| `sgbru`  | Screen Get By Role (Unnamed)  | `const $TABSTOP = screen.getByRole("${progressbar}")`                         |
| `sgbi`   | Screen Get By testId          | `const $TABSTOP = screen.getByTestId("$TABSTOP")`                             |
| `sgbt`   | Screen Get By Text            | `const $TABSTOP = screen.getByText("$TABSTOP")`                               |
| `sgbl`   | Screen Get By Label Text      | `const $TABSTOP = screen.getByLabelText("$TABSTOP")`                          |
| `sfbr`   | Screen Find By Role           | `const $TABSTOP = await screen.findByRole("${button}", { name: "$TABSTOP" })` |
| `sfbru`  | Screen Find By Role (Unnamed) | `const $TABSTOP = await screen.findByRole("${progressbar}")`                  |
| `fbi`    | Screen Find By testId         | `const $TABSTOP = await screen.findByTestId("$TABSTOP")`                      |
| `fbt`    | Screen Find By Text           | `const $TABSTOP = await screen.findByText("$TABSTOP")`                        |
| `fbl`    | Screen Find By Label Text     | `const $TABSTOP = await screen.findByLabelText("$TABSTOP")`                   |
| `gbr`    | Get By Role                   | `const $TABSTOP = getByRole("${button}", { name: "$TABSTOP" })`               |
| `gbru`   | Get By Role (Unnamed)         | `const $TABSTOP = getByRole("${progressbar}")`                                |
| `gbi`    | Get By testId                 | `const $TABSTOP = getByTestId("$TABSTOP")`                                    |
| `gbt`    | Get By Text                   | `const $TABSTOP = getByText("$TABSTOP")`                                      |
| `fbr`    | Find By Role                  | `const $TABSTOP = await findByRole("${button}", { name: "$TABSTOP" })`        |
| `fbru`   | Find By Role (Unnamed)        | `const $TABSTOP = await findByRole("${progressbar}")`                         |
| `fbi`    | Find By testId                | `const $TABSTOP = await findByTestId("$TABSTOP")`                             |
| `fbt`    | Find By Text                  | `const $TABSTOP = await findByText("$TABSTOP")`                               |

### React Testing

#### React Test File

`rtf` ->

```tsx
import { render, screen, userEvent } from "${@testing-library/react}"

import { $CFN } from "../$CFN"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

#### React Test File (ESM)

`rtfe` ->

```tsx
import { render, screen, userEvent } from "${@testing-library/react}"

import { $CFN } from "../$CFN.js"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

#### Global Test File

`gtf` ->

```tsx
import { describe, expect, it } from "${@jest/globals}"
import { render, screen, userEvent } from "${@testing-library/react}"

import { $CFN } from "../$CFN"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

#### Global Test File (ESM)

`gtfe` ->

```tsx
import { describe, expect, it } from "${@jest/globals}"
import { render, screen, userEvent } from "${@testing-library/react}"

import { $CFN } from "../$CFN.js"

describe("$CFN", () => {
  it("should $TABSTOP", () => {
    $TABSTOP
  })
})
```

#### User Event Test

`uet` ->

```tsx
it("should $TABSTOP", async () => {
  const user = userEvent.setup()
  $TABSTOP

  expect(true).toBe(true)
})
```

#### waitFor

`wf` ->

```tsx
await waitFor(() => {
  $TABSTOP
})
```

## SCSS Snippets

| Shortcut | Name                 | Expands to                                          |
| -------- | -------------------- | --------------------------------------------------- |
| `use`    | Use                  | `@use "$TABSTOP";`                                  |
| `use*`   | Use \*               | `@use "$TABSTOP" as *;`                             |
| `for`    | Forward              | `@forward "$TABSTOP" with ($TABSTOP);`              |
| `pcs`    | Prefers Color Scheme | `@media (prefers-color-scheme: $DARK) { $TABSTOP }` |

## Contributing

### LuaSnip Template

```lua
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key
```

[react]: https://reactjs.org/
[ultisnips]: https://github.com/SirVer/ultisnips
[ultisnips folder]: https://github.com/mlaursen/vim-react-snippets/tree/main/UltiSnips
[luasnip]: https://github.com/L3MON4D3/LuaSnip
[lazy.nvim]: https://github.com/folke/lazy.nvim
