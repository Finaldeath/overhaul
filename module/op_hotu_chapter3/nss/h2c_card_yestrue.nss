//::///////////////////////////////////////////////
//:: Hellbreath Tavern, Card Trick, Yes & Telling Truth (Condition Script)
//:: H2c_Card_YesTrue.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the NPC answers "Yes" and the
     player knows he's telling the truth.
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

    //Have the player make a Wisdom Check to determine whether or not the
    //player can sense that the NPC is telling the truth.
    int iWisMod = GetAbilityModifier(ABILITY_WISDOM, oPC);
    int id20 = d20(1);
    int iWisCheck = id20 + iWisMod;

    //Save this value out for future reference
    SetLocalInt(OBJECT_SELF, "iPCWisdomCheck", iWisCheck);

    //If the answer is "Yes" and the NPC is telling the truth...
    if (bAnswer == TRUE &&
        bTruth == TRUE)
    {
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
