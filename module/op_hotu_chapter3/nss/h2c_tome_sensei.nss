//::///////////////////////////////////////////////
//:: The Sensei's Tome, Sensei is Alive and Awake (Condition Script)
//:: H2c_Tome_Sensei.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sensei is currently
     Alive and Awake.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: Ocotber 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oSensei = GetObjectByTag("H2_Sensei");
    int bAsleep = GetLocalInt(oSensei, "bAsleep");
    int bDead = GetIsDead(oSensei);

    if (bAsleep == FALSE &&
        bDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
