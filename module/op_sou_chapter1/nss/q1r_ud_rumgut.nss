//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: FileName  q1r_ud_rumgut
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Rumgut's User Defined - on Death - set a variable
    for Becka's conversation
    On attacked - see if PC was in the cage and if
    so, have Rumgut destroy the cage..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 8 / 03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
int GetIsInTrigger(object oTrigger, object oCreature);
void WakeGiant(object oGiant, object oPlayer);
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        //SpeakString("BeckaDied: " + IntToString(GetLocalInt(GetModule(),"X1_BECKADIED")));
        if (GetLocalInt(GetModule(), "X1_BECKADIED") == 10 && GetLocalInt(OBJECT_SELF, "nAvengeWife") != 1 && GetLocalInt(OBJECT_SELF, "X1_RumgutDrunk") != 1 && GetLocalInt(GetModule(), "X1_nRumgutSleep") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nAvengeWife", 1);
            //If she's in the cave - Rumgut will attack the killer
            object oCage = GetObjectByTag("q1rumgut_range_trigger");
            object oPC = GetLocalObject(GetModule(), "Q1RBECKAKILLER");
            SetIsTemporaryEnemy(oPC, OBJECT_SELF);
            SpeakStringByStrRef(40305);
            if (GetIsInTrigger(oCage, oPC) == TRUE)
            {
                //SendMessageToPC(GetFirstPC(), "Should be destroying cage");
                SetLocalInt(OBJECT_SELF, "nAttacked", 1);
                object oDoor1 = GetObjectByTag("q1rumgutcage1");
                object oDoor2 = GetObjectByTag("q1rumgutcage2");
                object oDoor3 = GetObjectByTag("q1rumgutcage3");
                object oDoor4 = GetObjectByTag("q1rumgutcage4");
                object oDoor5 = GetObjectByTag("q1rumgutcage5");
                object oDoor6 = GetObjectByTag("q1rumgutcage6");
                object oDoor7 = GetObjectByTag("q1rumgutcage7");
                SetPlotFlag(oDoor1, FALSE);
                SetPlotFlag(oDoor2, FALSE);
                SetPlotFlag(oDoor3, FALSE);
                SetPlotFlag(oDoor4, FALSE);
                SetPlotFlag(oDoor5, FALSE);
                SetPlotFlag(oDoor6, FALSE);
                SetPlotFlag(oDoor7, FALSE);
                effect eDamage = EffectDamage(30);
                AssignCommand(OBJECT_SELF, ActionAttack(oDoor4));

                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor1));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor2));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor3));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor4));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor5));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor6));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor7));

                DelayCommand(6.0, AssignCommand(OBJECT_SELF, ActionAttack(oPC)));
            }
            else
            {
                ActionAttack(oPC);
            }
        }
        else if (GetLocalInt(OBJECT_SELF, "X1_RumgutDrunk") == 1 || GetLocalInt(GetModule(), "X1_nRumgutSleep") == 1)
        {

            effect eVis = EffectVisualEffect(VFX_IMP_SLEEP);
            if(d10() > 6)
            {
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, OBJECT_SELF);
            }
        }


    }
        //if attacked or harmful spell cast at...
    else if(nUser == 1005 || (nUser == EVENT_SPELL_CAST_AT && GetLastSpellHarmful())) // ATTACKED
    {
        if(GetLocalInt(OBJECT_SELF, "nAttacked") != 1)
        {
            SetLocalInt(OBJECT_SELF, "X1_RumgutDrunk", 0);
            SetLocalInt(GetModule(), "X1_nRumgutSleep", 0);
            object oPC;
            if (nUser == 1005)
            {
                oPC = GetLastHostileActor();
            }
            else
            {
                oPC = GetLastSpellCaster();
            }
            if (GetLocalInt(GetModule(), "X1_Q1RuralRebCooking") == 2 && GetLocalInt(GetModule(), "X1_nRumgutSleep") == 1)
            {
                WakeGiant(OBJECT_SELF, oPC);
            }
            object oCage = GetObjectByTag("q1rumgut_range_trigger");
            if (GetIsInTrigger(oCage, oPC) == TRUE)
            {

                SetLocalInt(OBJECT_SELF, "nAttacked", 1);
                SetLocalInt(OBJECT_SELF, "X1_RumgutDrunk", 0);
                object oDoor1 = GetObjectByTag("q1rumgutcage1");
                object oDoor2 = GetObjectByTag("q1rumgutcage2");
                object oDoor3 = GetObjectByTag("q1rumgutcage3");
                object oDoor4 = GetObjectByTag("q1rumgutcage4");
                object oDoor5 = GetObjectByTag("q1rumgutcage5");
                object oDoor6 = GetObjectByTag("q1rumgutcage6");
                object oDoor7 = GetObjectByTag("q1rumgutcage7");
                SetPlotFlag(oDoor1, FALSE);
                SetPlotFlag(oDoor2, FALSE);
                SetPlotFlag(oDoor3, FALSE);
                SetPlotFlag(oDoor4, FALSE);
                SetPlotFlag(oDoor5, FALSE);
                SetPlotFlag(oDoor6, FALSE);
                SetPlotFlag(oDoor7, FALSE);
                effect eDamage = EffectDamage(50);
                AssignCommand(OBJECT_SELF, ActionAttack(oDoor4));

                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor1));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor2));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor3));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor4));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor5));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor6));
                DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oDoor7));

                //move rebecca out of the way
                object oFlee = GetWaypointByTag("wp_rumcave_beckacower");
                object oRebecca = GetObjectByTag("q1ruralrebecca");
                AssignCommand(oRebecca, ActionMoveToObject(oFlee));
            }
        }
    }
    else if(nUser == 1007) // DEATH
    {
        SetLocalInt(GetModule(), "X1_RUMGUTDEAD", 1);
    }


}

int GetIsInTrigger(object oTrigger, object oCreature)
{
    object oTest = GetFirstInPersistentObject(oTrigger);
    while (oTest != OBJECT_INVALID)
    {
        if (GetName(oCreature) == GetName(oTest))
            return TRUE;
        oTest = GetNextInPersistentObject(oTrigger);
    }
    return FALSE;
}


void WakeGiant(object oGiant, object oPlayer)
{

    effect eEff1 = GetFirstEffect(oGiant);
    while(GetIsEffectValid(eEff1))
    {
        RemoveEffect(oGiant, eEff1);
        eEff1 = GetNextEffect(oGiant);
    }
    object oRebecca = GetObjectByTag("q1ruralrebecca");
    if (GetTag(GetArea(oRebecca)) == "q1krumgut")
    {
        DelayCommand(0.5, AssignCommand(oGiant, PlayAnimation(ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 1.0, 0.1)));
        DelayCommand(1.0, AssignCommand(oGiant, SpeakStringByStrRef(40306)));
    }
    else
    {
        ChangeToStandardFaction(oGiant, STANDARD_FACTION_HOSTILE);
        DelayCommand(1.0, AssignCommand(oGiant, SpeakStringByStrRef(40307)));
        AssignCommand(oGiant, DetermineCombatRound(oPlayer));
    }
    SetLocalInt(GetModule(), "X1_nRumgutSleep",2);
}


