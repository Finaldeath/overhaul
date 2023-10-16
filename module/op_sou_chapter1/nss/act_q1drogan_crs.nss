//::///////////////////////////////////////////////
//:: Name act_q1drogan_crs
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Give the PCs the Crystal for the Interlude chapter
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: March 20/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(OBJECT_SELF, "nGaveTowerCrystal") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nGaveTowerCrystal", 1);
        CreateItemOnObject("x1towercrystal", oPC);
    }
}
