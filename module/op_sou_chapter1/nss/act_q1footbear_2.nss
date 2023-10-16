//::///////////////////////////////////////////////
//:: Name act_q1footbear_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC saves the bear - make the bad bear
    encounters later on in the foothils into
    neutral bear encounters...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 21/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oBearEnc1 = GetObjectByTag("q1foot_meanbear1");
    object oBearEnc2 = GetObjectByTag("q1foot_meanbear2");
    object oBearEnc3 = GetObjectByTag("q1foot_nicebear1");
    object oBearEnc4 = GetObjectByTag("q1foot_nicebear2");

    SetEncounterActive(FALSE, oBearEnc1);
    SetEncounterActive(FALSE, oBearEnc2);
    SetEncounterActive(TRUE, oBearEnc3);
    SetEncounterActive(TRUE, oBearEnc4);

    //Let bear stand up..
    effect eEffect = GetFirstEffect(OBJECT_SELF);
    RemoveEffect(OBJECT_SELF, eEffect);

    ActionRandomWalk();
    SetCommandable(FALSE);
    DestroyObject(OBJECT_SELF, 4.0);

    if (GetLocalInt(oPC, "X1_SavedQ1FootBear") != 1)
    {
        AdjustAlignment(oPC, ALIGNMENT_GOOD, 2);
        GiveXPToCreature(oPC, 100);
        SetLocalInt(oPC, "X1_SavedQ1FootBear", 1);
    }
    SetLocalInt(GetModule(), "X1_PCSavedBear", 1);
}
