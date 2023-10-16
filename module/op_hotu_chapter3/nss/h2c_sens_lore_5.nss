//::///////////////////////////////////////////////
//:: Githzerai Sensei, 5th-Fold Mystery Lore Check (Condition Script)
//:: H2c_Sens_Lore_5.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player passes the Lore
     check for the 5th-Fold Mystery.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    //Check to see if they've attempted this one before. If so, force the same
    //result as last time.
    string sAttempt = GetLocalString(oPC, "sMystery5Attempt");
    if (sAttempt == "TRUE")
    {
        return TRUE;
    }
    else if (sAttempt == "FALSE")
    {
        return FALSE;
    }
    //If this is the first attempt, proceed normally.
    else
    {
        //For easy tweaking, get the base DC from a variable saved out on the NPC
        //in the toolset. As this is the 5th question, the DC is increased.
        int iDC = GetLocalInt(OBJECT_SELF, "iMysteryLoreDC");
        iDC = iDC + 8;

        //Make a Lore check against the DC
        int bLore = GetIsSkillSuccessful(oPC, SKILL_LORE, iDC);

        if (bLore == TRUE)
        {
            //Remember this for the future
            SetLocalString(oPC, "sMystery5Attempt", "TRUE");
            //Flag the Mystery as having now been learned.
            SetLocalInt(GetModule(), "bMystery5Learned", TRUE);
            return TRUE;
        }
        //Remember this for the future
        SetLocalString(oPC, "sMystery5Attempt", "FALSE");
        return FALSE;
    }
}

