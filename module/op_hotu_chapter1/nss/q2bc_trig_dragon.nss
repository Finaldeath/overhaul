//::///////////////////////////////////////////////
//:: Name: q2bc_trig_dragon
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Wake up the dragon.
    Effects on and destroy all triggers.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 12/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "x2_inc_plot"

void main()
{

    //Do nothing if the dragon is already dead.
    object oDragon = GetNearestObjectByTag("q2bc_dragon");
    if (GetIsObjectValid(oDragon) == FALSE || GetIsDead(oDragon) == TRUE)
        return;

    if (GetLocalInt(GetModule(), "X2_Q2BDragonAwake") == 1)
        return;

    object oPC = GetEnteringObject();

    if (GetObjectType(oPC) != OBJECT_TYPE_CREATURE)
        return;

    // * Sep 30 2003 -- don't wake trigger
    // * unless player is the one to do it.
    //Associates will trigger the trap
    //Why not anyone (except the dragon) triggers the trigger)
    if (GetTag(oPC) == "q2bc_dragon")       //FALSE || GetIsObjectValid(GetMaster(oPC)) == TRUE)
    {
        return;
    }

    SetLocalInt(GetModule(), "X2_Q2BDragonAwake", 1);

    //close and lock the front and back doors(till after the dragon dies)
    object oDoor = GetObjectByTag("q2bdragondoor");
    AssignCommand(oDoor, ActionCloseDoor(oDoor));
    SetLocked(oDoor, TRUE);

    object oDoor2 = GetObjectByTag("q2bgrimdoor");
    AssignCommand(oDoor2, ActionCloseDoor(oDoor2));
    SetLocked(oDoor2, TRUE);

    MoveAllAssociatesTo(oPC, oPC);

    //Destroy all the triggers with puffs of smoke
    effect eVis = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
    int nCount = 0;
    float fDelay;
    location lLoc;
    object oTrigger = GetObjectByTag("q2bdragontrig", nCount);
    while (oTrigger != OBJECT_INVALID)
    {
        fDelay = IntToFloat(Random(20)) / 10.0;
        lLoc = GetLocation(oTrigger);
        DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc));

        DestroyObject(oTrigger, 2.0);

        nCount++;
        oTrigger = GetObjectByTag("q2bdragontrig", nCount);
    }

    //wake up the dragon

    SetPlotFlag(oDragon, FALSE);
    effect ePetrify = GetFirstEffect(oDragon);
    while (GetIsEffectValid(ePetrify) == TRUE)
    {
        RemoveEffect(oDragon, ePetrify);
        ePetrify = GetNextEffect(oDragon);
    }
    SetCommandable(TRUE, oDragon);
    AssignCommand(oDragon, ClearAllActions());
    PlayVoiceChat(VOICE_CHAT_BATTLECRY1, oDragon);
    AssignCommand(oDragon, ActionDoCommand(DetermineCombatRound(oPC)));

}
