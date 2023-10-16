//::///////////////////////////////////////////////
//:: Name  q2d4_enter_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set Slave rebellion variable.

    Check to see if the PC is coming from the
    illusionary forest - check for henchmen that
    were left behind
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 1/03
//:://////////////////////////////////////////////
#include "x0_i0_henchman"
void MakeAreaNeutral(object oPC);
void HireAllHenchmen(object oPC);
void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    //AUTOSAVE
    if (GetLocalInt(OBJECT_SELF, "nAutoSave") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nAutoSave", 1);
        DoSinglePlayerAutoSave();
    }

    //if the gladiators are waiting for the PC to get here,
    //set variable so that they will now attack
    if (GetLocalInt(GetModule(), "X2_Q2DSlaveUprising") == 1)
    {
        SetLocalInt(GetModule(), "X2_Q2DSlaveUprising", 2);
    }

    //if the PC has saved and loaded in the midst of conversation with the brain
    //restart the conversation
    object oPool = GetObjectByTag("q2d_overmind");

    if (GetLocalInt(oPC, "X2_Q2DTalkingToBrain") == 1 && GetLocalInt(GetModule(),"elder_brain") != 1)
    {
        AssignCommand(oPool, ActionStartConversation(oPC));
        return;
    }

    //if the PC is coming from the illusionary forest - the brain pool will speak to the PC
    //and negotiate
    if (GetLocalInt(OBJECT_SELF, "nBrainPoolTalked") == 1)
        return;

    if (GetLocalInt(oPC, "X2_Q2DFromForest") == 1)
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC);
        SetLocalInt(OBJECT_SELF, "nBrainPoolTalked", 1);
        HireAllHenchmen(oPC);
        MakeAreaNeutral(oPC);

        AssignCommand(oPool, ActionStartConversation(oPC));
        return;
    }
    //if after all this the brain really wants to talk to the PC - make the brain talk
    if (GetLocalInt(oPC, "X2_Q2DBrainTalk") == 1)
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        SetLocalInt(oPC, "X2_Q2DBrainTalk", 0);
        AssignCommand(oPool, ActionStartConversation(oPC));
        return;
    }
}
void MakeAreaNeutral(object oPC)
{
    object oArea = OBJECT_SELF;
    object oCreature = GetFirstObjectInArea(oArea);
    while (GetIsObjectValid(oCreature) == TRUE)
    {
        if (GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
        {
            if (GetReputation(oCreature, oPC) < 11)
            {
                AssignCommand(oCreature, ClearAllActions(TRUE));
                SetIsTemporaryFriend(oPC, oCreature);
            }
        }
        oCreature = GetNextObjectInArea(oArea);
    }
}
void HireAllHenchmen(object oPC)
{
    object oValen = GetObjectByTag("x2_hen_valen");
    object oNath = GetObjectByTag("x2_hen_nathyra");
    object oDeekin = GetObjectByTag("x2_hen_deekin");

    if (GetIsObjectValid(oValen) == TRUE)
    {
        if (GetTag(GetArea(oValen)) == "q2dgrandhall")
            HireHenchman(oPC, oValen);
    }
    if (GetIsObjectValid(oNath) == TRUE)
    {
        if (GetTag(GetArea(oNath)) == "q2dgrandhall")
            HireHenchman(oPC, oNath);
    }
    if (GetIsObjectValid(oDeekin) == TRUE)
    {
        if (GetTag(GetArea(oDeekin)) == "q2dgrandhall")
            HireHenchman(oPC, oDeekin);
    }
}
