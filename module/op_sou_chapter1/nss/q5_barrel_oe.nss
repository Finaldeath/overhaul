// when entering trigger -> tell kobold to blow barrel
#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
      return;
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

        SetLocalInt(GetArea(OBJECT_SELF), "Q5A_CAN_BLOW_BARRELS", 1);

        //object oKobold = GetNearestObjectByTag("Q5_KOBOLD_BARREL");
        //object oBarrel = GetNearestObjectByTag("Q5_GREASE_BARREL");
        //AssignCommand(oKobold, ActionAttack(oBarrel));
    }
}
