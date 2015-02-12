addpath( '../' );

snippet = 'x = \frac{-b \pm \sqrt{b^2-4ac}}{2a}';

param.outfile = 'quadratic';
param.debug = false;
latex2png( snippet, param );
