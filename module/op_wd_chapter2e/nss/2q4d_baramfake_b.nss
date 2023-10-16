//::///////////////////////////////////////////////
//:: Sewer Door On Spell Cast At
//:: 2Q4E_baramfake_B
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the image is attacked then the Baram faction
    will go hostile. Also update journal entry
    accordingly.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
#include "NW_I0_GENERIC"
void MobAttack(string sTag);
void main()
{
    if(GetLastSpellHarmful())
    {
        object oTarget = GetLastSpellCaster();
        object oDoor = GetNearestObjectByTag("2Q4E_OuterDoor");
        if(GetIsObjectValid(oTarget) && GetIsObjectValid(oDoor))
        {
            SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);
            object oBaram = GetObjectByTag("2Q4E_Baram_02");
            AdjustReputation(oTarget, oDoor, -100);
            if(GetIsObjectValid(oBaram))
            {
                MobAttack("2Q4E_CurstRogue");
                MobAttack("2Q4E_BaramGhoul");

                SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
                AssignCommand(oBaram, ActionPlayAnimation(ANIMATION_FIREFORGET_TAUNT));
                effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oBaram);
                DestroyObject(oBaram, 1.0);
                object oDoor = GetNearestObjectByTag("2Q4E_OuterDoor");
                AssignCommand(oDoor, ActionOpenDoor(oDoor));
                SetLocalPlotIntOnCharacter(OBJECT_SELF, TRUE);
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
    }
}

void MobAttack(string sTag)
{
    object oCritter = GetNearestObjectByTag(sTag);
    int nCnt = 2;

    while(GetIsObjectValid(oCritter) && GetDistanceToObject(oCritter) < 20.0)
    {
        AssignCommand(oCritter, DetermineCombatRound());
        nCnt++;
        oCritter = GetNearestObjectByTag(sTag,OBJECT_SELF, nCnt);
    }
}
