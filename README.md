# latex2png

## About

The latex2png script is a tool for parsing LaTeX snippets into png images. It comes in three flavors, a shell-script, a perl-script and a Matlab-script. The three scripts perform the same tasks and depending on your needs you will find one or many very useful.

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
