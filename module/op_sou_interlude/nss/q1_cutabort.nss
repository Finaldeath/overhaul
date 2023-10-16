//::///////////////////////////////////////////////
//:: Name  q1_cutabort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Cutscene 1 - Manticore Emerges from lair
    If aborted by the lead PC - destroy inv pc, and bring the manticore
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 124/3/2003
//:://////////////////////////////////////////////
#include "nw_i0_tool"
#include "x1_inc_cutscene"
#include "nw_i0_generic"

void RemoveEffects(object oCreature)
{
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if(GetEffectCreator(eEff1) == GetLocalObject(GetModule(), "Q1_CUTSCENE_OBJECT"))
            RemoveEffect(oCreature, eEff1);
        eEff1 = GetNextEffect(oCreature);
    }
}

void UnfreezeAll(object oPC)
{
    int n;
    object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
    while (oCreature != OBJECT_INVALID)
    {
        RemoveEffects(oCreature);
        oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oPC, n);
        n++;
    }
}

void CloseDoor(object oDoor, object oPC)
{
    AssignCommand(oDoor, ActionCloseDoor(oDoor)); // close southern door
    SetLocked(oDoor, TRUE);
    AssignCommand(oPC, PlaySound("as_dr_woodvlgcl1"));
}


void ManticoreAttack(object oManticore, object oPC)
{
    object oPlayer = GetFirstPC();
    while(oPlayer != OBJECT_INVALID)
    {
        AdjustReputation(oPlayer, oManticore, -100);
        AdjustReputation(oManticore, oPlayer, -100);
        oPlayer = GetNextPC();
    }
    AssignCommand(oManticore, ActionMoveToObject(GetFirstPC(), TRUE, 15.0));
    AssignCommand(oManticore, DetermineCombatRound(GetFirstPC()));
}

void DestroyPCCopy()
{
    object oCopy = GetLocalObject(GetModule(), "Q1_PC_COPY");
    SetPlotFlag(oCopy, FALSE);
    DestroyObject(oCopy);
}

void main()
{
    object oManticore = GetObjectByTag("Q1_MANTICORE");
    object oDoor1 = GetObjectByTag("Q1_MANTICORE_DOOR1");
    object oDoor2 = GetObjectByTag("Q1_MANTICORE_DOOR2");
    object oDoor3 = GetObjectByTag("Q1_MANTICORE_DOOR3");
    object oWP = GetWaypointByTag("Q1_WP_MANTICORE_RUN");

    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {

        CutFadeOutAndIn(1, 0.0, oPC, FALSE);
        DelayCommand(0.5, RemoveEffects(oPC));
        UnFreezeAssociate(oPC);
        CutRestoreLocation(1, 0.2, oPC);
        //CutRemoveEffects(1, 1.0, oPC);
        CutSetCutsceneMode(1, 1.0, oPC, FALSE);
        if (GetLocalInt(oPC, "nCutsceneNumber") == 1)
        {
            DelayCommand(1.5, AssignCommand(oPC, ClearAllActions()));
            CloseDoor(oDoor1, oPC);
            CloseDoor(oDoor2, oPC);
            AssignCommand(oDoor3, ActionOpenDoor(oDoor3));
            AssignCommand(oManticore, ClearAllActions());
            AssignCommand(oManticore, JumpToObject(oWP));
        }
        DelayCommand(1.3, SetLocalInt(oPC, "nCutsceneNumber", 0));
        oPC = GetNextPC();
    }
    oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oManticore);
    DelayCommand(3.5, ManticoreAttack(oManticore, oPC));
    DelayCommand(2.0, DestroyPCCopy());
    DelayCommand(2.5, UnfreezeAll(oPC));

    SetLocalInt(GetModule(), "X1_CUT1RUNNING", 2); // change cutscene status
}

