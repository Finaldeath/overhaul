//::///////////////////////////////////////////////
//:: Temple of the Winds Portcullis (Heartbeat)
//:: Hb_Wind_Portcullis.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Open and close the doors.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 15, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if (oPC != OBJECT_INVALID)
    {
        //Set the door to its opposite state.
        int bOpen = GetIsOpen(OBJECT_SELF);
        if (bOpen == TRUE)
        {
            ActionCloseDoor(OBJECT_SELF);
        }
        else //(bOpen == FALSE)
        {
            ActionOpenDoor(OBJECT_SELF);
        }
    }
}
