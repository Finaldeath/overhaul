//::///////////////////////////////////////////////
//:: Name q2a_death_gate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On death of the gate - have the army attack
    the inner gates..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August     28/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
#include "x2_inc_plot"
#include "nw_i0_plot"

void AllRebelsAttack();

void main()
{
    //Do nothing if this is destroyed by the Betrayal Cutscene
    if (GetLocalInt(GetModule(), "X2_Q2ARebelsBetrayed") == 1)
        return;

    if (GetLocalInt(OBJECT_SELF, "nDoOnce") == 1)
        return;

    PlaySound("as_cv_belltower3");

    SetLocalInt(GetModule(), "X2_Q2ABattle1_Gate1Open", 1);
    //object oCreature = GetFirstObjectInArea();
    object oGate2 = GetObjectByTag("q2ainnergate");
    AssignCommand(oGate2, ActionCloseDoor(oGate2));
    SetLocked(oGate2, TRUE);
    SetPlotFlag(oGate2, FALSE);


    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_SIGNAL_ALL_ADVANCE));

    object oHerald = GetObjectByTag("q2aherald");
    AssignCommand(oHerald, PlaySpeakSoundByStrRef(85751)); //"The outer gates have been breached!"

    AllRebelsAttack();

}
void AllRebelsAttack()
{
    object oTarget;
    string szTag;
    object oRebel = GetFirstObjectInArea();
    while (GetIsObjectValid(oRebel) == TRUE)
    {
        szTag = GetTag(oRebel);
        if (GetStringLeft(szTag, 10) == "q2abat1reb")
        {
            oTarget = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oRebel);
            AssignCommand(oRebel, ActionAttack(oTarget));
        }
        oRebel = GetNextObjectInArea();
    }
}
