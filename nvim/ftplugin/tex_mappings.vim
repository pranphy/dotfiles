" inoremap <buffer> eiop e^{i \omega x}<esc>$a
" inoremap <buffer> snpl \sin\left( \frac{n\pi}{L}x \right)
" inoremap <buffer> lpv \frac{\partial^2 v}{\partial x^2} + \frac{\partial^2 v}{\partial y^2}
" inoremap <buffer> inoo \int\limits_{0}^{1}<esc>$a
" inoremap <buffer> inol \int\limits_{0}^{l}<esc>$a
" inoremap <buffer> inll \int\limits_{-l}^{l}<esc>$a
" inoremap <buffer> inff \int\limits_{-\infty}^{\infty}<esc>$a
" inoremap <buffer> inof \int\limits_{0}^{\infty}<esc>$a
"
inoremap <buffer> __ _{}<left>
inoremap <buffer> ^^ _{}<left>

"inoremap <silent> ( (<C-R>=UltiSnips#Anon(':parenthesis:\`$1\`', '(')<cr>

" abbreviations
iabbrev <buffer> npi n\pi
iabbrev <buffer> 2pi 2\pi



inoremap ppk \phi_{+}(k)

"inoremap <buffer> aln \begin{align*}<esc>o\end{align*}<esc>O

