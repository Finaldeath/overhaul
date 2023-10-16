// Spawns in the assassin drider - once for the entire area

#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_ASSASSIN_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_ASSASSIN_ONCE", 1);

    object oWP = GetNearestObjectByTag("q6f_wp_assassin_sp");
    object oDrider = CreateObject(OBJECT_TYPE_CREATURE, "q6_dirderassa", GetLocation(oWP), TRUE);
    AssignCommand(oDrider, DetermineCombatRound());
}
