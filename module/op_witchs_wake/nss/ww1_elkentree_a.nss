//::///////////////////////////////////////////////
//:: Witchwork 1: Elkentree Action
//:: WW1_Elkentree_A.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawns the raven familiar creature and
     tree hole treasure-holder placeable.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 13, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    location lLoc = GetLocation(OBJECT_SELF);
    int bKnowsRaggletag = GetLocalInt(oPC, "XP_KN_Raggletag");

    //Destroy the unusable hole.
    object oOldHole = GetNearestObjectByTag("ww1_statichole");
    DestroyObject(oOldHole);

    //Spawn in the treasure container.
    CreateObject(OBJECT_TYPE_PLACEABLE, "ww1_treehole", lLoc);

    //Flag the trigger to indicate that the Raven has been found.
    SetLocalInt(OBJECT_SELF, "bRavenFound", TRUE);

    //If the PC has spoken to Nim about Raggletag, spawn in a friendly version.
    if (bKnowsRaggletag)
    {
        CreateObject(OBJECT_TYPE_CREATURE, "ww1_raggletag", lLoc);
    }
    //Otherwise, spawn in a hostile version.
    else
    {
        CreateObject(OBJECT_TYPE_CREATURE, "ww1_treeraven", lLoc);

    }
}
