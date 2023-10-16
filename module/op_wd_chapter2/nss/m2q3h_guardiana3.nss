//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #3
//:: m2q3H_GuardianA3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guardian spirit takes the oaths of both
    brothers.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oQuintOath = GetItemPossessedBy(oPC,"M2Q3_OATHQUINT");
    object oKarlatOath = GetItemPossessedBy(oPC,"M2Q3_OATHKARLAT");

    ActionTakeItem(oQuintOath, oPC);
    ActionTakeItem(oKarlatOath, oPC);

    SetLocalInt(OBJECT_SELF, "QuintOath", TRUE);
    SetLocalInt(OBJECT_SELF, "KarlatOath", TRUE);
}
