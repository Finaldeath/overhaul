//::///////////////////////////////////////////////
//:: Githzerai Sensei, 4th-Fold Mystery Lore Check (Condition Script)
//:: H2c_Sens_Lore_4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player passes the Lore
     check for the 4th-Fold Mystery.
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
    string sAttempt = GetLocalString(oPC, "sMystery4Attempt");
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
        //in the toolset. As this is the 4th question, the DC is increased.
        int iDC = GetLocalInt(OBJECT_SELF, "iMysteryLoreDC");
        iDC = iDC + 6;

        //Make a Lore check against the DC
        int bLore = GetIsSkillSuccessful(oPC, SKILL_LORE, iDC);

        if (bLore == TRUE)
        {
            //Remember this for the future
            SetLocalString(oPC, "sMystery4Attempt", "TRUE");
            //Flag the Mystery as having now been learned.
            SetLocalInt(GetModule(), "bMystery4Learned", TRUE);
            return TRUE;
        }
        //Remember this for the future
        SetLocalString(oPC, "sMystery4Attempt", "FALSE");
        return FALSE;
    }
}

