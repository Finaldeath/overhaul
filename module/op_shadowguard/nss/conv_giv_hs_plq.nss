#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    string sPTag = GetLocalString(oPC, "S_HS_STAT_TO_GIVE");

    object oPlaque = GetItemPossessedBy(oPC, sPTag);

    if (oPlaque != OBJECT_INVALID)
    {
        AssignCommand(OBJECT_SELF, ActionTakeItem(oPlaque, oPC));

        SetLocalInt(OBJECT_SELF, "N_PLAQUE_PLACED", 1);
    }

    else
        TestMessage("[Problem with giving item : " + sPTag + ".]");
}
