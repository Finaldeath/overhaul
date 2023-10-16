//::///////////////////////////////////////////////
//:: Vampire Initiates
//:: q3_init_vampire
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Vampire initiates with the player
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
#include "nw_i0_generic"
void main()
{
    object oPC = GetFirstPC();

    if(GetEnteringObject()== oPC
        && !os_CheckTriggerEntered())
    {
        os_SetTriggerEntered();
        object oVamp = GetObjectByTag("q3_ivamppriest");
        AssignCommand(oVamp,ActionSpeakString("Do not let this fool reach the master!"));
        object oGord = GetObjectByTag("q2_thegord");
        object oMinion = GetNearestObjectByTag("NW_VAMPIRE");
        if(GetLocalInt(oGord,"OS_MUMMY_DEAD")==10 && GetIsObjectValid(oMinion))
        {
            AssignCommand(oMinion,ActionSpeakString("It is the master of the gems! We dare not fight!"));
            ChangeToStandardFaction(oMinion,STANDARD_FACTION_DEFENDER);
            AssignCommand(oMinion,DetermineCombatRound());
        }
    }
}
