#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
        SetLocalInt(GetArea(OBJECT_SELF), "Q5A_CAN_BLOW_BARRELS", 0);
}
