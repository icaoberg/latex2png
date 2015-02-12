function latex2png( snippet, param )
% LATEX2PNG Support simple script that generates a LaTeX png file from a
% snippet.

% Author: Ivan E. Cao-Berg (icaoberg@cmu.edu)
% Created: May 21, 2008
%
% Copyright (C) 2008-2015 Ivan E. Cao-Berg
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

%%%%%%%%%%%%%%%%%%%%%%%%%
% CHECK INPUT ARGUMENTS %
%%%%%%%%%%%%%%%%%%%%%%%%%
if ~isunix()
    warning('This script has only been tested in Ubuntu 14.01.');
end

if nargin == 1
    param = [];
    debug = false;
    background = 'white';
    
    %pre-requisites
    outfile = 'snippet';
    latex = '/usr/bin/latex';
    dvipng = '/usr/bin/dvipng';
    convert = '/usr/bin/convert';
    
    %choose a number from 75-300
    density = 300;
elseif nargin == 2
    %pre-requisites
    if isfield( param, 'debug' )
        debug = param.debug;
        if ~isa( debug, 'logical' )
            warning( 'Input argument debug should be boolean' )
            debug = false;
        end
    else
        debug = false;
    end
    
    if isfield( param, 'density' )
        density = param.density;
        if ~isnumeric( density )
            warning( 'Input argument density should be numeric' )
            density = 300;
        end
    else
        density = 300;
    end
    
    if isfield( param, 'background' )
        background = param.background;
        if ~isa( background, 'char' )
            warning( 'Input argument density should be a string' )
            background = 'white';
        end
    else
        background = 'white';
    end
    
    if isfield( param, 'outfile' )
        outfile = param.outfile;
        if ~isa( outfile, 'char' )
            warning( 'Input argument outfile should be a string' )
            outfile = 'snippet';
        end
    else
        outfile = 'snippet';
    end
    
    %check latex binary
    if isfield( param, 'latex' )
        latex = param.latex;
    else
        latex = '/usr/bin/latex';
    end
    
    if ~exist( latex, 'file' )
        error( ['latex2png: LaTeX was not located in ' latex '. To install ' ...
            'LaTeX in Ubuntu type in terminal: sudo apt-get install ' ...
            'tetex-base tetex-extra'] );
    end
    
    %check dvipng binary
    if isfield( param, 'dvipng' )
        dvipng = param.dvipng;
    else
        dvipng = '/usr/bin/dvipng';
    end
    
    if ~exist( dvipng, 'file' )
        error( ['latex2png: dvipng was not located in ' dvipng '. To install ' ...
            'dvipng in Ubuntu type in terminal: sudo apt-get install ' ...
            'dvipng'] );
    end
    
    %check convert binary
    if isfield( param, 'convert' )
        convert = param.convert;
    else
        convert = '/usr/bin/convert';
    end
    
    if( ~exist( convert, 'file' ) )
        error( ['latex2png: convert was not located in ' convert '. To install ' ...
            'convert in Ubuntu type in terminal: sudo apt-get install ' ...
            'imagemagick'] );
    end
else
    error( ['latex2png: Wrong number of input arguments. Refer to ' ...
        'documentation or visit http://latex2png.sourceforge.net or ' ...
        'https://github.com/icaoberg/latex2png for more information']);
end

%%%%%%%%%%%%%%%%%%%%%%%%
% WRITE TEMPORARY FILE %
%%%%%%%%%%%%%%%%%%%%%%%%
write_latex_file( snippet, outfile );

%%%%%%%%%%%%%%%%%%%
% CREATE DVI FILE %
%%%%%%%%%%%%%%%%%%%
system( [latex ' -interaction=nonstopmode ' outfile ' .tex'] );

%%%%%%%%%%%%%%%%%%%%
% PARSE DVI TO PNG %
%%%%%%%%%%%%%%%%%%%%
%if you want to make your image transparent change white to transparent
system( [dvipng ' -q -T tight -bg ' background ' -D' density ' ' ...
    outfile '.dvi'] );

%%%%%%%%%%%%%%%%%%%%%%%%%%
% REMOVE TEMPORARY FILES %
%%%%%%%%%%%%%%%%%%%%%%%%%%
delete( [ outfile '.tex' ] );
delete( [ outfile '.dvi' ] );
delete( [ outfile '.aux' ] );
delete( [ outfile '.log' ] );
end%latex2png

function write_latex_file( snippet, outfile )
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
