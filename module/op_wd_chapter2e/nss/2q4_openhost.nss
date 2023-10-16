//::///////////////////////////////////////////////
//:: Open Host Tower Gate
//:: 2Q4_OpenHost
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the diplomatic letter is recieved
    the host tower gate opens.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 14, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("2Q4A_HostTower");
    if(GetIsObjectValid(oDoor))
    {
        ActionOpenDoor(oDoor);
    }
}
