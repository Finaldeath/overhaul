//::///////////////////////////////////////////////
//:: Name cutabort205
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spirit cutscene abort.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 9, 2003
//:://////////////////////////////////////////////
#include "nw_i0_plot"
// Clear effects.
void ClearAllEffects();
// Clear all the player's associates.
void ClearParty(object oObject);
void main()
{
    object oPC = GetLastPCToCancelCutscene();
    object oSpirit = GetObjectByTag("hx_spirit");

    BlackScreen(oPC);
    DestroyObject(oSpirit);
    AddJournalQuestEntry("hx_spirits", 10, oPC, TRUE, TRUE);

    //Give non-repeatable XP
    int i2daRow = 69;
    int bDuplicate = GetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow));
    if (bDuplicate == FALSE)
    {
        SetLocalInt(GetModule(), "bEXP_"+IntToString(i2daRow), TRUE);
        Reward_2daXP(oPC, i2daRow);
    }

    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));
}

// Clear all the player's associates.
void ClearParty(object oObject)
{
    object oHench1 = GetHenchman(oObject, 1);
    object oHench2 = GetHenchman(oObject, 2);
    object oHench3 = GetHenchman(oObject, 3);
    object oAssoc1 = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oObject);
    object oAssoc2 = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oObject);
    object oAssoc3 = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oObject);
    object oAssoc4 = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oObject);

    if(GetIsObjectValid(oHench1))
    {
        AssignCommand(oHench1, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oHench1, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oHench2))
    {
        AssignCommand(oHench2, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oHench2, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oHench3))
    {
        AssignCommand(oHench3, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oHench3, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc1))
    {
        AssignCommand(oAssoc1, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oAssoc1, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc2))
    {
        AssignCommand(oAssoc2, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oAssoc2, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc3))
    {
        AssignCommand(oAssoc3, ClearAllEffects());
       // DelayCommand(0.2, AssignCommand(oAssoc3, ActionJumpToLocation(lLoc)));
    }
    if(GetIsObjectValid(oAssoc4))
    {
        AssignCommand(oAssoc4, ClearAllEffects());
        //DelayCommand(0.2, AssignCommand(oAssoc4, ActionJumpToLocation(lLoc)));
    }
}

void ClearAllEffects()
{
    effect eEffect = GetFirstEffect(OBJECT_SELF);

    while(GetIsEffectValid(eEffect))
    {
        RemoveEffect(OBJECT_SELF, eEffect);
        eEffect = GetNextEffect(OBJECT_SELF);
    }
}
