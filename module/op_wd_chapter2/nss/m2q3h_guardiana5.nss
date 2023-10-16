//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #5
//:: m2q3H_GuardianA5
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guardian spirit takes Karlat's oath.
;*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oKarlatOath = GetItemPossessedBy(oPC,"M2Q3_OATHKARLAT");

    ActionTakeItem(oKarlatOath, oPC);

    SetLocalInt(OBJECT_SELF, "KarlatOath", TRUE);
}

