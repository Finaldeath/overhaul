// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    string s = GetJournalQuest(GetTag(OBJECT_SELF));;

    AddJournalSingle(s, 1, GetPCSpeaker());

    object oTable;

    object oChair;

    oTable = GetNearestObjectByTag("PT_TABLE");

    if (GetDistanceBetween(OBJECT_SELF, oTable) < 10.0)
    {
        SetPlotFlag(oTable, FALSE);

        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(50, DAMAGE_TYPE_DIVINE), oTable);

        AssignCommand(OBJECT_SELF, ClearAllActions());

        AssignCommand(GetPCSpeaker(), ClearAllActions());

        object oBrukus = GetNearestObjectByTag("HENCH_BRUK");

        AssignCommand(oBrukus, ClearAllActions());

        AssignCommand(oBrukus, ActionEquipMostDamagingMelee());
    }

    oTable = GetNearestObjectByTag("WP_PT_TABLE");

    oChair = GetNearestObjectByTag("PT_PC_SITTING_CHAIR", oTable);

    if (GetDistanceBetween(oTable, oChair) < 10.0)
        DestroyObject(oChair);

    oChair = GetNearestObjectByTag("PT_HENCH_TARI", oTable);

    if (GetDistanceBetween(oTable, oChair) < 10.0)
        DestroyObject(oChair, 1.0);

    oChair = GetNearestObjectByTag("PT_HENCH_BRUK", oTable);

    if (GetDistanceBetween(oTable, oChair) < 10.0)
        DestroyObject(oChair, 2.0);

    oChair = GetNearestObjectByTag("PT_CT_UNIQ_NT_GHAN", oTable);

    if (GetDistanceBetween(oTable, oChair) < 10.0)
        DestroyObject(oChair, 3.0);
}
