//::///////////////////////////////////////////////
//:: Chronicles of Abaran - Close Book
//:: Chron_Close.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Return the player to their original location
     and clean up the area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 16, 2004
//:://////////////////////////////////////////////
#include "inc_rob"

//Remove all effects currently active on the target.
void RemoveEffects(object oTarget)
{
    effect eEffect = GetFirstEffect(oTarget);

    while (GetIsEffectValid(eEffect) == TRUE)
    {
        RemoveEffect(oTarget, eEffect);
        eEffect = GetNextEffect(oTarget);
    }
}

void main()
{
    //Snap to black (b/c we don't know if it's already black or not).
    object oPC = GetFirstPC();

    BlackScreen(oPC);
    ActionPauseConversation();

    //Set the conversation variable
    SetLocalInt(oPC, "ChroniclesChapter", 0);

    //Remove effects on PC and Associates.
    AssignCommand(GetModule(), DelayCommand(0.1, RemoveEffects(oPC)));

    object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
    AssignCommand(GetModule(), DelayCommand(0.2, RemoveEffects(oHench)));

    object oFam = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC);
    AssignCommand(GetModule(), DelayCommand(0.3, RemoveEffects(oFam)));

    object oAnim = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC);
    AssignCommand(GetModule(), DelayCommand(0.4, RemoveEffects(oAnim)));

    object oSumm = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC);
    AssignCommand(GetModule(), DelayCommand(0.5, RemoveEffects(oSumm)));

    //Purge the NPCs from the area.
    object oArea = GetArea(oPC);
    DestroyAllNPCsInArea(oArea);

    //Return them to their original location
    DelayCommand(1.0, AssignCommand(oPC, ActionResumeConversation()));
    location lPC = GetLocalLocation(GetModule(), "lPC_PreChronicles");
    DelayCommand(1.1, AssignCommand(oPC, JumpToLocation(lPC)));
    DelayCommand(1.2, AssignCommand(oHench, JumpToLocation(lPC)));
    DelayCommand(1.3, AssignCommand(oFam, JumpToLocation(lPC)));
    DelayCommand(1.4, AssignCommand(oAnim, JumpToLocation(lPC)));
    DelayCommand(1.5, AssignCommand(oSumm, JumpToLocation(lPC)));

    //Clear the player's actions
    DelayCommand(1.6, AssignCommand(oPC, ClearAllActions(TRUE)));

    //End the cutscene.
    DelayCommand(2.0, SetCutsceneMode(oPC, FALSE));

    //Fade from black.
    DelayCommand(2.5, FadeFromBlack(oPC));
}
