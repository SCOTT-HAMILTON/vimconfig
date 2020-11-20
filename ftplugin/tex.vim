""" My latex commands

let mapleader = ","

 " Go to place holder character 
nn <Leader>dv /<ßß><CR>cf>
ino <Leader>dv <Esc>/<ßß><CR>cf>

 " \section
nn <Leader>s i\section{}<CR><ßß><Esc>k$i
 " \subsection
nn <Leader>Ss i\subsection{}<CR><ßß><Esc>k$i
 " \subsubsection
nn <Leader>SSs i\subsubsection{}<CR><ßß><Esc>k$i
 " \begin
nn <Leader>b i\begin{}<CR><Esc>ddi<ßß><Esc>k$i
 " \begin{abstract}
nn <Leader>a i\begin{abstract}<CR><Esc>ddi
 " \end
nn <Leader>e i\end{}<CR><Esc>ddi<ßß><Esc>k$i

 " \textit
nn <Leader>i A \textit{}<Esc>i
 " \textbf
nn <Leader>B A \textbf{}<Esc>i

 " external commands
function Build()
	w
	cd %:p:h
	exe '!yaml2probatree -l '.shellescape(@%).' > tmp.o && pdflatex tmp.o && mv tmp.pdf '.expand("%:p:r").'.pdf'
endfunction
function BuildShellEscape()
	w
	cd %:p:h
	exe '!pdflatex -shell-escape '.shellescape(@%)
endfunction
function Darkify()
	cd %:p:h
	exe '!invert_pdf_colors.pl "'.expand("%:p:r").'.pdf" "'.expand("%:p:r").'-dark.pdf"'
	exe '!rm "'.expand("%:p:r").'.pdf"'
	exe '!mv "'.expand("%:p:r").'-dark.pdf" "'.expand("%:p:r").'.pdf"'
endfunction
function Deploy()
	cd %:p:h
	exe '!/opt/platform-tools/adb push "'.expand("%:p:r").'.pdf" /storage/sdcard1/Download'
endfunction
function ViewZathura()
	cd %:p:h
	exe '!zathura --mode fullscreen "'.expand("%:p:r").'.pdf" &'
endfunction
function ViewEvince()
	cd %:p:h
	exe '!evince -f "'.expand("%:p:r").'.pdf" &'
endfunction
function Clean()
	cd %:p:h
	exe '!rm *.log'
	exe '!rm *.dvi'
	exe '!rm *.aux'
	exe '!rm -rf auto'
endfunction

nn <Leader>m :call Build()<CR>
nn <Leader>M :call BuildShellEscape()<CR>
nn <Leader>d :call Darkify()<CR>
nn <Leader>D :call Deploy()<CR>
nn <Leader>v :call ViewZathura()<CR>
nn <Leader>V :call ViewEvince()<CR>
nn <leader>c :call Clean()<cr>
