//::///////////////////////////////////////////////
//:: Knower of Places Area (OnExit)
//:: H5_Ex_Places.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Destroys the Knower of Places if
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

void main()
{
    //Verify that the Knower still exists and that it's a PC exiting
    object oKnower = GetObjectByTag("H5_KnowerofPlaces");
        object oExiter = GetExitingObject();
    if (oKnower != OBJECT_INVALID &&
        GetIsPC(oExiter) == TRUE)
    {
        //Identify any remaining PCs
        object oRemainingPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oKnower, 1);
        if (oRemainingPC == oExiter)
        {
            oRemainingPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oKnower, 2);
        }

        //If there are no more PCs remaining in the area and the ring's
        //already been swapped...
        int bRingSwap = GetLocalInt(oKnower, "bRingSwap");
        if (oRemainingPC == OBJECT_INVALID &&
            bRingSwap == TRUE)
        {
            //Destroy the Knower of Places
            DestroyObject(oKnower, 1.0);
        }
    }

    //Execute the normal OnExit script to handle the ring variables.
    ExecuteScript("hx_areaexit_ring", OBJECT_SELF);
}
