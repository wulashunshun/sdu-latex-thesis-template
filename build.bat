@echo off
setlocal
cd /d "%~dp0"
where xelatex >nul 2>nul || (echo Install TeX Live or MiKTeX first. & pause & exit /b 1)
xelatex -interaction=nonstopmode -halt-on-error main.tex || goto :failed
bibtex main || goto :failed
xelatex -interaction=nonstopmode -halt-on-error main.tex || goto :failed
xelatex -interaction=nonstopmode -halt-on-error main.tex || goto :failed
xelatex -interaction=nonstopmode -halt-on-error main.tex || goto :failed
echo Completed: main.pdf
pause
exit /b 0
:failed
echo Build failed. Read main.log for details.
pause
exit /b 1
