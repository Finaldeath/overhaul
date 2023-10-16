//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: act_q1hkobold_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.
   ..and add change so they attack Walther too..
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "nw_i0_plot"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nBabyPlotBabySaved") != 1)
    {

        object oDialog = GetObjectByTag("q1hdialog");
        object oKobold = GetObjectByTag("q1h2_kblake");
        object oBlake = GetObjectByTag("q1hblake");
        object oPC = GetPCSpeaker();

        SetLocalInt(oDialog, "nBabyPlotBabySaved", 1);
        SetLocalInt(oKobold, "nBabyPlotBabySaved", 1);

        SetIsTemporaryEnemy(oPC, oKobold);
        SetIsTemporaryEnemy(oBlake, oKobold);
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 0, oKobold);
        AssignCommand(oKobold, DetermineCombatRound());


        CreateItemOnObject("q1hbaby", oPC);
        SetLocalInt(GetModule(), "X1_PCRescuedQ1HBaby", 1);
        SetLocalInt(oKobold, "nBabyMessage", 1);

        SetLocalInt(oBlake, "nFollow", 0);
    }
}
