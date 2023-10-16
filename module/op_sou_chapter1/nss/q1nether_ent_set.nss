//Set variable for farmhand ambush trigger
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            SetLocalInt(GetModule(), "X1_PCVISITQ1NETHERCAVE", 1);
        }
        SetLocalInt(oPC, "X1_PCKNOWSKOBOLDCAVE", 1);
    }
}
