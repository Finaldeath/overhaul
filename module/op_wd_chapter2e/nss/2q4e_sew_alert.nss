//::///////////////////////////////////////////////
//:: Harbor Door Secret On Area Transition
//:: 2Q4A_KurthSecret
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the door is used the Kurth Faction Will
    Turn Hostile. Also update the appropriate
    journal entries.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void main()
{
    object oSewerDoor = GetObjectByTag("2Q4E_OuterDoor");
    ActionOpenDoor(oSewerDoor);

    object oTarget = GetEnteringObject();
    AdjustReputation(oTarget, OBJECT_SELF, -100);
    object oBaram = GetObjectByTag("2Q4E_Baram_02");
    if(GetIsObjectValid(oBaram))
    {
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oBaram);
        DestroyObject(oBaram, 1.0);
        ActionOpenDoor(OBJECT_SELF);
        SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
        DestroyObject(OBJECT_SELF, 0.5);
    }

    int iMainState = GetLocalInt(oTarget, "NW_JOURNAL_ENTRYm2q4_Main");

    if (iMainState < 40)
    {
        AddJournalQuestEntry("m2q4_Main", 50, oTarget);
    }

    if (iMainState == 40)
    {
        AddJournalQuestEntry("m2q4_Main", 60, oTarget);
    }
}
