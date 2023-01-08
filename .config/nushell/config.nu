# Nushell Config File

# for more information on themes see
# https://www.nushell.sh/book/coloring_and_theming.html
let dark_theme = {
    # color for nushell primitives
    separator: white
    leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
    header: green_bold
    empty: blue
    bool: white
    int: white
    filesize: white
    duration: white
    date: white
    range: white
    float: white
    string: white
    nothing: white
    binary: white
    cellpath: white
    row_index: green_bold
    record: white
    list: white
    block: white
    hints: dark_gray

    # shapes are used to change the cli syntax highlighting
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_binary: purple_bold
    shape_bool: light_cyan
    shape_int: purple_bold
    shape_float: purple_bold
    shape_range: yellow_bold
    shape_internalcall: cyan_bold
    shape_external: cyan
    shape_externalarg: green_bold
    shape_literal: blue
    shape_operator: yellow
    shape_signature: green_bold
    shape_string: green
    shape_string_interpolation: cyan_bold
    shape_datetime: cyan_bold
    shape_list: cyan_bold
    shape_table: blue_bold
    shape_record: cyan_bold
    shape_block: blue_bold
    shape_filepath: cyan
    shape_globpattern: cyan_bold
    shape_variable: purple
    shape_flag: blue_bold
    shape_custom: green
    shape_nothing: light_cyan
}

# The default config record. This is where much of your global configuration is setup.
let-env config = {
  show_banner: false # true or false to enable or disable the banner
  color_config: $dark_theme   # if you want a light theme, replace `$dark_theme` to `$light_theme`
  use_grid_icons: true
  footer_mode: "25" # always, never, number_of_rows, auto
  float_precision: 2
  use_ansi_coloring: true
  shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue

  ls: {
    use_ls_colors: true
    clickable_links: false
  } 
  filesize: {
    metric: true
    format: "auto"
  }
  rm: {
    always_trash: false
  }
  history: {
    file_format: "plaintext"
    max_size: 10000 # Session has to be reloaded for this to take effect
    sync_on_enter: true
  }
  cd: {
    abbreviations: true # set to true to allow you to do things like cd s/o/f and nushell expand it to cd some/other/folder
  }
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "prefix"
    external: {
      enable: true
      max_results: 100
      completer: null
    }
  }
  table: {
    mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
    index_mode: never
    trim: {
      methodology: wrapping, # truncating
      # A strategy which will be used by 'wrapping' methodology
      wrapping_try_keep_words: true,
      # A suffix which will be used with 'truncating' methodology
      truncating_suffix: "..."
    }
  }

  hooks: {
    pre_prompt: [{
      $nothing  # replace with source code to run before the prompt is shown
    }]
    pre_execution: [{
      $nothing  # replace with source code to run before the repl input is run
    }]
    env_change: {
      PWD: [{|before, after|
        $nothing  # replace with source code to run if the PWD environment is different since the last repl input
      }]
    }
  }
  menus: [
      # Configuration for default nushell menus
      # Note the lack of souce parameter
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
      }
      # Example of extra menus created using a nushell source
      # Use the source field to create a list of records that populates
      # the menu
      {
        name: commands_menu
        only_buffer_difference: false
        marker: "# "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where command =~ $buffer
            | each { |it| {value: $it.command description: $it.usage} }
        }
      }
      {
        name: vars_menu
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.vars
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }
      {
        name: commands_with_description
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: green
            selected_text: green_reverse
            description_text: yellow
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where command =~ $buffer
            | each { |it| {value: $it.command description: $it.usage} }
        }
      }
  ]
  keybindings: [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: vi_insert # Options: emacs vi_normal vi_insert
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [emacs, vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
      event: { send: menuprevious }
    }
    {
      name: history_menu
      modifier: control
      keycode: char_r
      mode: emacs
      event: { send: menu name: history_menu }
    }
    {
      name: next_page
      modifier: control
      keycode: char_x
      mode: emacs
      event: { send: menupagenext }
    }
    {
      name: undo_or_previous_page
      modifier: control
      keycode: char_z
      mode: emacs
      event: {
        until: [
          { send: menupageprevious }
          { edit: undo }
        ]
       }
    }
    {
      name: yank
      modifier: control
      keycode: char_y
      mode: emacs
      event: {
        until: [
          {edit: pastecutbufferafter}
        ]
      }
    }
    {
      name: unix-line-discard
      modifier: control
      keycode: char_u
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cutfromlinestart}
        ]
      }
    }
    {
      name: kill-line
      modifier: control
      keycode: char_k
      mode: [emacs, vi_normal, vi_insert]
      event: {
        until: [
          {edit: cuttolineend}
        ]
      }
    }
  ]
}


# add to path
let-env PATH = ($env.PATH | append "~/.local/bin")
let-env PATH = ($env.PATH | append "~/.local/share/cargo/bin")

# environment variables
let-env EDITOR = "nvim"

# Make df output a nushell table
def dff [filesystem?: string] {
  # split df output into lines
  let data = if ($filesystem == null) {
    (df | lines)
  } else {
    (df $filesystem | lines)
  }

  # remove the header
  let data = ($data | skip 1)

  # replace multiple spaces with a single space
  let data = ($data | each { |it| echo ($it | tr -s ' ') })

  # parse into a table
  let data = ($data | parse "{filesystem} {size} {used} {available} {use}% {mount_point}" | str trim)

  # into filesize, still out by 1000x though
  let data = ($data | into filesize size used available)

  # fix filesizes
  let data = ($data | update size { |it| $it.size * 1000})
  let data = ($data | update used { |it| $it.used * 1000})
  let data = ($data | update available { |it| $it.available * 1000})

  echo $data
}

# Run a gui/bg process then disown it
def launch [command: string] {
    bash -c $"($command) &> /dev/null & disown"
}

# ghc for github clone
def ghc [repo: string] {
  git clone $"https://github.com/($repo)"
}

# git aliases
alias gd = git diff
alias gs = git status
alias ga = git add
alias gc = git commit -m
alias gpl = git pull
alias gp = git push

# git alias to manage dotfiles
alias dots = git --git-dir=/home/arlo/.cfg --work-tree=/home/arlo

# git aliases for dotfiles
alias ddi = dots diff
alias ds = dots status
alias da = dots add
alias dc = dots commit -m
alias dpl = dots pull
alias dp = dots push

# git alias to manage /etc
alias etc = sudo git --git-dir=/etc/.cfg --work-tree=/etc

# git aliases for etc
alias ei = etc diff
alias es = etc status
alias ea = etc add
alias ec = etc commit -m
alias epl = etc pull
alias ep = etc push

# lazygit aliases
alias lg = lazygit
alias dlg = lazygit -g /home/arlo/.cfg -w /home/arlo
alias elg = lazygit -g /etc/.cfg -w /etc

# generic aliases
alias ls = ls -a

def cl [path?: string] {
  cd $path
  ls
}

# nice colourful output
colorscript -r | dotacat



# The starship prompt https://www.nushell.sh/book/3rdpartyprompts.html#starship

let-env STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = ""
let-env PROMPT_INDICATOR_VI_INSERT = ": "

