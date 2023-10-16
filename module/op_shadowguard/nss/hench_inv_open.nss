#include "nw_i0_plot"

void main()
{
    object oHench = OBJECT_SELF;
    object oPC = GetPCSpeaker();

    object oStore = GetObjectByTag("MT_" + GetTag(oHench));

    AssignCommand(oStore, JumpToLocation(GetLocation(oHench)));

    DelayCommand(1.0, gplotAppraiseOpenStore(oStore, oPC));
}
