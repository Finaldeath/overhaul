//::///////////////////////////////////////////////
//:: The Reaper (aka Gatekeeper), Not Yet Named (Condition Script)
//:: H2c_Reaper_Name.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     A generic script that returns TRUE if the
     player has not yet learned the Reaper's True
     Name. Used on pretty much everyone in the
     City of Lost Souls.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bName = GetLocalInt(GetModule(), "bKnower_GatekeeperNamed");
    if (bName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
