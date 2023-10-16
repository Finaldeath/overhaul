//::///////////////////////////////////////////////
//:: End Narration, Mephistopheles Made a Chambermaid (Condition Script)
//:: H10c_End_Laugh1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Mephistopheles was made a
     Chambermaid.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "Chambermaid")
    {
        return TRUE;
    }
    return FALSE;
}
