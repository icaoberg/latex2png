addpath( '../../' );

snippet = 'x = \frac{-b \pm \sqrt{b^2-4ac}}{2a}';

param.outfile = 'quadratic';
param.debug = false;
param.background = 'transparent';
param.density = 600;

latex2png( snippet, param );
