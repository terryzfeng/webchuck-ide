//------------------------------------------------------|
// on-the-fly synchronization
// adapted from Perry's ChucK Drummin' + Ge's sine poops
//
// authors: Perry Cook (prc@cs.princeton.edu)
//          Ge Wang (gewang@cs.princeton.edu)

// add one by one into VM (in pretty much any order):
//
// add otf_01.ck
// add otf_02.ck
// (etc...)
//------------------------------------------------------|

// this synchronizes to period
.5::second => dur T;
T - (now % T) => now;

// extra half T offset
.5::T => now;

// construct the patch
SndBuf buf => Gain g => dac;
// read in from file
"hihat-open.wav" => buf.read;
// set the gain
.5 => g.gain;

// time loop
while( true )
{
    // set play position to beginning
    0 => buf.pos;
    // randomize gain a bit
    Math.random2f(.8,.9) => buf.gain;

    // advance time
    1::T => now;
}
