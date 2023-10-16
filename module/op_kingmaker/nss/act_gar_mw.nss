//::///////////////////////////////////////////////
//:: act_gar_mw
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Magic weapon speaks to the PC after talking to Garrot
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////
#include "inc_remeffect"

void InitLight(object oPC);

void main()
{
    object oYenna = GetObjectByTag("q2_yenna");
    if(GetLocalInt(oYenna,"OS_YENNA_EAVESDROP")==20)
    {
        object oPC = GetFirstPC();
        InitLight(oPC);
    }
}

void InitLight(object oPC)
{
    object oModule = GetModule();
    object oCheck;
    int iBadFlag = FALSE;

    oCheck = GetFirstObjectInShape(SHAPE_SPHERE, 40.0f, GetLocation(oPC));
    while (GetIsObjectValid(oCheck) == TRUE)
    {
        if(GetIsReactionTypeHostile(oPC, oCheck) == TRUE)
        {
            iBadFlag = TRUE;
        }
         oCheck = GetNextObjectInShape(SHAPE_SPHERE, 40.0f, GetLocation(oPC));
    }

    if ((GetIsInCombat(oPC) == FALSE) && (IsInConversation(oPC) == FALSE)
      && (iBadFlag == FALSE))
    {
        location lPC = GetLocation(oPC);
        object oMW = CreateObject(OBJECT_TYPE_PLACEABLE, "q3ai_mw_intro", lPC);

        if (GetIsObjectValid(oMW) == TRUE)
        {
            SetCutsceneMode(oPC, TRUE);
            RemovePoly(oPC);

            SetLocalInt(oMW,"OS_MW_YENNA",2);
            AssignCommand(oPC,ClearAllActions(TRUE));
            DelayCommand(0.6f, AssignCommand(oPC, ClearAllActions(TRUE)));
            DelayCommand(1.0f, AssignCommand(oMW, ActionStartConversation(oPC)));
        }
        else
        {
            DestroyObject(oMW);
            DelayCommand(1.0f, InitLight(oPC));
        }
    }
    else
    {
        DelayCommand(1.0f, InitLight(oPC));
    }
}
