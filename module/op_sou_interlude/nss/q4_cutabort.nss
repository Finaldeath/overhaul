//::///////////////////////////////////////////////
//:: Name  q1_cutabort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    player focus cutscene while petrified
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
        RemoveEffect(oCreature, eEff1);
        eEff1 = GetNextEffect(oCreature);
    }
}

void main()
{
    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        CutRestoreLocation(4, 0.5, oPC);
        CutRemoveEffects(4, 0.5, oPC);
        CutSetCutsceneMode(4, 0.5, oPC, FALSE);
        UnFreezeAssociate(oPC);
        oPC = GetNextPC();
    }

    SetLocalInt(GetModule(), "X1_CUT4RUNNING", 2); // change cutscene status

    object oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == 31)
        {
            DelayCommand(1.0, SetCutsceneMode(oPlayers, FALSE));
            DelayCommand(1.0, SetCommandable(TRUE, oPlayers));
            DelayCommand(1.0, RemoveEffects(oPlayers));
            DelayCommand(1.5, SetLocalInt(oPlayers, "nCutsceneNumber", 0));
        }
        oPlayers = GetNextPC();
    }
    StartNewModule("XP1-Chapter 2");
}

