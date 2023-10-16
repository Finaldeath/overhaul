#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, "N_ST_0_BLOOD_OFFERING", 2);

    AdjustAlignmentNeutral(oPC, 3);
}
