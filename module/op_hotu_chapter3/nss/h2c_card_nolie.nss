//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, No & Telling Lie (Condition Script)
//:: H2c_Card_NoLie.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC answers "No" and the
     player knows he's telling a lie.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bAnswer = GetLocalInt(OBJECT_SELF, "bAnswer");
    int bTruth = GetLocalInt(OBJECT_SELF, "bTellingTruth");

    //If the answer is "No" and the NPC is telling a lie...
    if (bAnswer == FALSE &&
        bTruth == FALSE)
    {
        //Get the player's wisdom check, as previously saved out on the NPC
        int iWisCheck = GetLocalInt(OBJECT_SELF, "iPCWisdomCheck");

        //For easy tweaking, take the DC from a variable set on the NPC via the
        //toolset.
        int iDC = GetLocalInt(OBJECT_SELF, "iCardLieDC");

        //Return TRUE if the Wisdom Check succeeds.
        if (iWisCheck >= iDC)
        {
            return TRUE;
        }
    }
    return FALSE;
}

