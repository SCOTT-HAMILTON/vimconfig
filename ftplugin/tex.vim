""" My latex commands

let mapleader = ","

 " Go to place holder character 
nnoremap <Leader>fb /<ßß><CR>cf>
inoremap <Leader>fb <Esc>/<ßß><CR>cf>

 " \section
nnoremap <Leader>s i\section{}<CR><ßß><Esc>k$i
 " \subsection
nnoremap <Leader>Ss i\subsection{}<CR><ßß><Esc>k$i
 " \subsubsection
nnoremap <Leader>SSs i\subsubsection{}<CR><ßß><Esc>k$i
 " \begin
nnoremap <Leader>b i\begin{}<CR><Esc>ddi<ßß><Esc>k$i
 " \begin{abstract}
nnoremap <Leader>a i\begin{abstract}<CR><Esc>ddi
 " \end
nnoremap <Leader>e i\end{}<CR><Esc>ddi<ßß><Esc>k$i

 " \textit
nnoremap <Leader>i A \textit{}<Esc>i
 " \textbf
nnoremap <Leader>B A \textbf{}<Esc>i

 " external commands
function Build()
	AsyncRun pdflatex %<CR>
endfunction
function Darkify()
	exe '!invert_pdf_colors.pl '.expand("%:r").'.pdf '.expand("%:r").'-dark.pdf'
	exe '!rm '.expand("%:r").'.pdf'
	exe '!mv '.expand("%:r").'-dark.pdf '.expand("%:r").'.pdf'
endfunction
function View()
	exe '!evince -f '.expand("%:r").'.pdf &'
endfunction

nnoremap <Leader>m :call Build()<CR>
nnoremap <Leader>d :call Darkify()<CR>
nnoremap <Leader>v :call View()<CR>
