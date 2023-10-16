// Action taken for Ali: Ali attacks

#include "x1_inc_plot"
#include "nw_i0_generic"

void main()
{
    object oPC = GetFirstPC();
    while(oPC != OBJECT_INVALID)
    {
        AdjustReputation(OBJECT_SELF, oPC, -100);
        AdjustReputation(oPC, OBJECT_SELF, -100);
        SetIsTemporaryEnemy(oPC);
        oPC = GetNextPC();
    }

    ActionAttack(GetPCSpeaker());
    int n = 1;
    object oBedine = GetNearestObjectByTag("Q2A_BEDINE", OBJECT_SELF, n);
    while(oBedine != OBJECT_INVALID)
    {
        if(GetArea(oBedine) != GetArea(OBJECT_SELF))
            return;
        AssignCommand(oBedine, DetermineCombatRound());
        n++;
        oBedine = GetNearestObjectByTag("Q2A_BEDINE", OBJECT_SELF, n);
    }

}
