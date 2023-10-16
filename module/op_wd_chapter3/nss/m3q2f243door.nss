//::///////////////////////////////////////////////
//:: Fail To Open 3 Door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script fires when the door fails to open, meaning
     that at least one of the 3 locks is still locked.
     Players must solve the 3 puzzles in other rooms to get
     past this door.

     This script fires conversation with the player.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
//    SpeakString("test");
    // * Door will only talk to you if Haedraline is
    // * not present
    if (GetIsObjectValid(GetNearestObjectByTag("Haedraline3Q11")) == FALSE)
    {
        ActionStartConversation(GetEnteringObject());
    }
}
