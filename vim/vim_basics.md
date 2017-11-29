* ^e -> scroll the window down
* ^y -> scroll the window up
* ^f -> scroll down one page
* ^b -> scroll up one page
* H -> move cursor to the top of window
* M -> move cursor to the middle of window
* L -> move cursor to the bottom of window
* gg -> go to top of file
* G -> go to bottom of file
* . (dot) -> repeat the last command


## Text Object and Motions

### Text Objects
* w -> move to begining of next word
* e -> move to end of next word
* b -> move to begining of previous word

### Motions
* a -> all
* i -> in
* t -> till
* f -> find forward
* F -> find backward

#### Examples
* diw -> delete in word
* caw -> change all word (delete and insert mode)
* di" -> delete everything inside double quote (")
* ca" -> change all words


## Additional commands
* dd / yy -> delete/yank a line
* D / C -> delete/change until end of line
* ^ / $ -> move to begining/end of line
* I / A -> insert to begining/end of line
* o / O -> insert new line below/above current line


## Macro (Recording)

### Recording a macro
1. q{register}-> to start 
2. (do things)
3. q-> to stop recording

### Play a macro
* @{register}
