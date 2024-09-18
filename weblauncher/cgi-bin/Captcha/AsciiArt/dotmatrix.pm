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
# Font definition based on figlet font "dotmatrix" (http://www.figlet.org/)
# as distributed by pyfiglet (http://sourceforge.net/projects/pyfiglet/)

%FONT=(
  
  'height' => 10,
  'name' => 'dotmatrix',
  'comment' => 'dotmatrix.flf by Curtis Wanner (cwanner@acs.bu.edu)last revision - 8/21/95',
  'a' => [
    '                  ',
    '                  ',
    '   _  _  _        ',
    '  (_)(_)(_) _     ',
    '   _  _  _ (_)    ',
    ' _(_)(_)(_)(_)    ',
    '(_)_  _  _ (_)_   ',
    '  (_)(_)(_)  (_)  ',
    '                  ',
    '                  ',
  ],
  'b' => [
    ' _               ',
    '(_)              ',
    '(_) _  _  _      ',
    '(_)(_)(_)(_)_    ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '(_) _  _  _(_)   ',
    '(_)(_)(_)(_)     ',
    '                 ',
    '                 ',
  ],
  'c' => [
    '                 ',
    '                 ',
    '   _  _  _       ',
    ' _(_)(_)(_)      ',
    '(_)              ',
    '(_)              ',
    '(_)_  _  _       ',
    '  (_)(_)(_)      ',
    '                 ',
    '                 ',
  ],
  'd' => [
    '            _    ',
    '           (_)   ',
    '   _  _  _ (_)   ',
    ' _(_)(_)(_)(_)   ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '(_)_  _  _ (_)   ',
    '  (_)(_)(_)(_)   ',
    '                 ',
    '                 ',
  ],
  'e' => [
    '                  ',
    '                  ',
    '  _  _  _  _      ',
    ' (_)(_)(_)(_)_    ',
    '(_) _  _  _ (_)   ',
    '(_)(_)(_)(_)(_)   ',
    '(_)_  _  _  _     ',
    '  (_)(_)(_)(_)    ',
    '                  ',
    '                  ',
  ],
  'f' => [
    '      _  _      ',
    '    _(_)(_)     ',
    ' _ (_) _        ',
    '(_)(_)(_)       ',
    '   (_)          ',
    '   (_)          ',
    '   (_)          ',
    '   (_)          ',
    '                ',
    '                ',
  ],
  'g' => [
    '                 ',
    '                 ',
    '   _  _  _  _    ',
    ' _(_)(_)(_)(_)   ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '(_)_  _  _ (_)   ',
    '  (_)(_)(_)(_)   ',
    '   _  _  _ (_)   ',
    '  (_)(_)(_)      ',
  ],
  'h' => [
    ' _               ',
    '(_)              ',
    '(_) _  _  _      ',
    '(_)(_)(_)(_)_    ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '                 ',
    '                 ',
  ],
  'i' => [
    '    _          ',
    '   (_)         ',
    ' _  _          ',
    '(_)(_)         ',
    '   (_)         ',
    '   (_)         ',
    ' _ (_) _       ',
    '(_)(_)(_)      ',
    '               ',
    '               ',
  ],
  'j' => [
    '          _      ',
    '         (_)     ',
    '       _  _      ',
    '      (_)(_)     ',
    '         (_)     ',
    '         (_)     ',
    '         (_)     ',
    ' _      _(_)     ',
    '(_)_  _(_)       ',
    '  (_)(_)         ',
  ],
  'k' => [
    ' _               ',
    '(_)              ',
    '(_)     _        ',
    '(_)   _(_)       ',
    '(_) _(_)         ',
    '(_)(_)_          ',
    '(_)  (_)_        ',
    '(_)    (_)       ',
    '                 ',
    '                 ',
  ],
  'l' => [
    ' _  _          ',
    '(_)(_)         ',
    '   (_)         ',
    '   (_)         ',
    '   (_)         ',
    '   (_)         ',
    ' _ (_) _       ',
    '(_)(_)(_)      ',
    '               ',
    '               ',
  ],
  'm' => [
    '                  ',
    '                  ',
    '  _  _   _  _     ',
    ' (_)(_)_(_)(_)    ',
    '(_)   (_)   (_)   ',
    '(_)   (_)   (_)   ',
    '(_)   (_)   (_)   ',
    '(_)   (_)   (_)   ',
    '                  ',
    '                  ',
  ],
  'n' => [
    '                 ',
    '                 ',
    ' _  _  _  _      ',
    '(_)(_)(_)(_)_    ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '                 ',
    '                 ',
  ],
  'o' => [
    '                  ',
    '                  ',
    '    _  _  _       ',
    ' _ (_)(_)(_) _    ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '(_) _  _  _ (_)   ',
    '   (_)(_)(_)      ',
    '                  ',
    '                  ',
  ],
  'p' => [
    '                  ',
    '                  ',
    ' _  _  _  _       ',
    '(_)(_)(_)(_)_     ',
    '(_)        (_)    ',
    '(_)        (_)    ',
    '(_) _  _  _(_)    ',
    '(_)(_)(_)(_)      ',
    '(_)               ',
    '(_)               ',
  ],
  'q' => [
    '                  ',
    '                  ',
    '   _  _  _  _     ',
    ' _(_)(_)(_)(_)    ',
    '(_)        (_)    ',
    '(_)        (_)    ',
    '(_)_  _  _ (_)    ',
    '  (_)(_)(_)(_)    ',
    '           (_)    ',
    '           (_)    ',
  ],
  'r' => [
    '                  ',
    '                  ',
    ' _       _  _     ',
    '(_)_  _ (_)(_)    ',
    '  (_)(_)          ',
    '  (_)             ',
    '  (_)             ',
    '  (_)             ',
    '                  ',
    '                  ',
  ],
  's' => [
    '                  ',
    '                  ',
    '   _  _  _  _     ',
    ' _(_)(_)(_)(_)    ',
    '(_)_  _  _  _     ',
    '  (_)(_)(_)(_)_   ',
    '   _  _  _  _(_)  ',
    '  (_)(_)(_)(_)    ',
    '                  ',
    '                  ',
  ],
  't' => [
    '    _            ',
    '   (_)           ',
    ' _ (_) _  _      ',
    '(_)(_)(_)(_)     ',
    '   (_)           ',
    '   (_)     _     ',
    '   (_)_  _(_)    ',
    '     (_)(_)      ',
    '                 ',
    '                 ',
  ],
  'u' => [
    '                  ',
    '                  ',
    ' _         _      ',
    '(_)       (_)     ',
    '(_)       (_)     ',
    '(_)       (_)     ',
    '(_)_  _  _(_)_    ',
    '  (_)(_)(_) (_)   ',
    '                  ',
    '                  ',
  ],
  'v' => [
    '                    ',
    '                    ',
    ' _               _  ',
    '(_)_           _(_) ',
    '  (_)_       _(_)   ',
    '    (_)_   _(_)     ',
    '      (_)_(_)       ',
    '        (_)         ',
    '                    ',
    '                    ',
  ],
  'w' => [
    '                   ',
    '                   ',
    ' _             _   ',
    '(_)           (_)  ',
    '(_)     _     (_)  ',
    '(_)_  _(_)_  _(_)  ',
    '  (_)(_) (_)(_)    ',
    '    (_)   (_)      ',
    '                   ',
    '                   ',
  ],
  'x' => [
    '                 ',
    '                 ',
    ' _         _     ',
    '(_) _   _ (_)    ',
    '   (_)_(_)       ',
    '    _(_)_        ',
    ' _ (_) (_) _     ',
    '(_)       (_)    ',
    '                 ',
    '                 ',
  ],
  'y' => [
    '                    ',
    '                    ',
    ' _               _  ',
    '(_)_           _(_) ',
    '  (_)_       _(_)   ',
    '    (_)_   _(_)     ',
    '      (_)_(_)       ',
    '       _(_)         ',
    '  _  _(_)           ',
    ' (_)(_)             ',
  ],
  'z' => [
    '                ',
    '                ',
    ' _  _  _  _     ',
    '(_)(_)(_)(_)    ',
    '      _ (_)     ',
    '   _ (_)        ',
    ' _(_)  _  _     ',
    '(_)(_)(_)(_)    ',
    '                ',
    '                ',
  ],
  'A' => [
    '       _          ',
    '     _(_)_        ',
    '   _(_) (_)_      ',
    ' _(_)     (_)_    ',
    '(_) _  _  _ (_)   ',
    '(_)(_)(_)(_)(_)   ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '                  ',
    '                  ',
  ],
  'B' => [
    ' _  _  _  _       ',
    '(_)(_)(_)(_) _    ',
    ' (_)        (_)   ',
    ' (_) _  _  _(_)   ',
    ' (_)(_)(_)(_)_    ',
    ' (_)        (_)   ',
    ' (_)_  _  _ (_)   ',
    '(_)(_)(_)(_)      ',
    '                  ',
    '                  ',
  ],
  'C' => [
    '    _  _  _       ',
    ' _ (_)(_)(_) _    ',
    '(_)         (_)   ',
    '(_)               ',
    '(_)               ',
    '(_)          _    ',
    '(_) _  _  _ (_)   ',
    '   (_)(_)(_)      ',
    '                  ',
    '                  ',
  ],
  'D' => [
    ' _  _  _  _       ',
    '(_)(_)(_)(_)      ',
    ' (_)      (_)_    ',
    ' (_)        (_)   ',
    ' (_)        (_)   ',
    ' (_)       _(_)   ',
    ' (_)_  _  (_)     ',
    '(_)(_)(_)(_)      ',
    '                  ',
    '                  ',
  ],
  'E' => [
    ' _  _  _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '(_)               ',
    '(_) _  _          ',
    '(_)(_)(_)         ',
    '(_)               ',
    '(_) _  _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '                  ',
    '                  ',
  ],
  'F' => [
    ' _  _  _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '(_)               ',
    '(_) _  _          ',
    '(_)(_)(_)         ',
    '(_)               ',
    '(_)               ',
    '(_)               ',
    '                  ',
    '                  ',
  ],
  'G' => [
    '    _  _  _       ',
    ' _ (_)(_)(_) _    ',
    '(_)         (_)   ',
    '(_)    _  _  _    ',
    '(_)   (_)(_)(_)   ',
    '(_)         (_)   ',
    '(_) _  _  _ (_)   ',
    '   (_)(_)(_)(_)   ',
    '                  ',
    '                  ',
  ],
  'H' => [
    ' _           _    ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '(_) _  _  _ (_)   ',
    '(_)(_)(_)(_)(_)   ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '                  ',
    '                  ',
  ],
  'I' => [
    ' _  _  _       ',
    '(_)(_)(_)      ',
    '   (_)         ',
    '   (_)         ',
    '   (_)         ',
    '   (_)         ',
    ' _ (_) _       ',
    '(_)(_)(_)      ',
    '               ',
    '               ',
  ],
  'J' => [
    '      _  _  _    ',
    '     (_)(_)(_)   ',
    '        (_)      ',
    '        (_)      ',
    '        (_)      ',
    ' _      (_)      ',
    '(_)  _  (_)      ',
    ' (_)(_)(_)       ',
    '                 ',
    '                 ',
  ],
  'K' => [
    ' _           _    ',
    '(_)       _ (_)   ',
    '(_)    _ (_)      ',
    '(_) _ (_)         ',
    '(_)(_) _          ',
    '(_)   (_) _       ',
    '(_)      (_) _    ',
    '(_)         (_)   ',
    '                  ',
    '                  ',
  ],
  'L' => [
    ' _                ',
    '(_)               ',
    '(_)               ',
    '(_)               ',
    '(_)               ',
    '(_)               ',
    '(_) _  _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '                  ',
    '                  ',
  ],
  'M' => [
    ' _           _    ',
    '(_) _     _ (_)   ',
    '(_)(_)   (_)(_)   ',
    '(_) (_)_(_) (_)   ',
    '(_)   (_)   (_)   ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '                  ',
    '                  ',
  ],
  'N' => [
    ' _           _    ',
    '(_) _       (_)   ',
    '(_)(_)_     (_)   ',
    '(_)  (_)_   (_)   ',
    '(_)    (_)_ (_)   ',
    '(_)      (_)(_)   ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '                  ',
    '                  ',
  ],
  'O' => [
    '   _  _  _  _     ',
    ' _(_)(_)(_)(_)_   ',
    '(_)          (_)  ',
    '(_)          (_)  ',
    '(_)          (_)  ',
    '(_)          (_)  ',
    '(_)_  _  _  _(_)  ',
    '  (_)(_)(_)(_)    ',
    '                  ',
    '                  ',
  ],
  'P' => [
    ' _  _  _  _      ',
    '(_)(_)(_)(_)_    ',
    '(_)        (_)   ',
    '(_) _  _  _(_)   ',
    '(_)(_)(_)(_)     ',
    '(_)              ',
    '(_)              ',
    '(_)              ',
    '                 ',
    '                 ',
  ],
  'Q' => [
    '   _  _  _  _     ',
    ' _(_)(_)(_)(_)_   ',
    '(_)          (_)  ',
    '(_)          (_)  ',
    '(_)     _    (_)  ',
    '(_)    (_) _ (_)  ',
    '(_)_  _  _(_) _   ',
    '  (_)(_)(_)  (_)  ',
    '                  ',
    '                  ',
  ],
  'R' => [
    ' _  _  _  _       ',
    '(_)(_)(_)(_) _    ',
    '(_)         (_)   ',
    '(_) _  _  _ (_)   ',
    '(_)(_)(_)(_)      ',
    '(_)   (_) _       ',
    '(_)      (_) _    ',
    '(_)         (_)   ',
    '                  ',
    '                  ',
  ],
  'S' => [
    '   _  _  _  _     ',
    ' _(_)(_)(_)(_)_   ',
    '(_)          (_)  ',
    '(_)_  _  _  _     ',
    '  (_)(_)(_)(_)_   ',
    ' _           (_)  ',
    '(_)_  _  _  _(_)  ',
    '  (_)(_)(_)(_)    ',
    '                  ',
    '                  ',
  ],
  'T' => [
    ' _  _  _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '      (_)         ',
    '      (_)         ',
    '      (_)         ',
    '      (_)         ',
    '      (_)         ',
    '      (_)         ',
    '                  ',
    '                  ',
  ],
  'U' => [
    ' _            _   ',
    '(_)          (_)  ',
    '(_)          (_)  ',
    '(_)          (_)  ',
    '(_)          (_)  ',
    '(_)          (_)  ',
    '(_)_  _  _  _(_)  ',
    '  (_)(_)(_)(_)    ',
    '                  ',
    '                  ',
  ],
  'V' => [
    ' _           _    ',
    '(_)         (_)   ',
    '(_)         (_)   ',
    '(_)_       _(_)   ',
    '  (_)     (_)     ',
    '   (_)   (_)      ',
    '    (_)_(_)       ',
    '      (_)         ',
    '                  ',
    '                  ',
  ],
  'W' => [
    ' _             _   ',
    '(_)           (_)  ',
    '(_)           (_)  ',
    '(_)     _     (_)  ',
    '(_)   _(_)_   (_)  ',
    '(_)  (_) (_)  (_)  ',
    '(_)_(_)   (_)_(_)  ',
    '  (_)       (_)    ',
    '                   ',
    '                   ',
  ],
  'X' => [
    ' _           _    ',
    '(_)_       _(_)   ',
    '  (_)_   _(_)     ',
    '    (_)_(_)       ',
    '     _(_)_        ',
    '   _(_) (_)_      ',
    ' _(_)     (_)_    ',
    '(_)         (_)   ',
    '                  ',
    '                  ',
  ],
  'Y' => [
    ' _           _    ',
    '(_)_       _(_)   ',
    '  (_)_   _(_)     ',
    '    (_)_(_)       ',
    '      (_)         ',
    '      (_)         ',
    '      (_)         ',
    '      (_)         ',
    '                  ',
    '                  ',
  ],
  'Z' => [
    ' _  _  _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '          _(_)    ',
    '        _(_)      ',
    '      _(_)        ',
    '    _(_)          ',
    ' _ (_) _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '                  ',
    '                  ',
  ],
  '0' => [
    '     _  _        ',
    '  _ (_)(_) _     ',
    ' (_)      (_)    ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    '(_)        (_)   ',
    ' (_) _  _ (_)    ',
    '    (_)(_)       ',
    '                 ',
    '                 ',
  ],
  '1' => [
    '    _          ',
    ' _ (_)         ',
    '(_)(_)         ',
    '   (_)         ',
    '   (_)         ',
    '   (_)         ',
    ' _ (_) _       ',
    '(_)(_)(_)      ',
    '               ',
    '               ',
  ],
  '2' => [
    '    _  _  _       ',
    ' _ (_)(_)(_) _    ',
    '(_)         (_)   ',
    '          _ (_)   ',
    '       _ (_)      ',
    '    _ (_)         ',
    ' _ (_) _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '                  ',
    '                  ',
  ],
  '3' => [
    '   _  _  _  _     ',
    ' _(_)(_)(_)(_)_   ',
    '(_)          (_)  ',
    '         _  _(_)  ',
    '        (_)(_)_   ',
    ' _           (_)  ',
    '(_)_  _  _  _(_)  ',
    '  (_)(_)(_)(_)    ',
    '                  ',
    '                  ',
  ],
  '4' => [
    '          _       ',
    '       _ (_)      ',
    '    _ (_)(_)      ',
    ' _ (_)   (_)      ',
    '(_) _  _ (_) _    ',
    '(_)(_)(_)(_)(_)   ',
    '         (_)      ',
    '         (_)      ',
    '                  ',
    '                  ',
  ],
  '5' => [
    ' _  _  _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '(_) _  _  _       ',
    '(_)(_)(_)(_) _    ',
    '            (_)   ',
    ' _          (_)   ',
    '(_) _  _  _ (_)   ',
    '   (_)(_)(_)      ',
    '                  ',
    '                  ',
  ],
  '6' => [
    '     _  _  _     ',
    '   _(_)(_)(_)    ',
    ' _(_)            ',
    '(_) _  _  _      ',
    '(_)(_)(_)(_)_    ',
    '(_)        (_)   ',
    '(_)_  _  _ (_)   ',
    '  (_)(_)(_)      ',
    '                 ',
    '                 ',
  ],
  '7' => [
    ' _  _  _  _  _    ',
    '(_)(_)(_)(_)(_)   ',
    '          _(_)    ',
    '        _(_)      ',
    '      _(_)        ',
    '    _(_)          ',
    '  _(_)            ',
    ' (_)              ',
    '                  ',
    '                  ',
  ],
  '8' => [
    '   _  _  _  _     ',
    ' _(_)(_)(_)(_)_   ',
    '(_)          (_)  ',
    '(_)_  _  _  _(_)  ',
    ' _(_)(_)(_)(_)_   ',
    '(_)          (_)  ',
    '(_)_  _  _  _(_)  ',
    '  (_)(_)(_)(_)    ',
    '                  ',
    '                  ',
  ],
  '9' => [
    '    _  _  _       ',
    ' _ (_)(_)(_) _    ',
    '(_)         (_)   ',
    '(_) _  _  _ (_)   ',
    '   (_)(_)(_)(_)   ',
    '           _(_)   ',
    '   _  _  _(_)     ',
    '  (_)(_)(_)       ',
    '                  ',
    '                  ',
  ],

  
);

1;
