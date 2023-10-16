//Set a variable on exit so that Nora - if she's outside, will want to
// talk to the PC immediately.
#include "nw_i0_plot"
void main()
{
    object oPC = GetExitingObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
        SetLocalInt(oPC, "X1_NoraMustTalkTo", 1);


}
