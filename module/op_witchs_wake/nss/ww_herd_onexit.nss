//::///////////////////////////////////////////////
//:: Witch Wake 1: Elkenherd OnExit - Raggletag Killer
//:: WW_Herd_OnExit.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Kills Raggletag if he tries to exit the area
     (thereby preventing him from following the
     player to Nimmermaer's and introducing a
     logic hole).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2003
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    string sTag = GetTag(oExiter);

    if (sTag == "ww1_raggletag" ||
        sTag == "ww1_treeraven")
    {
        DestroyObject(oExiter);
    }
}
