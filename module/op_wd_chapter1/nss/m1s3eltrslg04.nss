#include "NW_I0_Plot"
void main()
{
    object oPC = GetPCSpeaker();

    CreateItemOnObject("nw_aarcl013",oPC);
    SetLocalInt(oPC,"NW_L_M1S3Tests",40);

    AddJournalQuestEntry("m1q1_Cloaktower", 30, oPC);
    RewardXP("m1q1_Cloaktower",100,oPC,ALIGNMENT_NEUTRAL,FALSE);

    DestroyObject(GetItemPossessedBy(oPC,"M1S03ICLAY"));
    DestroyObject(GetItemPossessedBy(oPC,"M1S03IFOG"));
    DestroyObject(GetItemPossessedBy(oPC,"M1S03IKINDLING"));
    DestroyObject(GetItemPossessedBy(oPC,"M1S03IFLASK"));
}

