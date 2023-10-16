//::///////////////////////////////////////////////
//:: Durnan, No Mephistopheles (Condition Script)
//:: H9c_Durn_NoMeph.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Mephistopheles has not made
     his appearance yet.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iMephistopheles = GetLocalInt(GetModule(), "HX_MEPH_HASNT_APPEARED");
    if (iMephistopheles == FALSE)
    {
        SetLocalInt(GetModule(), "HX_MEPH_HASNT_APPEARED", TRUE);
        return TRUE;
    }
    return FALSE;
}
