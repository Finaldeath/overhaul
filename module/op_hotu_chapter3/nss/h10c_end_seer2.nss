//::///////////////////////////////////////////////
//:: End Narration, PC Gave Shattered Mirror to Seer (Condition Script)
//:: H10c_End_Seer2.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Player gave the Shattered
     Mirror to the Seer and the Rebel Camp in Ch2.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sFate = GetLocalString(GetModule(), "sShatteredMirrorGivenTo");
    if (sFate == "Seer")
    {
        return TRUE;
    }
    return FALSE;
}
