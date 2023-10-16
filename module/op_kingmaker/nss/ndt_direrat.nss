//::///////////////////////////////////////////////
//:: On Death Event for the rats in the intro
//:: ndt_direrat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Dire Rat death event
*/
//:://////////////////////////////////////////////
//:: Created By: Keith K2 Hayward
//:: Created On: Nov 2004
//:://////////////////////////////////////////////
#include "inc_remeffect"

void InitLight(object oPC);

void main()
{
    object oPC = GetFirstPC();
    location lPC = GetLocation(oPC);
    int nDead = GetLocalInt(oPC, "Q3AI_CAL_RATS_DEAD")+1;

    SetLocalInt(oPC, "Q3AI_CAL_RATS_DEAD", nDead);

    if(nDead >=2)
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(1.0f, InitLight(oPC));
    }
}

void InitLight(object oPC)
{
    object oModule = GetModule();
    object oCheck;

    if ((GetIsInCombat(oPC) == FALSE) && (IsInConversation(oPC) == FALSE))
    {
        SetCutsceneMode(oPC, TRUE);

        location lPC = GetLocation(oPC);
        object oMW = CreateObject(OBJECT_TYPE_PLACEABLE, "q3ai_mw_intro", lPC);

        RemovePoly(oPC);

        SetLocalInt(oPC, "OS_MW_RATSDEAD", 1);
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, ActionForceMoveToObject(oMW, TRUE, 0.0f, 1.0f));
        DelayCommand(1.0f, AssignCommand(oMW, ActionStartConversation(oPC)));
    }
    else
    {
        DelayCommand(1.0f, InitLight(oPC));
    }
}
