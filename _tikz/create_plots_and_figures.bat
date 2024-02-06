::::::::::::
:: Header ::
::::::::::::

title Convert_pdf_to_png

echo Author: Joshua Entrop
echo Date: 2020-11-17

:::::::::::::::
:: Run latex ::
:::::::::::::::

for %%G in (*.tex) do (

  latex -interaction batchmode %%G
  pdflatex -interaction batchmode %%G

)

::::::::::::::::::::::::::::::::::::::::::
:: Convert pdf to png using ghostscript ::
::::::::::::::::::::::::::::::::::::::::::

for %%G in (*.pdf) do (

gswin64c ^
  -o "../pictures/%%~nG.png" ^
  -q ^
  -dQUIET ^
  -dSAFER ^
  -dBATCH ^
  -dNOPAUSE ^
  -dNOPROMPT ^
  -dMaxBitmap=500000000 ^
  -dAlignToPixels=0 ^
  -dGridFitTT=2 ^
  -sDEVICE=pngalpha ^
  -dTextAlphaBits=4 ^
  -dGraphicsAlphaBits=4 ^
  -r600 ^
  "%%~G"
  
)

del *.log
del *.aux
del *.dvi

echo END OF FILE
stop