//::///////////////////////////////////////////////
//:: H2 Stone Trigger, Wrong Stone (OnExit)
//:: H2_Exit_StoneAll.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Marks the player as having left the base of
     a stone in the Scrivener's Rebus puzzle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////

void main()
{
    object oExiter = GetExitingObject();
    if (GetIsPC(oExiter) == TRUE)
    {
        object oScrivener = GetObjectByTag("H2_Scrivener");
        //Flag them as being no longer at the base of a stone.
        SetLocalInt(oScrivener, "bAtStone", FALSE);
        //Wipe all of the stone variables.
        SetLocalInt(oScrivener, "bTreasonStone", FALSE);
        SetLocalInt(oScrivener, "bDimensionStone", FALSE);
        SetLocalInt(oScrivener, "bInfinityStone", FALSE);
        SetLocalInt(oScrivener, "bWrongStone", FALSE);
    }
}
