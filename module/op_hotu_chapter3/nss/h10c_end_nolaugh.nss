//::///////////////////////////////////////////////
//:: End Narration, Mephistopheles Doesn't Get the Last Laugh (Condition Script)
//:: H10c_End_NoLaugh.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Mephistopheles was neither
     made a Chambermaid nor commanded without his
     True Name.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate != "Chambermaid" &&
        sFate != "NotCommanded")
    {
        return TRUE;
    }
    return FALSE;
}
