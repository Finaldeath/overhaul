#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    int nDoOnce = GetLocalInt(OBJECT_SELF, "Q2_BLOCKADE_ONCE");
    if(nDoOnce == 1)
        return;
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "Q2_BLOCKADE_ONCE", 1);
        FloatingTextStrRefOnCreature(40410, oPC);
    }
}
