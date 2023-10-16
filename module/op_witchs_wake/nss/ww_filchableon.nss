//::///////////////////////////////////////////////
//:: Witchworks: Filchable On
//:: WW_FilchableOn.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as 'filchable' for the
     Ethereal Filchers in the Plane of Sorrows.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) == TRUE)
    {
        SetLocalInt(oPC, "bPCInFilchMaze", TRUE);
    }
}
