(setq keywords (list "and" "or" "not" "equal" "less" "nil" "list" "append" "concat" "set" "deffun" "for" "if" "exit" "load" "disp" "true" "false"))
(setq kw_words (list "KW_AND" "KW_OR" "KW_NOT" "KW_EQUAL" "KW_LESS" "KW_NIL" "KW_LIST" "KW_APPEND" "KW_CONCAT" "KW_SET" "KW_DEFFUN" "KW_FOR" "KW_IF" "KW_EXIT" "KW_LOAD" "KW_DISP" "KW_TRUE" "KW_FALSE"))
(setf operators (list "+" "-" "/" "*"  "(" ")" "**" "\"" "\"" ","))
(setf op_operators (list "OP_PLUS" "OP_MINUS" "OP_DIV" "OP_MULT" "OP_OP" "OP_CP" "OP_DBLMULT" "OP_OC" "OP_CC" "OP_COMMA"))
(setq flag 0)


(defun read_file (file_name)
  (with-open-file (stream file_name)
    (loop for line = (read-line stream nil)
          while line do (tokenize (my-split line))))
)

; splitting strings/file is from stackoverflow.com
(defun my-split (string)
  (let ((delimiter-chars " \t\n,()"))
    (loop :for token :from (scan-token string delimiter-chars)
          :while token
          :collect token)))

(defun scan-token (string delimiter-chars)
  (loop :with start = nil
        :for i :from 0 :below (length string)
        :for c = (aref string i)
        :until (find c delimiter-chars)
        :do (if (not start) (setf start i))
        :finally (if start
                    (return (subseq string start (if (null c) (length string) i))))))

(defun my-split (string)
  (loop :for beg = (position-if-not #'delimiterp string)
        :then (position-if-not #'delimiterp string :start (1+ end))
       :for end = (and beg (position-if #'delimiterp string :start beg))
        :when beg :collect (subseq string beg end)
       :while end))

(defun delimiterp (c) (or (char= c #\Space) (char= c #\,)))


(defun tokenize (flist)
  (setq flag 0)
  (dolist (i flist)
    (isComment i)
    (if (not (= flag -3))
        (progn
          (isOperator i)
          (if (= flag -1)
              (isValueOrKeyword i))))
    )
)

(defun isKeyword (word)
  (dolist (i keywords)
    (if (equal word i)
        (write-line (nth (position i keywords) kw_words))
        (setq flag -1))
    )
)

(defun isValue (word)
  (setq temp2 0)
  (dotimes (n (length word))
    (if (= temp2 0)
        (if (and (char> (char word n) #\.) (char< (char word n) #\:))
            (setq temp2 1)
            (setq temp2 -1)))
    )
  (if (= temp2 1)
      (write-line "VALUEF")
      (setq flag -1))
)

(defun isComment (word)
  (if (>= (length word) 2)
      (if (string= (subseq word 0 2) ";;")
          (progn
            (write-line "COMMENT")
            (setq flag -3)))))


(defun isOperator (word)
  (loop :for c :across word
        :do (loop :for op :in operators
                 :until (char= c (char op 0))
                 :finally (if (char= c (char op 0))
                             (progn
                               (write-line (nth (position op operators) op_operators))
                               (setq flag -1))))))

(defun isValueOrKeyword (word)
	(dolist (i operators)
		(setq word(remove (char i 0)  word))
	)
	(if (= flag -1)(isValue word))
	(if (= flag -1)(isKeyword word))
	(if (= flag -1)(write-line "IDENTIFIER"))
)


(defun gppinterpreter()
	(write-line "Enter a file name: (Or enter 0 to write yourself)")
	(defvar input(read-line))
	(if (equal input "0")(getinput)(read_file input))
)

(defun getinput ()
	(defvar value(read-line))
	(setq flist(my-split value))
	(tokenize flist)
)

(gppinterpreter) 
