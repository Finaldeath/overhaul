//::///////////////////////////////////////////////
//:: The Knower of Names, Love is Dead (Condition Script)
//:: H7c_Name_LovDead.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man's one true
     love is considered dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 9, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    string sLove = GetLocalString(GetModule(), "sKnower_SleepingMansLove");
    if (sLove == "Aribeth")
    {
        //If she isn't thawed, treat that as being dead...
        object oAribeth = GetObjectByTag("H2_Aribeth");
        int bThawed = GetLocalInt(oAribeth, "bThawed");
        if (bThawed == FALSE ||
            GetIsDead(oAribeth) == TRUE)
        {
            return TRUE;
        }
    }
    else if (sLove == "Nathyrra")
    {
        //If she isn't thawed, treat that as being dead...
        object oNathyrra = GetObjectByTag("x2_hen_nathyra");
        if (GetIsDead(oNathyrra) == TRUE)
        {
            return TRUE;
        }
    }
    else if (sLove == "Sensei")
    {
        //If the player's killed her...
        object oSensei = GetObjectByTag("H2_Sensei");
        if (oSensei == OBJECT_INVALID ||
            GetIsDead(oSensei) == TRUE)
        {
            return TRUE;
        }
    }
    else if (sLove == "Lavoera")
    {
        //This data is transferred over from Ch2 in the database parse...
        int bDevaDead = GetLocalInt(GetModule(), "bDevaDead");
        if (bDevaDead == TRUE)
        {
            return TRUE;
        }
    }
    return FALSE;
}
