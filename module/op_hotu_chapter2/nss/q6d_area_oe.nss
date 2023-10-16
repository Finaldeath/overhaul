// Wizard tower any level on-enter
// - Activate wild-magic zone

#include "x2_inc_switches"
#include "nw_i0_generic"


void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    SetModuleOverrideSpellscript("q6_wild_magic");
    SetLocalInt(OBJECT_SELF, "X2_L_WILD_MAGIC", 1);

    int nDoOnce = GetLocalInt(GetModule(), "Q6D_DO_DROW_FIGHT_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetModule(), "Q6D_DO_DROW_FIGHT_ONCE", 1);

    object oDrow = GetNearestObjectByTag("q6_RSCleric", oPC);
    object oBalor = GetNearestObjectByTag("NW_DEMON", oPC);

    AdjustReputation(oDrow, oBalor, -100);
    AdjustReputation(oBalor, oDrow, -100);

    AssignCommand(oDrow, DetermineCombatRound());
    AssignCommand(oBalor, DetermineCombatRound());


}
