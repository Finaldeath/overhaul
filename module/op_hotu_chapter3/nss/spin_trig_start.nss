////////////////////////////////////////////////////////////////////////////////
// This is for a trigger placed on the ground at the starting position.
//
// When a PC  pulls a lever when the arrow is facing an illegal jump direction, they get
// jumped to the start or end, depending on which trigger they step on.  This is done so
// that if you crossed over to the end once, but needed to get back, you couldn't
// just purposefully pull a wrong switch to jump there.  Instead, this resets the
// illegal jump postion to where you have been last.
//
// Created by: Brad Prince
// 9-13-02
//
/////////////////////////////////////////////////////////////////////////////////


void main()
{
   object oPC = GetEnteringObject();

   if(GetIsPC(oPC))
      SetLocalInt(oPC, "spin_puzzle_start", 0);
}
