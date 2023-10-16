//::///////////////////////////////////////////////
//:: Witchwork: Ethereal Filcher OnDeath
//:: WW_Filcher_Death.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When killed, respawn at any treasure pile
     but the closest (to avoid them respawning
     right in front of the player). Also, add a
     delay to make it a little easier on low-level
     characters.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2002
//:://////////////////////////////////////////////

void RespawnFilcher(object oTreasure)
{
    location lTreasure = GetLocation(oTreasure);
    CreateObject(OBJECT_TYPE_CREATURE, "etherealfilcher", lTreasure, TRUE);
}

void main()
{
    int iNth = Random(3)+2;
    object oTreasure = GetNearestObjectByTag("WP_FilcherStash", OBJECT_SELF, iNth);
    object oArea = GetArea(OBJECT_SELF);
    AssignCommand(oArea, DelayCommand(6.0, RespawnFilcher(oTreasure)));
}
