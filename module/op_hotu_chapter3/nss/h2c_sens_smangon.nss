//::///////////////////////////////////////////////
//:: Sensei Dharvana, Sleeping Man Gone (Condition Script)
//:: H2c_Sens_SManGone.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man has left the
     area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 30, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bValid = GetIsObjectValid(oMan);
    int bGone = GetLocalInt(GetModule(), "HX_SLEEPING_INVIS_SILENT");

    if (bValid == FALSE ||
        bGone == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
