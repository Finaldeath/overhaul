//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 Place in the OnUserDefinedEvent handler for
 the appropriate creature, then edit that
 creature's OnSpawn script to generate any of
 the desired events.
*/

#include "nw_i0_generic"
#include "x2_inc_cutscene"
#include "nw_i0_plot"
#include "x2c2_inc_plot"
#include "x2_inc_globals"

int CUTSCENE_NUMBER = 38;

void RemoveEffects2(object oObject)
{
    effect e = GetFirstEffect(oObject);
    while(GetIsEffectValid(e))
    {
        RemoveEffect(oObject, e);
        e = GetNextEffect(oObject);
    }
}

void RemoveAOE()
{
    object oObject = GetFirstObjectInArea(GetArea(OBJECT_SELF));
    while(oObject != OBJECT_INVALID)
    {

        if(GetObjectType(oObject) == OBJECT_TYPE_AREA_OF_EFFECT)
            DestroyObject(oObject);
        oObject = GetNextObjectInArea(GetArea(OBJECT_SELF));
    }
}

void TryToTalk(object oDeva, object oPC)
{
    if(IsInConversation(oDeva))
        return;

    AssignCommand(oDeva, ActionStartConversation(oPC));
}

void DevaTalk()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    object oDeva = GetObjectByTag("q3c_Lavoera");
    if(GetMaster(oDeva) != OBJECT_INVALID && GetArea(oDeva) == GetArea(OBJECT_SELF))
    {
        RemoveEffects2(oDeva);
        RemoveAOE();
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oDeva, ClearAllActions(TRUE));
        SetLocalInt(oDeva, "DRAGON_DEAD", 1);
        //CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
        //CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
        //CutDisableAbort(CUTSCENE_NUMBER);
        DelayCommand(6.0, PlayVoiceChat(VOICE_CHAT_TALKTOME, oDeva));
        //CutSetCutsceneMode(0.0, oPC, TRUE, FALSE, TRUE, FALSE);
        //CutSetActiveCutsceneForObject(oDeva, CUTSCENE_NUMBER);
        DelayCommand(4.0, AssignCommand(oDeva, ActionForceMoveToObject(oPC, FALSE, 1.0, 3.0)));
        //CutActionStartConversation(5.0, oDeva, oPC, "q3san_deva");
        //CutDisableCutscene(CUTSCENE_NUMBER, 0.0, 0.0, RESTORE_TYPE_NONE);
        DelayCommand(5.0, TryToTalk(oDeva, oPC));
        DelayCommand(10.0, TryToTalk(oDeva, oPC));
        DelayCommand(15.0, TryToTalk(oDeva, oPC));
        DelayCommand(20.0, TryToTalk(oDeva, oPC));
    }

}

void ReviveGolems()
{
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_REVIVE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_REVIVE_ONCE", 1);

    int i = 0;
    object oGolem = GetObjectByTag("q3d_golem", 0);
    effect eVis = EffectVisualEffect(VFX_IMP_HARM);
    while(oGolem != OBJECT_INVALID)
    {
        SetCommandable(TRUE, oGolem);
        AssignCommand(oGolem, DetermineCombatRound());
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oGolem);
        i++;
        oGolem = GetObjectByTag("q3d_golem", i);
    }

}

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(GetIsDead(OBJECT_SELF))
         return;


    if (nEvent == EVENT_HEARTBEAT) {
        if(GetLocalInt(GetArea(OBJECT_SELF), "COMBAT_STARTED") == 0)
            return;
        if(!GetIsInCombat(OBJECT_SELF))
        {
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            if(oPC == OBJECT_INVALID || GetArea(oPC) != GetArea(OBJECT_SELF))
                return;
            SetLocalInt(GetArea(OBJECT_SELF), "COMBAT_STARTED", 0);
            object oWP = GetNearestObjectByTag("q3d_wp_draco_jump", oPC);
            DelayCommand(12.0, SetLocalInt(GetArea(OBJECT_SELF), "COMBAT_STARTED", 1));
            effect eJump = EffectDisappearAppear(GetLocation(oWP));
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, OBJECT_SELF, 3.0);
        }

    } else if (nEvent == EVENT_PERCEIVE) {

    } else if (nEvent == EVENT_DIALOGUE) {

    } else if (nEvent == EVENT_DISTURBED) {

    } else if (nEvent == EVENT_ATTACKED) {

    } else if (nEvent == EVENT_DAMAGED) {

        if(GetCurrentHitPoints(OBJECT_SELF) == 1)
        {
            int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_DIE_ONCE");
            if(nDoOnce == 1)
                return;
            SetLocalInt(OBJECT_SELF, "DO_DIE_ONCE", 1);

            int nTimesDied = GetLocalInt(GetArea(OBJECT_SELF), "TIMES_DIED");
            nTimesDied++;
            SetLocalInt(GetArea(OBJECT_SELF), "TIMES_DIED", nTimesDied);
            object oPhyl = GetNearestObjectByTag("q3d_phylactery");
            if(oPhyl == OBJECT_INVALID || nTimesDied == 4) // Final death
            {
                SetIsDestroyable(FALSE, FALSE, FALSE);
                SetImmortal(OBJECT_SELF, FALSE);
                effect eDeath = EffectDeath();
                effect eVis = EffectVisualEffect(VFX_FNF_PWKILL);
                effect eVis2 = EffectVisualEffect(248);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
                ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eVis2, GetLocation(OBJECT_SELF), 6.0);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, OBJECT_SELF);
                SetLocalInt(GetModule(), "Q3_DRACOLICH_DEAD", 1); // this var is needed for dialoges in chapter 2
                Reward_2daXP(GetFirstPC(), 28);
                SetLocalInt(GetModule(), "bDracolichKilled", 1); // this var is needed for chapter 3
                SetGlobalInt("x2_plot_undead_out", 1);
                SetPlot("q3_dracolich", 60);
                SetPlot("q2_undead", 60);
                DevaTalk();
            }
            else // find a new body
            {
                object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

                SetLocalObject(GetArea(OBJECT_SELF), "CUTSCENE_DRACO", OBJECT_SELF);
                SetLocalObject(GetArea(OBJECT_SELF), "CUTSCENE_PC", oPC);
                SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));

            }
        }
        /*else if(GetCurrentHitPoints(OBJECT_SELF) < 150)
        {
            object oPC = GetLastDamager();
            object oWP = GetNearestObjectByTag("q3d_wp_jump_away", OBJECT_SELF, 2);
            effect eJump = EffectDisappearAppear(GetLocation(oWP));
            effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eJump, OBJECT_SELF, 2.0);
            DelayCommand(2.0, AssignCommand(oPC, PlaySound("c_dragnold_bat2")));
            DelayCommand(2.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, GetLocation(oPC)));
        }*/

    } else if (nEvent == EVENT_END_COMBAT_ROUND) {
        ReviveGolems();

    } else if (nEvent == EVENT_SPELL_CAST_AT) {

    }

}


