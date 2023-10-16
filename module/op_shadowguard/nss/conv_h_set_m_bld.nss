#include "help_hench"

void main()
{
    SetLocalInt(OBJECT_SELF, "N_MIXED_BLOOD", 1);

    object oPC = GetPCSpeaker();

    int i = GetLocalInt(oPC, "N_SG_BLOOD_MIXED");

    i++;

    SetLocalInt(oPC, "N_SG_BLOOD_MIXED", i);

    if (i >= 5)
        AddJournalSingle("JT_ST_2_MAIN", 15, oPC);
}
