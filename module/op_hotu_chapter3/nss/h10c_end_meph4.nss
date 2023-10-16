//::///////////////////////////////////////////////
//:: End Narration, Mephistopheles Serves PC (Condition Script)
//:: H10c_End_Meph4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player forced
     Mephistopheles into his/her service.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sMephistophelesFate");
    if (sFate == "Servant" ||
        sFate == "Chambermaid" ||
        sFate == "HellServant")
    {
        return TRUE;
    }
    return FALSE;
}
