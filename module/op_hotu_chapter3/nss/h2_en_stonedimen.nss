//::///////////////////////////////////////////////
//:: H2 Stone Trigger, Dimension Stone (OnEnter)
//:: H2_En_StoneDimen.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Marks the player as having approached the
     Dimension stone in the Scrivener's Rebus
     puzzle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 6, 2003
//:://////////////////////////////////////////////
#include "inc_scrivener"

void main()
{
    object oEnterer = GetEnteringObject();
    if (GetIsPC(oEnterer) == TRUE)
    {
        //object oMap = GetNearestObjectByTag("H2_Rebus_MapNote");

        if(GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
            //SetMapPinEnabled(oMap, 1);
        }


        object oScrivener = GetObjectByTag("H2_Scrivener");
        //Flag them as being at the base of a stone.
        SetLocalInt(oScrivener, "bAtStone", TRUE);
        //Flag them as being at the base of the Dimension stone.
        SetLocalInt(oScrivener, "bDimensionStone", TRUE);

        //If the Scrivener's a Follower and quest is incomplete, have it start
        //conv.
        object oMaster = GetMaster(oScrivener);
        int bQuestComplete = GetLocalInt(GetModule(), "bScrivenerQuestComplete");
        if (oMaster == oEnterer &&
            bQuestComplete == FALSE)
        {
            //Teleport the Scrivener to the Player & launch conversation
            ActionStartScrivenerConv(oEnterer);
        }
    }
}
