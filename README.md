# Launch School: RB101 exercises

## Helpful shell scripts
- Create Ruby exercise files:
  - `file_names=('name1', 'name2', ...)`
  - `for name in $file_names; do touch "$name.rb"; done`
- Set frozen_string_literal comment to all Ruby files in current directory:
  - `for f in ./*.rb; do printf '# frozen_string_literal: true\n' > "$f"; done`
  - For advanced functionality, use find: `find ./*.rb -maxdepth 0 -exec bash -c "printf '# frozen_string_literal: true\n' > '{}'" ';'`