#include "help_general"

void main()
{
    object oLyen = GetNearestObjectByTag("CS_OP_HENCH_LYEN");

    object oGuard = GetNearestObjectByTag("CT_COMM_SH_STG1_2", oLyen);

    AssignCommand(oLyen, ActionEquipMostDamagingRanged());

    ChangeToStandardFaction(oGuard, STANDARD_FACTION_HOSTILE);

    DelayCommand(2.0, AssignCommand(oLyen, ActionAttack(oGuard)));

    DelayCommand(3.0, MyApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oGuard));
}
