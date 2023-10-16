//::///////////////////////////////////////////////
//:: Witch's Wake 1: Nimmermaer, Player Found Raggletag
//:: WW1_Nim_Raggle_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player encountered
     Raggletag at the Elkentree.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oElkenTree = GetObjectByTag("Elkentree");
    int bRavenFound = GetLocalInt(oElkenTree, "bRavenFound");

    if (bRavenFound == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
