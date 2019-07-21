self: super:
{
  # Completely pin down absolutely everything about emacs on a specific NixPkgs import!
  emacs-nixpkgs-pin = (import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/e295fd81370929a4268e94ba95d86f3f296d610c.tar.gz";
    sha256 = "14ii393b43znn57y16wnad26jpllyhq1ca7g8czs33h199pf3pxb";
  }) {}).pkgs;

  spacemacs = self.emacs-nixpkgs-pin.emacsWithPackages (ep: (with ep.melpaPackages; [
    # there's a bug in the current source of evil-escape that causes it to
    # fail to build. We'll patch it out for now and hope it gets fixed in a
    # future version.
    (ep.evil-escape.overrideAttrs (old: {
      patches = (old.patches or []) ++ [
        (super.fetchpatch {
          url = https://github.com/BrianHicks/evil-escape/commit/b548e8450570a0c8dea47b47221b728c047a9baf.patch;
          sha256 = "1a2qrf4bpj7wm84qa3haqdg3pd9d8nh5vrj8v1sc0j1a9jifsbf6";
        })
      ];
    }))

    # company-ghci
    # company-rtags  # Marked as broken
    # cpp-auto-include
    # devdocs
    # evil-textobj-line
    # evil-unimpaired  # TODO: Not packaged
    # flycheck-package
    # flycheck-rtags  # Marked as broken
    # flycheck-rust  # Marked as broken
    # helm-rtags  # Marked as broken
    # intero
    # nodejs-repl
    # org-cliplink
    # racer
    # rubocopfmt
    # symbol-overlay

    ac-ispell
    ace-jump-helm-line
    ace-link
    ace-window
    adoc-mode
    aggressive-indent
    alert
    all-the-icons
    anaconda-mode
    ansible
    ansible-doc
    anzu
    async
    auto-compile
    auto-complete
    auto-dictionary
    auto-highlight-symbol
    auto-yasnippet
    autothemer
    avy
    bind-key
    bind-map
    blacken
    browse-at-remote
    bundler
    cargo
    centered-cursor-mode
    chruby
    clang-format
    clean-aindent-mode
    cmm-mode
    column-enforce-mode
    company
    company-anaconda
    company-ansible
    company-c-headers
    company-cabal
    company-emacs-eclim
    company-ghc
    company-go
    company-lua
    company-nixos-options
    company-php
    company-plsense
    company-quickhelp
    company-restclient
    company-shell
    company-statistics
    company-tern
    company-terraform
    company-web
    concurrent
    confluence
    copy-as-format
    counsel
    counsel-gtags
    counsel-projectile
    ctable
    cython-mode
    dactyl-mode
    dante
    dash
    dash-functional
    deferred
    define-word
    diff-hl
    diminish
    disaster
    docker
    docker-tramp
    dockerfile-mode
    doom-modeline
    dotenv-mode
    dumb-jump
    eclim
    editorconfig
    eldoc-eval
    elisp-slime-nav
    emmet-mode
    engine-mode
    ensime
    ep.csv-mode
    ep.font-lock-plus
    ep.mmm-mode
    ep.orgPackages.org
    ep.orgPackages.org-plus-contrib
    ep.rtags
    ep.sql-indent
    ep.undo-tree
    epc
    epl
    esh-help
    eshell-prompt-extras
    eshell-z
    eval-sexp-fu
    evil
    evil-anzu
    evil-args
    evil-cleverparens
    evil-ediff
    evil-exchange
    evil-goggles
    evil-iedit-state
    evil-indent-plus
    evil-ledger
    evil-lion
    evil-lisp-state
    evil-magit
    evil-matchit
    evil-mc
    evil-nerd-commenter
    evil-numbers
    evil-org
    evil-surround
    evil-tutor
    evil-visual-mark-mode
    evil-visualstar
    expand-region
    eyebrowse
    f
    fancy-battery
    fill-column-indicator
    fish-mode
    flx
    flx-ido
    flycheck
    flycheck-bashate
    flycheck-haskell
    flycheck-ledger
    flycheck-pos-tip
    flyspell-correct
    flyspell-correct-helm
    fringe-helper
    fuzzy
    ggtags
    gh-md
    ghc
    git-commit
    git-gutter
    git-gutter-fringe
    git-gutter-fringe-plus
    git-gutter-plus
    git-link
    git-messenger
    git-timemachine
    gitattributes-mode
    gitconfig-mode
    gitignore-mode
    gitignore-templates
    gntp
    gnuplot
    go-eldoc
    go-fill-struct
    go-gen-test
    go-guru
    go-impl
    go-mode
    go-rename
    go-tag
    godoctor
    golden-ratio
    google-c-style
    google-translate
    goto-chg
    gradle-mode
    graphviz-dot-mode
    groovy-imports
    groovy-mode
    gruvbox-theme
    haml-mode
    haskell-mode
    haskell-snippets
    hcl-mode
    helm
    helm-ag
    helm-c-yasnippet
    helm-company
    helm-core
    helm-css-scss
    helm-dash
    helm-descbinds
    helm-flx
    helm-git-grep
    helm-gitignore
    helm-gtags
    helm-hoogle
    helm-make
    helm-mode-manager
    helm-nixos-options
    helm-notmuch
    helm-org-rifle
    helm-projectile
    helm-purpose
    helm-pydoc
    helm-swoop
    helm-themes
    helm-xref
    hierarchy
    highlight
    highlight-indentation
    highlight-numbers
    highlight-parentheses
    hindent
    hl-todo
    hlint-refactor
    ht
    htmlize
    hungry-delete
    hydra
    ibuffer-projectile
    iedit
    imenu-list
    impatient-mode
    importmagic
    indent-guide
    inf-ruby
    insert-shebang
    ivy
    jenkins
    jinja2-mode
    js-doc
    js2-mode
    js2-refactor
    json-mode
    json-navigator
    json-reformat
    json-snatcher
    know-your-http-well
    language-detection
    lcr
    ledger-mode
    link-hint
    live-py-mode
    livid-mode
    log4e
    lorem-ipsum
    lsp-haskell
    lsp-mode
    lua-mode
    macrostep
    magit
    magit-gitflow
    magit-popup
    magit-svn
    markdown-mode
    markdown-toc
    markup-faces
    maven-test-mode
    meghanada
    memoize
    minitest
    mmm-jinja2
    move-text
    multi-term
    multiple-cursors
    mvn
    mwim
    nameless
    nginx-mode
    nix-mode
    nix-update
    nixos-options
    notmuch
    ob-http
    ob-restclient
    open-junk-file
    org-bookmark-heading
    org-brain
    org-bullets
    org-category-capture
    org-download
    org-jira
    org-journal
    org-mime
    org-mru-clock
    org-pomodoro
    org-present
    org-projectile
    org-re-reveal
    org-super-agenda
    orgit
    overseer
    ox-gfm
    ox-jira
    ox-pandoc
    ox-twbs
    p4
    package-lint
    packed
    pandoc-mode
    paradox
    paredit
    parent-mode
    password-generator
    pcache
    pcre2el
    persp-mode
    pfuture
    pip-requirements
    pipenv
    pippel
    pkg-info
    popup
    popwin
    pos-tip
    powerline
    prettier-js
    projectile
    pug-mode
    py-isort
    pyenv-mode
    pytest
    pythonic
    pyvenv
    rainbow-delimiters
    rake
    rbenv
    request
    request-deferred
    restart-emacs
    restclient
    restclient-helm
    ripgrep
    robe
    rpm-spec-mode
    rspec-mode
    rubocop
    ruby-hash-syntax
    ruby-refactor
    ruby-test-mode
    ruby-tools
    rvm
    s
    salt-mode
    sass-mode
    sbt-mode
    scala-mode
    scss-mode
    seeing-is-believing
    shell-pop
    shrink-path
    simple-httpd
    skewer-mode
    slim-mode
    smartparens
    smeargle
    solarized-theme
    spaceline
    spaceline-all-the-icons
    string-inflection
    swiper
    symon
    systemd
    tablist
    tagedit
    tern
    terraform-mode
    toc-org
    toml-mode
    treemacs
    treemacs-evil
    treemacs-projectile
    treepy
    unfill
    use-package
    uuidgen
    vi-tilde-fringe
    vimrc-mode
    visual-fill-column
    volatile-highlights
    web-beautify
    web-completion-data
    web-mode
    which-key
    window-purpose
    winum
    with-editor
    writeroom-mode
    ws-butler
    xcscope
    xml-rpc
    xterm-color
    yaml-mode
    yapfify
    yasnippet
    yasnippet-snippets
    zeal-at-point
    ] ++ [
    # Many emacs packages may pull in dependencies on things they need
    # automatically, but for those that don't, here are nix pkgs.

    # Needed by dash-docsets
    self.emacs-nixpkgs-pin.sqlite

    # Needed by the spacemacs haskell layer
    (self.emacs-nixpkgs-pin.haskellPackages.ghcWithPackages (pkgs: [
      pkgs.apply-refact
      pkgs.hasktags
      pkgs.hlint
      pkgs.hoogle
      pkgs.stylish-haskell
      # Market as broken upstream
      # pkgs.ghc-mod
      # pkgs.intero
    ]))
  ]));

  # Minimal set of packages to install everywhere
  minEnv = super.hiPrio (super.buildEnv {
    name = "minEnv";
    paths = [
      self.alacritty
      self.bashInteractive
      self.bat
      self.bc
      self.coreutils
      self.curl
      self.fd
      self.feh
      self.file
      self.fzf
      self.git-crypt
      self.gitAndTools.hub
      self.global
      self.gnused
      self.gnutar
      self.htop
      self.jq
      self.ledger
      self.nox
      self.par
      self.pass
      self.pinentry
      self.procps
      self.ripgrep
      self.rlwrap
      self.spacemacs
      self.tmux
      self.tree
      self.unzip
      self.wget
      self.zsh
    ];
  });

  # For "permanent" systems
  bigEnv = super.hiPrio (super.buildEnv {
    name = "bigEnv";
    paths = [
      self.alsaUtils
      self.aspell
      self.bind
      self.calibre
      self.chromium
      self.cmake
      self.dasht
      self.firefox
      self.gnumake
      self.gnupg
      self.gnutls
      self.graphviz
      self.icu
      self.imagemagick
      self.irssi
      self.lftp
      self.mupdf
      self.nethogs
      self.nixops
      self.pandoc
      self.pdsh
      self.shellcheck
      self.sloc
      self.source-code-pro
      self.thunderbolt
      self.truecrypt
      self.upower
      self.vagrant
      self.vimPlugins.youcompleteme
      self.vim_configurable
      self.vlc
      self.xclip
      self.xsel
      self.youtube-dl
      self.zeal
      self.zlib
    ];
  });

  pyEnv = super.lowPrio (self.python3.withPackages (ps: with ps; [
    isort
    pep8
    setuptools
    yamllint
    yapf
  ]));

  # Use nix-shell -p plaidPy for ledger cred updates
  plaidPy = super.lowPrio (self.python3.withPackages (ps: with ps; [
    plaid-python
    flask
  ]));
}
