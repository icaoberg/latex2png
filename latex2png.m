function latex2png( snippet, outfile )

% Author: Ivan E. Cao-Berg (icaoberg@cmu.edu)
% Created: May 21, 2008
%
% Copyright (C) 2008 Ivan E. Cao-Berg
% Carnegie Mellon University
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published
% by the Free Software Foundation; either version 2 of the License,
% or (at your option) any later version.
%
% This program is distributed in the hope that it will be useful, but
% WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
% 02110-1301, USA.
%
% For additional information visit http://latex2png.sourceforge.net

%Pre-requisites
latex = '/usr/bin/latex';
dvipng = '/usr/bin/dvipng';
convert = '/usr/bin/convert';
%choose a number from 75-300
density = 300;

if( ~exist( latex, 'file' ) )
    error( ['latex2png: LaTeX was not located in ' latex '. To install ' ...
        'LaTeX in Ubuntu type in terminal: sudo apt-get install ' ...
        'tetex-base tetex-extra'] );
elseif( ~exist( dvipng, 'file' ) )
    error( ['latex2png: dvipng was not located in ' dvipng '. To install ' ...
        'dvipng in Ubuntu type in terminal: sudo apt-get install ' ...
        'dvipng'] );
elseif( ~exist( convert, 'file' ) )
    error( ['latex2png: convert was not located in ' convert '. To install ' ...
        'convert in Ubuntu type in terminal: sudo apt-get install ' ...
        'imagemagick'] );
elseif( nargin ~= 2 )
    error( ['latex2png: Wrong number of input arguments. Refer to ' ... 
        'documentation or visit http://latex2png.sourceforge.net for ' ...
        'more information']);
else
    %write temporary file
    writeLaTeXfile( snippet, outfile );
    
    %create dvi file
    system( [latex ' -interaction=nonstopmode ' outfile ' .tex'] );
    
    %parse dvi to png
    %if you want to make your image transparent change white to transparent
    system( [dvipng ' -q -T tight -bg white -D' density ' ' ...
        outfile '.dvi'] );
    
    %remove temporary files
    system( ['rm ' outfile '.tex ' outfile '.dvi ' outfile '.aux ' ...
        outfile '.log' ] );
end

end%latex2png

function writeLaTeXfile( snippet, outfile )
    fileID = fopen( [outfile '.tex'] , 'w' );
    fprintf( fileID, '%s\n', '\documentclass[fleqn]{article}' );
    fprintf( fileID, '%s\n', '\usepackage{amssymb,amsmath,bm}' );
    fprintf( fileID, '%s\n', '\usepackage[latin1]{inputenc}' );
    fprintf( fileID, '%s\n', '\begin{document}' );
    fprintf( fileID, '%s\n', '\thispagestyle{empty}' );
    fprintf( fileID, '%s', '$$ \displaystyle \mathindent0cm \parindent0cm ' );
    fprintf( fileID, '%s\n', [ snippet '$$' ] );
    fprintf( fileID, '%s\n', '\end{document}' );
    fclose( fileID );
end%writeLaTeXfile
