## Code style

### Go tests
- Use a single parent test function (`TestFunc` or `TestType_Method`)
  with `t.Run` subtests; do not split into separate top-level
  `TestFunc_Case` functions.
- Subtest names: `"<verb phrase> when <condition>"`. Use
  `"returns error when ..."` for failure paths, `"panics when ..."`
  for panics. Don't prefix with "successfully" by default — only
  include it if the user does in their request.
- Prefer real components over mocks. For HTTP clients, use
  `httptest.Server` and override the client's base URL.
- Use the project's existing assertion library. If none, prefer
  `gotest.tools/v3/assert`.
- Collapse multiple field-level assertions on the same parent
  struct (e.g. three `assert.Equal` on `obj.A`, `obj.B`, `obj.C`)
  into one `assert.DeepEqual` against the full struct. If the
  type is anonymous, lift it to a local named type. Does NOT apply
  to sparse map lookups (different header/query-param keys).
- Prefer exact-match error assertions (`assert.Error`) over
  substring matches (`assert.ErrorContains`). Only use
  `ErrorContains` when the error message is dynamic (port number,
  random ID, timestamp) or genuinely too long to be worth pinning.
- Subtest ordering: within a TestFunc, put happy/success paths
  first, then group all error cases at the end.
  Within the error group, keep natural flow order (early-stage
  errors before late-stage). Don't interleave success and error
  cases.
- Do not use production code const and var in tests instead
  in the test always write the value of the const/var instead
  Otherwise it can lead to hidden bugs using the const/var
- Ensure that helpers and private package functions are at the
  bottom while public and the "main" facet of that file are file

### Bug fixes
- When fixing a bug, write the failing regression test
  FIRST and confirm it fails on the unfixed code, then
  apply the fix, then re-run the test to confirm it now
  passes. Without seeing the red→green transition, a
  passing test is no proof the bug is exercised. If the
  fix is already in place, write the test and offer to
  briefly revert the fix to demonstrate the regression is
  caught.

### Project conventions
- Always use the project's documented test/build commands
  (e.g. `npm test --` not `npx jest`, `make test` not raw
  `go test ./...`). Check CLAUDE.md, package.json scripts,
  Makefile targets, or README before falling back to
  language-default invocations.
- Never ever use npx to invoke stuff
- Make targets (`make <target>`) and npm scripts (`npm run
  <script>`, `npm test`) are pre-approved — run them freely
  when relevant to the task you're completing, without
  asking for confirmation first.
- For JS/TS linting NEVER use the `npm run lint` script (even
  with `-- [file]`). The script has hardcoded targets
  (`./src ./test ./storybook`), so passing a file just APPENDS
  it — eslint still lints every file and halts my machine.
  Instead invoke the eslint binary directly against only the
  files you changed, e.g.
  `node_modules/.bin/eslint path/to/changed-file.tsx`.
- NEVER run the full jest suite. It is far too large and halts
  my machine. `npm test` is safe because it is scoped to
  `--changedSince origin/master` — leave that scoping intact.
  Do NOT invoke `node_modules/.bin/jest` directly to escape it,
  and do not run broad `--testPathPatterns` sweeps across whole
  directories. Run only the specific test files covering the
  code you changed, e.g.
  `npm test -- --testPathPatterns=transformers/datasets/bar`.
  If you think wider coverage is needed, ask me first.

### Comments
- Don't add comments to source code its not required I can read code
  You should only add comments should I ask for any


## Implementation
- If there are multiple possible implementations, or something I have asked doesn't make sense or can't be done, present a list of possible options to me and ask for my opinion
