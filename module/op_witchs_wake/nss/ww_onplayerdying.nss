//::///////////////////////////////////////////////
//:: Witch Wake: On Player Dying
//:: WW_OnPlayerDying.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     On player dying, execute the Death GUI script.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 4, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetLastPlayerDying();

    //Check to ensure it's not a possessed familiar
    if (GetIsPC(oPC) == TRUE &&
        GetIsPossessedFamiliar(oPC) == FALSE)
    {
        ExecuteScript("ww_deathgui", oPC);
    }
}
