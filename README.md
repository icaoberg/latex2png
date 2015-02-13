# latex2png

## About

The latex2png script is a tool for parsing LaTeX snippets into png images. It comes in three flavors, a shell-script, a perl-script and a Matlab-script. The three scripts perform the same tasks and depending on your needs you will find one or many very useful.

## Disclaimer

I build this in 2008 to help me build

## License


## Prerequisites
All scripts require

* A LaTeX distribution e.g. LaTeX, MikTeX or TeTeX
* dvipng

## Installation

All three scripts require a LaTeX distribution and dvipng. The shell-script will only work in a Linux distribution, e.g. Ubuntu. I have only tested this script in Ubuntu Hardy Heron and in a custom Linux distribution from Carnegie Mellon University (linux.andrew.cmu.edu).

To install tetex (a LaTeX distribution) in Ubuntu type in a terminal

```
sudo apt-get install tetex-base tetex-extra
```

To install dvipng in Ubuntu type in a terminal

```
sudo apt-get install dvipng
```

Comment: In most Linux distributions, you will find LaTeX in /usr/bin/latex and dvipng in /usr/bin/dvipng. If any of these programs is available but not in those defaults folders you may modify the scripts to fit your needs.
latex2png

If you installed a LaTex distribution and dvipng, you are ready to go. Move the script to the location of your choice.
latex2png.pl

For latex2png.pl, the Perl-version of the script, you also need Perl. To install perl in Ubuntu type in a terminal

sudo apt-get install perl

The perl-script hasn't been tested on Windows, although it could potentially work. LaTeX and Perl is supported by and dvipng comes with MikTex.
latex2png.m

For latex2png.m, the Matlab-version of the script, you need Matlab. Matlab is a propietary scientific tool for Linux, Windows and MacOSX among others. I use Matlab a lot, and I thought about writing a function that would do the same job. I think that if you use Matlab Distributing Toolbox and/or run Matlab on a server you will find this script very useful. To get more information about Matlab, click here.

## Examples

### array.tex
#### Image
![Array](images/array.png)

#### LaTeX snippet

```
\begin{displaymath}
\normalsize         \left(\large\begin{array}{GC+23}         
\varepsilon_x\\\varepsilon_y\\\varepsilon_z\\\gamma_{xy}\\         
\gamma_{xz}\\\gamma_{yz}\end{array}\right)\ {\Large=}         
\ \left[\begin{array}{CC}         
\begin{array}\frac1{E_{\fs{+1}x}}         
&-\frac{\nu_{xy}}{E_{\fs{+1}x}}         
&-\frac{\nu_{\fs{+1}xz}}{E_{\fs{+1}x}}\\         
-\frac{\nu_{yx}}{E_y}&\frac1{E_{y}}&-\frac{\nu_{yz}}{E_y}\\         
-\frac{\nu_{\fs{+1}zx}}{E_{\fs{+1}z}}&         
-\frac{\nu_{zy}}{E_{\fs{+1}z}}         
&\frac1{E_{\fs{+1}z}}\end{array} & {\LARGE 0} \\         
{\LARGE 0} & \begin{array}\frac1{G_{xy}}&&\\         
&\frac1{G_{\fs{+1}xz}}&\\&&\frac1{G_{yz}}\end{array}         
\end{array}\right]         \ 
\left(\large\begin{array}         
\sigma_x\\\sigma_y\\\sigma_z\\\tau_{xy}\\\tau_{xz}\\\tau_{yz}         
\end{array}\right)
\end{displaymath}
```

### series.tex
#### Image
![Series](images/series.png)

#### LaTeX snippet

```
\begin{displaymath}
1 - {1 \over 2} + {1 \over 3} - {1 \over 4} + {1 
\over 5} - \cdots =\sum_{n=1}^\infty (-1)^{n+1} {1 
\over n}.
\end{displaymath}
```

### integral.tex
#### Image
![Integral](images/integral.png)

#### LaTeX snippet

```
\begin{displaymath}
\int \ln{x} dx = |x| \ln{|x|} - x +c
\end{displaymath}
```

### pdf.tex
#### Image
![PDF](images/pdf.png)

#### LaTeX snippet

```
\begin{displaymath}
\frac1{\sigma\sqrt{2\pi}}\; 
\exp\left(-\frac{\left(x-\mu\right)^2}{2\sigma^2} 
\right) \!
\end{displaymath}
```
