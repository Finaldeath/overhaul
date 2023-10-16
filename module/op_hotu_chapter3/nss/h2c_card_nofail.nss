//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, No & Wis Check Failure (Condition Script)
//:: H2c_Card_NoFail.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC answers "No" and the
     player can't determine he's telling the truth.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 17, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bAnswer = GetLocalInt(OBJECT_SELF, "bAnswer");

    //If the answer is "No"
    if (bAnswer == FALSE)
    {
        //Get the player's wisdom check, as previously saved out on the NPC
        int iWisCheck = GetLocalInt(OBJECT_SELF, "iPCWisdomCheck");

        //For easy tweaking, take the DC from a variable set on the NPC via the
        //toolset.
        int iDC = GetLocalInt(OBJECT_SELF, "iCardLieDC");

        //Return TRUE if the Wisdom Check fails.
        if (iWisCheck < iDC)
        {
            return TRUE;
        }
    }
    return FALSE;
}

