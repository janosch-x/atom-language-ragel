#!/usr/bin/env ruby
# rubocop:disable LineLength

# generate host language grammars from template file

TEMPLATE = File.read('grammar.cson')

HOST_LANGS = [
  { name: 'unknown host lang', atom_selector: 'unknown', extensions: %w[rl ragel] },
  { name: 'C',                 atom_selector: 'c',       extensions: %w[h.rl c.rl h.ragel c.ragel] },
  { name: 'C++',               atom_selector: 'cpp',     extensions: %w[cpp.rl cpp.ragel] },
  { name: 'D',                 atom_selector: 'd',       extensions: %w[d.rl d.ragel] },
  { name: 'Go',                atom_selector: 'go',      extensions: %w[go.rl go.ragel] },
  { name: 'Java',              atom_selector: 'java',    extensions: %w[java.rl java.ragel] },
  { name: 'Objective-C',       atom_selector: 'objc',    extensions: %w[m.rl m.ragel] },
  { name: 'Ruby',              atom_selector: 'ruby',    extensions: %w[rb.rl rb.ragel] }
].freeze

HOST_LANGS.each do |lang|
  grammar =
    TEMPLATE
    .gsub('{{HOST_LANG_NAME}}', lang[:name])
    .gsub('{{EXTENSIONS}}', lang[:extensions].map { |e| "'#{e}'" }.join("\n  "))
    .gsub('{{HOST_LANG_SELECTOR}}', lang[:atom_selector])

  filename = "grammars/ragel-in-#{lang[:atom_selector]}.cson"
  File.open(filename, 'w') { |f| f.write(grammar) }
  puts "generated #{filename} for host language '#{lang[:name]}'"
end

# generate snippets documentation

def snippets_md_table(cson_filename)
  table_lines = ['| prefix  | desription |', '|---------|------------|']
  File.read(cson_filename).each_line do |line|
    if /^ +['"]?(?<name>[^:'"]+)['"]?: *$/ =~ line
      table_lines << name
    elsif /^ +['"]?prefix['"]?:\s*(?<_q>['"])(?<prefix>[^'"]+)\k<_q>/ =~ line
      table_lines[-1] = "| #{prefix.ljust(7)} | #{table_lines[-1].ljust(10)} |"
    end
  end
  table_lines.join("\n")
end

snippets_text = [
  "## Snippets available in the host language\n",
  snippets_md_table('snippets/ragel_host_language.cson'),
  "\n## Snippets available within Ragel code\n",
  snippets_md_table('snippets/ragel.cson')
].join("\n")

File.open('Snippets.md', 'w') { |f| f.write(snippets_text) }
