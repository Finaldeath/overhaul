//::///////////////////////////////////////////////
//:: Witchwork 1: Night Hag Multiplayer-Friendly (Condition)
//:: WW1_Hag_Multi_C.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     If someone has already been offered a Tarot
     reading, skip over all of the preliminary
     discussion. In multiplayer, this will help
     secondary players take a shortcut through
     her conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 19, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bMulti = GetLocalInt(OBJECT_SELF, "bMultiplayerFriendlyNode");
    if (bMulti == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
