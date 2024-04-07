(deftheme dustinos
  "A basic Emacs theme to match 4coder.")

(let (
		(background "#202020")
		(foreground "#A88E70")
		(comment "#656055")
		(keyword "#ED900C")
		(string "#6090A0")
		(link "#ED900C")
		(cursor "#EDB064")
		(mode-line-text "#FFFFFF")
		(mode-line-bg "#AF5F00")
		(mode-line-inactive-text "#CCCCCC")
		(mode-line-inactive-bg "#444444")
	)

	(custom-theme-set-faces
		'dustinos

		`(default ((t (:background ,background :foreground ,foreground))))

		`(font-lock-comment-face ((t (:foreground ,comment))))
		`(font-lock-keyword-face ((t (:foreground ,keyword))))
		`(font-lock-string-face ((t (:foreground ,string))))

		`(cursor ((t (:background ,cursor))))
	)

	(custom-set-faces
		`(link ((t (:foreground ,link :underline t))))

		`(mode-line ((t (:foreground ,mode-line-text :background ,mode-line-bg))))
		`(mode-line-inactive ((t (:foreground ,mode-line-inactive-text :background ,mode-line-inactive-bg))))
	)
)

(provide-theme 'dustinos)
