//::///////////////////////////////////////////////
//:: Witch Wake 1: Raggletag Killer
//:: WW1_RaggleKiller.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Kills Raggletag on entering
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEnterer = GetEnteringObject();
    string sTag = GetTag(oEnterer);

    if (sTag == "ww1_raggletag" ||
        sTag == "ww1_treeraven")
    {
        DestroyObject(oEnterer);
    }
}
