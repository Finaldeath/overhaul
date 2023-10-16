#include "help_general"
#include "help_hench"

void main()
{
    object o = GetPCSpeaker();
    AddJournalSingle("JT_ST_1_MAIN", 1, o);
    object oSpecial;

    oSpecial = GetNearestObjectByTag("CT_COMM_CF_FOLL", o);
    ChangeToStandardFaction(oSpecial, STANDARD_FACTION_HOSTILE);

    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), oSpecial);
    oSpecial = SpawnHenchman(o, "HENCH_MARK");

    AssignCommand(oSpecial, ActionEquipMostDamagingRanged());
    AssignCommand(oSpecial, ActionMoveToObject(o, TRUE, 4.0));

}
