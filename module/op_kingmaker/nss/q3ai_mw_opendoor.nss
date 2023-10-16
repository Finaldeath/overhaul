//::///////////////////////////////////////////////
//:: Open Door
//:: q3ai_mw_opendoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Opens the first door in the cave
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("q3ai_door5");
    object oPC = GetFirstPC();
    SetLocked(oDoor,FALSE);
    SetLocalInt(oPC,"OS_MW_CONVERSATION",1);

    // Make sure the light is correctly destroyed and ensure the PC isn't
    // stuck in enternal cutscene mode :(
    ExecuteScript("q3ai_mw_started", OBJECT_SELF);
    ExecuteScript("q3ai_mw_endconv", OBJECT_SELF);
}
