//::///////////////////////////////////////////////
//:: End Narration, Mephistopheles Not Commanded By True Name (Condition Script)
//:: H10c_End_Laugh2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Mephistopheles was not
     commanded by his True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "NotCommanded")
    {
        return TRUE;
    }
    return FALSE;
}
