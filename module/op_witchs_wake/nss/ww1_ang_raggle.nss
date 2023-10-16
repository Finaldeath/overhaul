//::///////////////////////////////////////////////
//:: Witch's Wake 1: Angmar, Player Found Raggletag
//:: WW1_Ang_Raggle.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player knows Angmar's
     secret and encountered Raggletag at the
     Elkentree.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 29, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int bAngmarSecret = GetLocalInt(oPC, "CONV_ANGMAR_Secret");
    object oElkenTree = GetObjectByTag("Elkentree");
    int bRavenFound = GetLocalInt(oElkenTree, "bRavenFound");

    if (bAngmarSecret == TRUE &&
        bRavenFound == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
