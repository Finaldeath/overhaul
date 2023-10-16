//::///////////////////////////////////////////////
//:: End Narration, Sleeping Man (Condition Script)
//:: H10c_End_Sman3.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the woman the Sleeping Man
     thought was his true love either died or
     spurned him.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    //Override FALSE if the Knower of Names has been ordered to go to him and be
    //his one true love.
    int bNamesOrdered = GetLocalInt(GetModule(), "bNamesGoToSleepingMan");
    if (bNamesOrdered == TRUE)
    {
        return FALSE;
    }

    //Identify who he thinks his love is & return TRUE if she's dead.
    string sThinks = GetLocalString(GetModule(), "sSleepingManThinksTrueLoveIs");
    object oLove;
    if (sThinks == "Aribeth" &&
        GetIsDead(GetObjectByTag("H2_Aribeth")) == TRUE)
    {
        return TRUE;
    }
    else if (sThinks == "Sensei" &&
             GetIsDead(GetObjectByTag("H2_Sensei")) == TRUE)
    {
        return TRUE;
    }
    else if (sThinks == "Nathyrra" &&
             GetIsDead(GetObjectByTag("x2_hen_nathyra")) == TRUE)
    {
        return TRUE;
    }

    //Check to see if he's been spurned.
    int bSpurned = GetLocalInt(GetModule(), "bSleepingManSpurned");
    if (bSpurned == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
