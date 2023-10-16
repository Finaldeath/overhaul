#include "NW_I0_Plot"
void main()
{
    object oPC = GetPCSpeaker();

    SetLocalInt(oPC,"NW_L_M1S3Tests",20);

    AddJournalQuestEntry("m1q1_Cloaktower", 20, oPC);
    if(GetLocalInt(oPC,"NW_L_M1S3XPGivenMidway") == FALSE)
    {
        SetLocalInt(oPC,"NW_L_M1S3XPGivenMidway",TRUE);
        RewardXP("m1q1_Cloaktower",100,oPC,ALIGNMENT_NEUTRAL,FALSE);
    }

    DestroyObject(GetItemPossessedBy(oPC,"M1S03ICLAY"));
    DestroyObject(GetItemPossessedBy(oPC,"M1S03IFOG"));
    DestroyObject(GetItemPossessedBy(oPC,"M1S03IKINDLING"));
    DestroyObject(GetItemPossessedBy(oPC,"M1S03IFLASK"));
}
