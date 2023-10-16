//::///////////////////////////////////////////////
//:: m2q3H Guardian Spirit Action Script #4
//:: m2q3H_GuardianA4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The guardian spirit takes Quint's oath.
;*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Jan 28, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oQuintOath = GetItemPossessedBy(oPC,"M2Q3_OATHQUINT");

    ActionTakeItem(oQuintOath, oPC);

    SetLocalInt(OBJECT_SELF, "QuintOath", TRUE);
}
