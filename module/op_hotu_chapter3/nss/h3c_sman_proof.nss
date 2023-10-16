//::///////////////////////////////////////////////
//:: Sleeping Man Requested Proof (Condition Script)
//:: H3c_SMan_Proof.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man requested
     proof of the identity of his one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 29, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bProof = GetLocalInt(oMan, "bProofRequested");
    if (bProof == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
