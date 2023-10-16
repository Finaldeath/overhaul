//::///////////////////////////////////////////////
//:: Name hx_temp_senabrt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Abort script for Sensei.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    object oSleep = GetObjectByTag("H2_SleepingMan");

    if(GetLocalInt(GetModule(), "HX_SENSEIFLEES") == TRUE)
    {
        ExecuteScript("hx_temp_sleepatk", oSleep);
    }
}
