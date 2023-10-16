//::///////////////////////////////////////////////
//:: Fake Kurth On Spell Cast At
//:: 2Q4D_KURTHFAKE_B
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the image is attacked then the Kurth faction
    will go hostile. Update the journal entries
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
        if(GetLastSpellHarmful())
        {
            object oTarget = GetLastSpellCaster();
            object oDoor = GetNearestObjectByTag("2Q4D_HarbDoor");
            if(GetIsObjectValid(oTarget) && GetIsObjectValid(oDoor))
            {
                SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT);

                object oKurth = GetObjectByTag("2Q4D_Kurth_02");
                AdjustReputation(oTarget, oDoor, -100);
                if(GetIsObjectValid(oKurth))
                {
                    AssignCommand(oKurth, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT));
                    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oKurth);
                    DestroyObject(oKurth, 1.0);
                    object oDoor = GetNearestObjectByTag("2Q4D_HarbDoor");
                    AssignCommand(oDoor, ActionOpenDoor(oDoor));
                    SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
                }

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
            }
        }
    }
}
