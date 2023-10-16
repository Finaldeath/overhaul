// Cultists attack

#include "nw_i0_generic"

void main()
{
    object oPC = GetLastAttacker();
    PrintString("BOOM1 pc= " + GetName(oPC));;
    if(oPC == OBJECT_INVALID)
        oPC = GetLastOpenedBy();
    if(oPC == OBJECT_INVALID)
        oPC = GetLastKiller();
    if(oPC == OBJECT_INVALID)
        oPC = GetLastSpellCaster();

    if(oPC == OBJECT_INVALID || !GetIsPC(oPC))
        return;
    PrintString("BOOM2 pc= " + GetName(oPC));
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oCultist1 = GetNearestObjectByTag("q3a_cultist1");
    object oCultist2 = GetNearestObjectByTag("q3a_cultist2");


    AdjustReputation(oCultist1, oPC, -100);
    AdjustReputation(oPC, oCultist1, -100);
    AssignCommand(oCultist1, DetermineCombatRound(oPC));
    AssignCommand(oCultist2, DetermineCombatRound(oPC));
    SetLocalInt(GetModule(), "q3_NoCutscene", 1);
}
