## Snippets available in the host language

| prefix  | desription |
|---------|------------|
| %%      | define a full machine |
| %% wd   | write data - puts data needed for the machine here |
| %% wi   | write init - puts machine initialization code here |
| %% we   | write exec - puts machine execution code here |
| fbreak  | fbreak - break out of the execute loop |
| fcall   | fcall - push target state and jump to given entry point |
| fexec   | fexec - set the next character to process |
| fgoto   | fgoto - jump to the given entry point |
| fhold   | fhold - do not advance beyond current char |
| fnext   | fnext - set the next state to be the given entry point |
| fret    | fret - return to the fcall origin |

## Snippets available within Ragel code

| prefix  | desription |
|---------|------------|
| machine | name the machine |
| :=      | instantiate a machine |
| wd      | write data - puts data needed for the machine here |
| wi      | write init - puts machine initialization code here |
| we      | write exec - puts machine execution code here |
| include | include another Ragel file |
| import  | import definitions |
| action  | define an action |