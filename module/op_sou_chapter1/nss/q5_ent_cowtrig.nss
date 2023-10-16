#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        FloatingTextStrRefOnCreature(40403, oPC);
        DestroyObject(OBJECT_SELF);
    }

}
