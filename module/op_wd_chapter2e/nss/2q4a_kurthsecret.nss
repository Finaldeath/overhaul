//::///////////////////////////////////////////////
//:: Harbor Door Secret On Area Transition
//:: 2Q4A_KurthSecret
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the door is used the Kurth Faction Will
    Turn Hostile. Also update the journal
    accordingly.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void main()
{
    int nPlot = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4D_KURTH_HOSTILE");
    if(nPlot == 0)
    {
        object oHarborDoor = GetNearestObjectByTag("2Q4D_HarbDoor");
        ActionOpenDoor(oHarborDoor);
        object oTrigger = GetNearestObjectByTag("M2Q04EWEREMERC");

        if(GetIsObjectValid(oTrigger))
        {
            SetEncounterActive(TRUE, oTrigger);
        }
        object oOgre = GetWaypointByTag("2Q4D_SPAWN_01");
        if(GetIsObjectValid(oOgre))
        {
            CreateObject(OBJECT_TYPE_CREATURE, "2Q4_OGREGUARD", GetLocation(oOgre));
            CreateObject(OBJECT_TYPE_CREATURE, "2Q4_OGREGUARD", GetLocation(oOgre));
        }

        object oTarget = GetEnteringObject();
        AdjustReputation(oTarget, OBJECT_SELF, -100);

        object oKurth = GetNearestObjectByTag("2Q4D_Kurth_02");

//        AssignPCDebugString(IntToString(GetIsObjectValid(oKurth)));

        if(GetIsObjectValid(oKurth))
        {
            effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oKurth);
            DestroyObject(oKurth, 2.0);
            ActionOpenDoor(OBJECT_SELF);
            SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
            //Journal Entry
            int iMainState = GetLocalInt(oTarget, "NW_JOURNAL_ENTRYm2q4_Main");

            if (iMainState < 40)
            {
                AddJournalQuestEntry("m2q4_Main", 40, oTarget);
            }

            if (iMainState == 50)
            {
                AddJournalQuestEntry("m2q4_Main", 60, oTarget);
            }
            SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4D_KURTH_HOSTILE", 10);
            DestroyObject(OBJECT_SELF, 0.5);
        }
    }
}
