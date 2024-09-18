#!/usr/bin/perl -W

# $Id$
# This code is based on work from CAPTCHA Pack
# from Drupal
# http://drupal.org/project/captcha_pack
#
# This file is part of IWWE&M, the Interactive Web Workflow Enactor & Manager.
# 
# IWWE&M is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# IWWE&M is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with IWWE&M.  If not, see <http://www.gnu.org/licenses/agpl.txt>.
# 
# Original IWWE&M concept, design and coding done by José María Fernández González, INB (C) 2008.
# Source code of IWWE&M is available at http://trac.bioinfo.cnio.es/trac/iwwem

use strict;

package Captcha::AsciiArt;

use vars qw(%FONT);


# $Id$
# Font definition based on figlet font "colossal" (http://www.figlet.org/)
# as distributed by pyfiglet (http://sourceforge.net/projects/pyfiglet/)

%FONT=(
  
  'height' => 11,
  'name' => 'colossal',
  'comment' => 'Colossal.flf (Jonathon - jon@mq.edu.au)8 June 1994Explanation of first line:flf2 - "magic number" for file identificationa    - should always be `a\', for now$    - the "hardblank" -- prints as a blank, but can\'t be smushed11   - height of a character8    - height of a character, not including descenders20   - max line length (excluding comment lines) + a fudge factor32   - default smushmode for this font13   - number of comment lines',
  'a' => [
    '         ',
    '         ',
    '         ',
    ' 8888b.  ',
    '    "88b ',
    '.d888888 ',
    '888  888 ',
    '"Y888888 ',
    '         ',
    '         ',
    '         ',
  ],
  'b' => [
    '888      ',
    '888      ',
    '888      ',
    '88888b.  ',
    '888 "88b ',
    '888  888 ',
    '888 d88P ',
    '88888P"  ',
    '         ',
    '         ',
    '         ',
  ],
  'c' => [
    '         ',
    '         ',
    '         ',
    ' .d8888b ',
    'd88P"    ',
    '888      ',
    'Y88b.    ',
    ' "Y8888P ',
    '         ',
    '         ',
    '         ',
  ],
  'd' => [
    '     888 ',
    '     888 ',
    '     888 ',
    ' .d88888 ',
    'd88" 888 ',
    '888  888 ',
    'Y88b 888 ',
    ' "Y88888 ',
    '         ',
    '         ',
    '         ',
  ],
  'e' => [
    '         ',
    '         ',
    '         ',
    ' .d88b.  ',
    'd8P  Y8b ',
    '88888888 ',
    'Y8b.     ',
    ' "Y8888  ',
    '         ',
    '         ',
    '         ',
  ],
  'f' => [
    ' .d888 ',
    'd88P"  ',
    '888    ',
    '888888 ',
    '888    ',
    '888    ',
    '888    ',
    '888    ',
    '       ',
    '       ',
    '       ',
  ],
  'g' => [
    '         ',
    '         ',
    '         ',
    ' .d88b.  ',
    'd88P"88b ',
    '888  888 ',
    'Y88b 888 ',
    ' "Y88888 ',
    '     888 ',
    'Y8b d88P ',
    ' "Y88P"  ',
  ],
  'h' => [
    '888      ',
    '888      ',
    '888      ',
    '88888b.  ',
    '888 "88b ',
    '888  888 ',
    '888  888 ',
    '888  888 ',
    '         ',
    '         ',
    '         ',
  ],
  'i' => [
    'd8b ',
    'Y8P ',
    '    ',
    '888 ',
    '888 ',
    '888 ',
    '888 ',
    '888 ',
    '    ',
    '    ',
    '    ',
  ],
  'j' => [
    '   d8b ',
    '   Y8P ',
    '       ',
    '  8888 ',
    '  "888 ',
    '   888 ',
    '   888 ',
    '   888 ',
    '   888 ',
    '  d88P ',
    '888P"  ',
  ],
  'k' => [
    '888      ',
    '888      ',
    '888      ',
    '888  888 ',
    '888 .88P ',
    '888888K  ',
    '888 "88b ',
    '888  888 ',
    '         ',
    '         ',
    '         ',
  ],
  'l' => [
    '888 ',
    '888 ',
    '888 ',
    '888 ',
    '888 ',
    '888 ',
    '888 ',
    '888 ',
    '    ',
    '    ',
    '    ',
  ],
  'm' => [
    '              ',
    '              ',
    '              ',
    '88888b.d88b.  ',
    '888 "888 "88b ',
    '888  888  888 ',
    '888  888  888 ',
    '888  888  888 ',
    '              ',
    '              ',
    '              ',
  ],
  'n' => [
    '         ',
    '         ',
    '         ',
    '88888b.  ',
    '888 "88b ',
    '888  888 ',
    '888  888 ',
    '888  888 ',
    '         ',
    '         ',
    '         ',
  ],
  'o' => [
    '         ',
    '         ',
    '         ',
    ' .d88b.  ',
    'd88""88b ',
    '888  888 ',
    'Y88..88P ',
    ' "Y88P"  ',
    '         ',
    '         ',
    '         ',
  ],
  'p' => [
    '         ',
    '         ',
    '         ',
    '88888b.  ',
    '888 "88b ',
    '888  888 ',
    '888 d88P ',
    '88888P"  ',
    '888      ',
    '888      ',
    '888      ',
  ],
  'q' => [
    '         ',
    '         ',
    '         ',
    ' .d88888 ',
    'd88" 888 ',
    '888  888 ',
    'Y88b 888 ',
    ' "Y88888 ',
    '     888 ',
    '     888 ',
    '     888 ',
  ],
  'r' => [
    '        ',
    '        ',
    '        ',
    '888d888 ',
    '888P"   ',
    '888     ',
    '888     ',
    '888     ',
    '        ',
    '        ',
    '        ',
  ],
  's' => [
    '         ',
    '         ',
    '         ',
    '.d8888b  ',
    '88K      ',
    '"Y8888b. ',
    '     X88 ',
    ' 88888P\' ',
    '         ',
    '         ',
    '         ',
  ],
  't' => [
    '888    ',
    '888    ',
    '888    ',
    '888888 ',
    '888    ',
    '888    ',
    'Y88b.  ',
    ' "Y888 ',
    '       ',
    '       ',
    '       ',
  ],
  'u' => [
    '         ',
    '         ',
    '         ',
    '888  888 ',
    '888  888 ',
    '888  888 ',
    'Y88b 888 ',
    ' "Y88888 ',
    '         ',
    '         ',
    '         ',
  ],
  'v' => [
    '         ',
    '         ',
    '         ',
    '888  888 ',
    '888  888 ',
    'Y88  88P ',
    ' Y8bd8P  ',
    '  Y88P   ',
    '         ',
    '         ',
    '         ',
  ],
  'w' => [
    '              ',
    '              ',
    '              ',
    '888  888  888 ',
    '888  888  888 ',
    '888  888  888 ',
    'Y88b 888 d88P ',
    ' "Y8888888P"  ',
    '              ',
    '              ',
    '              ',
  ],
  'x' => [
    '         ',
    '         ',
    '         ',
    '888  888 ',
    '`Y8bd8P\' ',
    '  X88K   ',
    '.d8""8b. ',
    '888  888 ',
    '         ',
    '         ',
    '         ',
  ],
  'y' => [
    '         ',
    '         ',
    '         ',
    '888  888 ',
    '888  888 ',
    '888  888 ',
    'Y88b 888 ',
    ' "Y88888 ',
    '     888 ',
    'Y8b d88P ',
    ' "Y88P"  ',
  ],
  'z' => [
    '         ',
    '         ',
    '         ',
    '88888888 ',
    '   d88P  ',
    '  d88P   ',
    ' d88P    ',
    '88888888 ',
    '         ',
    '         ',
    '         ',
  ],
  'A' => [
    '       d8888 ',
    '      d88888 ',
    '     d88P888 ',
    '    d88P 888 ',
    '   d88P  888 ',
    '  d88P   888 ',
    ' d8888888888 ',
    'd88P     888 ',
    '             ',
    '             ',
    '             ',
  ],
  'B' => [
    '888888b.   ',
    '888  "88b  ',
    '888  .88P  ',
    '8888888K.  ',
    '888  "Y88b ',
    '888    888 ',
    '888   d88P ',
    '8888888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  'C' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    '888    888 ',
    '888        ',
    '888        ',
    '888    888 ',
    'Y88b  d88P ',
    ' "Y8888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  'D' => [
    '8888888b.  ',
    '888  "Y88b ',
    '888    888 ',
    '888    888 ',
    '888    888 ',
    '888    888 ',
    '888  .d88P ',
    '8888888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  'E' => [
    '8888888888 ',
    '888        ',
    '888        ',
    '8888888    ',
    '888        ',
    '888        ',
    '888        ',
    '8888888888 ',
    '           ',
    '           ',
    '           ',
  ],
  'F' => [
    '8888888888 ',
    '888        ',
    '888        ',
    '8888888    ',
    '888        ',
    '888        ',
    '888        ',
    '888        ',
    '           ',
    '           ',
    '           ',
  ],
  'G' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    '888    888 ',
    '888        ',
    '888  88888 ',
    '888    888 ',
    'Y88b  d88P ',
    ' "Y8888P88 ',
    '           ',
    '           ',
    '           ',
  ],
  'H' => [
    '888    888 ',
    '888    888 ',
    '888    888 ',
    '8888888888 ',
    '888    888 ',
    '888    888 ',
    '888    888 ',
    '888    888 ',
    '           ',
    '           ',
    '           ',
  ],
  'I' => [
    '8888888 ',
    '  888   ',
    '  888   ',
    '  888   ',
    '  888   ',
    '  888   ',
    '  888   ',
    '8888888 ',
    '        ',
    '        ',
    '        ',
  ],
  'J' => [
    '  888888 ',
    '    "88b ',
    '     888 ',
    '     888 ',
    '     888 ',
    '     888 ',
    '     88P ',
    '     888 ',
    '   .d88P ',
    ' .d88P"  ',
    '888P"    ',
  ],
  'K' => [
    '888    d8P  ',
    '888   d8P   ',
    '888  d8P    ',
    '888d88K     ',
    '8888888b    ',
    '888  Y88b   ',
    '888   Y88b  ',
    '888    Y88b ',
    '            ',
    '            ',
    '            ',
  ],
  'L' => [
    '888      ',
    '888      ',
    '888      ',
    '888      ',
    '888      ',
    '888      ',
    '888      ',
    '88888888 ',
    '         ',
    '         ',
    '         ',
  ],
  'M' => [
    '888b     d888 ',
    '8888b   d8888 ',
    '88888b.d88888 ',
    '888Y88888P888 ',
    '888 Y888P 888 ',
    '888  Y8P  888 ',
    '888   "   888 ',
    '888       888 ',
    '              ',
    '              ',
    '              ',
  ],
  'N' => [
    '888b    888 ',
    '8888b   888 ',
    '88888b  888 ',
    '888Y88b 888 ',
    '888 Y88b888 ',
    '888  Y88888 ',
    '888   Y8888 ',
    '888    Y888 ',
    '            ',
    '            ',
    '            ',
  ],
  'O' => [
    ' .d88888b.  ',
    'd88P" "Y88b ',
    '888     888 ',
    '888     888 ',
    '888     888 ',
    '888     888 ',
    'Y88b. .d88P ',
    ' "Y88888P"  ',
    '            ',
    '            ',
    '            ',
  ],
  'P' => [
    '8888888b.  ',
    '888   Y88b ',
    '888    888 ',
    '888   d88P ',
    '8888888P"  ',
    '888        ',
    '888        ',
    '888        ',
    '           ',
    '           ',
    '           ',
  ],
  'Q' => [
    ' .d88888b.  ',
    'd88P" "Y88b ',
    '888     888 ',
    '888     888 ',
    '888     888 ',
    '888 Y8b 888 ',
    'Y88b.Y8b88P ',
    ' "Y888888"  ',
    '       Y8b  ',
    '            ',
    '            ',
  ],
  'R' => [
    '8888888b.  ',
    '888   Y88b ',
    '888    888 ',
    '888   d88P ',
    '8888888P"  ',
    '888 T88b   ',
    '888  T88b  ',
    '888   T88b ',
    '           ',
    '           ',
    '           ',
  ],
  'S' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    'Y88b.      ',
    ' "Y888b.   ',
    '    "Y88b. ',
    '      "888 ',
    'Y88b  d88P ',
    ' "Y8888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  'T' => [
    '88888888888 ',
    '    888     ',
    '    888     ',
    '    888     ',
    '    888     ',
    '    888     ',
    '    888     ',
    '    888     ',
    '            ',
    '            ',
    '            ',
  ],
  'U' => [
    '888     888 ',
    '888     888 ',
    '888     888 ',
    '888     888 ',
    '888     888 ',
    '888     888 ',
    'Y88b. .d88P ',
    ' "Y88888P"  ',
    '            ',
    '            ',
    '            ',
  ],
  'V' => [
    '888     888 ',
    '888     888 ',
    '888     888 ',
    'Y88b   d88P ',
    ' Y88b d88P  ',
    '  Y88o88P   ',
    '   Y888P    ',
    '    Y8P     ',
    '            ',
    '            ',
    '            ',
  ],
  'W' => [
    '888       888 ',
    '888   o   888 ',
    '888  d8b  888 ',
    '888 d888b 888 ',
    '888d88888b888 ',
    '88888P Y88888 ',
    '8888P   Y8888 ',
    '888P     Y888 ',
    '              ',
    '              ',
    '              ',
  ],
  'X' => [
    'Y88b   d88P ',
    ' Y88b d88P  ',
    '  Y88o88P   ',
    '   Y888P    ',
    '   d888b    ',
    '  d88888b   ',
    ' d88P Y88b  ',
    'd88P   Y88b ',
    '            ',
    '            ',
    '            ',
  ],
  'Y' => [
    'Y88b   d88P ',
    ' Y88b d88P  ',
    '  Y88o88P   ',
    '   Y888P    ',
    '    888     ',
    '    888     ',
    '    888     ',
    '    888     ',
    '            ',
    '            ',
    '            ',
  ],
  'Z' => [
    '8888888888P ',
    '      d88P  ',
    '     d88P   ',
    '    d88P    ',
    '   d88P     ',
    '  d88P      ',
    ' d88P       ',
    'd8888888888 ',
    '            ',
    '            ',
    '            ',
  ],
  '0' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    '888    888 ',
    '888    888 ',
    '888    888 ',
    '888    888 ',
    'Y88b  d88P ',
    ' "Y8888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  '1' => [
    ' d888   ',
    'd8888   ',
    '  888   ',
    '  888   ',
    '  888   ',
    '  888   ',
    '  888   ',
    '8888888 ',
    '        ',
    '        ',
    '        ',
  ],
  '2' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    '       888 ',
    '     .d88P ',
    ' .od888P"  ',
    'd88P"      ',
    '888"       ',
    '888888888  ',
    '           ',
    '           ',
    '           ',
  ],
  '3' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    '     .d88P ',
    '    8888"  ',
    '     "Y8b. ',
    '888    888 ',
    'Y88b  d88P ',
    ' "Y8888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  '4' => [
    '    d8888  ',
    '   d8P888  ',
    '  d8P 888  ',
    ' d8P  888  ',
    'd88   888  ',
    '8888888888 ',
    '      888  ',
    '      888  ',
    '           ',
    '           ',
    '           ',
  ],
  '5' => [
    '888888888  ',
    '888        ',
    '888        ',
    '8888888b.  ',
    '     "Y88b ',
    '       888 ',
    'Y88b  d88P ',
    ' "Y8888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  '6' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    '888        ',
    '888d888b.  ',
    '888P "Y88b ',
    '888    888 ',
    'Y88b  d88P ',
    ' "Y8888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  '7' => [
    '8888888888 ',
    '      d88P ',
    '     d88P  ',
    '    d88P   ',
    ' 88888888  ',
    '  d88P     ',
    ' d88P      ',
    'd88P       ',
    '           ',
    '           ',
    '           ',
  ],
  '8' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    'Y88b. d88P ',
    ' "Y88888"  ',
    '.d8P""Y8b. ',
    '888    888 ',
    'Y88b  d88P ',
    ' "Y8888P"  ',
    '           ',
    '           ',
    '           ',
  ],
  '9' => [
    ' .d8888b.  ',
    'd88P  Y88b ',
    '888    888 ',
    'Y88b. d888 ',
    ' "Y888P888 ',
    '       888 ',
    'Y88b  d88P ',
    ' "Y8888P"  ',
    '           ',
    '           ',
    '           ',
  ],

  
);

1;
