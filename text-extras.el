(defun number-of-chars-in-line-above (&optional position direction-function)
  "Return the number of characters in the line above.  If
optional POSITION is specified, goto that character first.  If
optional DIRECTION-FUNCTION is specified, use that function to
get to the line (instead of the default `previous-line')."
  (save-excursion
    (if position (goto-char position))
    (if (not direction-function) (setq direction-function 'previous-line))
    (funcall direction-function)
    (let (b e)
      (beginning-of-line)
      (setq b (point))
      (end-of-line)
      (setq e (point))
      (- e b))))

(defun insert-same-number-of-chars-as-line-above (char)
  (interactive "kCharacter: ")
  (dotimes (i (number-of-chars-in-line-above)) (insert char)))

(defun as-one-line nil
  (interactive)
  (save-excursion
    (with-temp-buffer
      (yank)
      (goto-char (point-min))
      (fill-paragraph)
      (kill-region (point-min) (point-max)))))

(provide 'text-extras)
