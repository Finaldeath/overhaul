//::///////////////////////////////////////////////
//:: The Knower of Names, Sensei's Alive (Condition Script)
//:: H7c_Name_Sensei1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Sensei is still alive.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oSensei = GetObjectByTag("H2_Sensei");
    int bDead = GetIsDead(oSensei);
    int bTrueName = GetLocalInt(GetModule(), "bKnower_SenseiNamed");
    if (bDead == FALSE &&
        bTrueName == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
