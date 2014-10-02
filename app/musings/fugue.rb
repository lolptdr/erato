require 'muse'
include Muse

# Bach's Toccata and Fugue in d minor (fugue portion only)

Song.record 'fugue', bpm: 30, envelope: 'sine', harmonic: 'organ' do
  bar(1,b:0.25).notes   {_; a4; g4; a4; f4; a4; e4; a4;}

  bar(2,b:0.25).notes   {d4; a4; cis4; a4; d4; a4; e4;   a4; 
                         f4; a4; a3;   a4; b3; a4; cis4; a4;}
  
  bar(3,b:0.25).notes   {_ b:2;                             _; d5;   cis5; d5;   b4; d5;   a4; d5}
  bar(3,b:0.25).notes   {d4; a4; cis4; a4; d4; a4; e4; a4; f4 b:0.5; fis4 b:0.5; g4 b:0.5; c4 b:0.5;}


end