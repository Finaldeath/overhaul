//::///////////////////////////////////////////////
//:: Default: On User Defined
//:: q1_stingerarc_ud
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    on a user defined event.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 18/3/2003
//:://////////////////////////////////////////////

#include "nw_i0_generic"
#include "nw_i0_plot"

void DigOut(object oWP)
{
    if(GetIsDead(OBJECT_SELF))
        return;
    effect eDust = EffectVisualEffect(137);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, GetLocation(oWP));
    DelayCommand(0.5, JumpToObject(oWP));
    DelayCommand(0.8, DetermineCombatRound());

}

void DigIn()
{
    effect eDust = EffectVisualEffect(137);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, GetLocation(OBJECT_SELF));
    object oWP = GetWaypointByTag("Q1_WP_JUMP_BETWEEN");
    JumpToObject(oWP);
    //CreateObject(OBJECT_TYPE_PLACEABLE, "q1_hole1", GetLocation(OBJECT_SELF));
}

void main()
{
    // enter desired behaviour here
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == EVENT_HEARTBEAT || nEvent == EVENT_DAMAGED || nEvent == EVENT_ATTACKED ||
            nEvent == EVENT_END_COMBAT_ROUND)
    {
        // Whenvenr a player gets too close - dig in the ground, find the next place to dig out,
        // dig out and resume attack.
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
        if(!GetIsPlayerCharacter(oCreature) && !(GetMaster(oCreature) != OBJECT_INVALID))
            return;
        float fDistance = GetDistanceBetween(OBJECT_SELF, oCreature);
        if(fDistance > 10.0 || !GetIsInCombat())
            return;

        int nJumpCount = GetLocalInt(OBJECT_SELF, "Q1_JUMP_COUNT");
        string sWPTag = "Q1_WP_NEXT_" + GetTag(OBJECT_SELF) + IntToString(nJumpCount);
        object oWP = GetWaypointByTag(sWPTag);
        if(oWP == OBJECT_INVALID)
            return;
        nJumpCount++;
        SetLocalInt(OBJECT_SELF, "Q1_JUMP_COUNT", nJumpCount);

        int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE_JUMP" + IntToString(nJumpCount));
        if(nDoOnce == 1)
            return;
        SetLocalInt(OBJECT_SELF, "DO_ONCE_JUMP" + IntToString(nJumpCount), 1);

        DigIn();
        DelayCommand(2.5, DigOut(oWP));
    }
    return;

}
