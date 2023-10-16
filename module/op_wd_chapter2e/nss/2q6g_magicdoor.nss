//::///////////////////////////////////////////////
//:: Unlock Plot Door
//:: 2Q6G_MagicDoor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Unlocks and opens the locked door
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("2Q6B_MagicDoor");
    if(GetIsObjectValid(oDoor))
    {
        ActionUnlockObject(oDoor);
        ActionOpenDoor(oDoor);
    }
}
