#include "nw_i0_plot"
void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oKipper = GetNearestObjectByTag("q2_kipper");
    object oUrko = GetNearestObjectByTag("Q2_URKO");
    if(oKipper == OBJECT_INVALID || GetIsInCombat(oKipper) || oUrko == OBJECT_INVALID || GetIsInCombat(oUrko))
        return;

   AssignCommand(oKipper, ActionStartConversation(oUrko, "q2_kipper_urko"));

}
