// give a pop-up clue to player

#include "nw_i0_plot"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    object oStatue = GetNearestObjectByTag("Q2E_STATUE_BANE");
    if(oStatue == OBJECT_INVALID || GetObjectType(oStatue) == OBJECT_TYPE_CREATURE)
        return;
    int nDoOnce = GetLocalInt(oPC, "Q2E_DO_STATUE_CLUE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(oPC, "Q2E_DO_STATUE_CLUE_ONCE", 1);

    AssignCommand(oPC, SpeakStringByStrRef(40573));
}
