//::///////////////////////////////////////////////
//:: Witchworks: Filchable Off
//:: WW_FilchableOff.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flags the player as no longer being in the
     Filcher's Maze in the Plane of Sorrows.

     Also clears the actions of all Filchers in
     the area, forcing them to update their target
     list.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: September 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int iNth = 1;
    object oFilcher = GetNearestObjectByTag("EtherealFilcher", OBJECT_SELF, iNth);
    object oFilcherArea = GetArea(oFilcher);
    object oMyArea = GetArea(OBJECT_SELF);

    if (GetIsPC(oPC) == TRUE)
    {
        //Flag the player as no longer being in the Filcher's Maze.
        SetLocalInt(oPC, "bPCInFilchMaze", FALSE);

        //Loop through all Filchers in area...
        while (oFilcher != OBJECT_INVALID &&
               oFilcherArea == oMyArea)
        {
            //And clear their actions.
            AssignCommand(oFilcher, ClearAllActions());

            //Reparse the data for the next Filcher.
            iNth++;
            oFilcher = GetNearestObjectByTag("EtherealFilcher", OBJECT_SELF, iNth);
            oFilcherArea = GetArea(oFilcher);
            oMyArea = GetArea(OBJECT_SELF);
        }
    }
}
