//::///////////////////////////////////////////////
//:: Name  q1_cutabort
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    portal cutscene part 2: jump players to Sand Dungeon if aborted
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
    object oWP = GetWaypointByTag("Q4_START");
    object oHench;
    while (oPC != OBJECT_INVALID)
    {
        oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
        if(oHench != OBJECT_INVALID)
            DelayCommand(0.5, RemoveEffects(oHench));
        CutRestoreLocation(31, 0.5, oPC);
        CutRemoveEffects(31, 0.5, oPC);
        CutSetCutsceneMode(31, 0.5, oPC, FALSE);
        AssignCommand(oPC, JumpToObject(oWP));
        //UnFreezeAssociate(oPC);
        oPC = GetNextPC();
    }
    SetLocalObject(GetModule(), "X1_CURRENT_START", oWP);
    object oPortal = GetWaypointByTag("Q3B_WP_SAND_PORTAL");
    CreateObject(OBJECT_TYPE_PLACEABLE, "jumpportal", GetLocation(oPortal)); // for multiplayer

    SetLocalInt(GetModule(), "X1_CUT31RUNNING", 2); // change cutscene status

    object oPlayers = GetFirstPC();
    while (oPlayers != OBJECT_INVALID)
    {
        if (GetLocalInt(oPlayers, "nCutsceneNumber") == 31)
        {
            oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPC);
            DelayCommand(1.0, SetCutsceneMode(oPlayers, FALSE));
            DelayCommand(1.0, SetCommandable(TRUE, oPlayers));
            DelayCommand(1.0, RemoveEffects(oPlayers));
            DelayCommand(1.0, RemoveEffects(oHench));
            DelayCommand(1.5, SetLocalInt(oPlayers, "nCutsceneNumber", 0));
        }
        oPlayers = GetNextPC();
    }
}

