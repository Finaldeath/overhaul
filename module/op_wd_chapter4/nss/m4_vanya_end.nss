//::///////////////////////////////////////////////
//:: M4_VANYA_END
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Vanya follows the player right away if she's been hired
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 2002
//:://////////////////////////////////////////////

#include "m4plotinclude"

void main()
{
    object oPC = GetPCSpeaker();
    if(GetLocalInt(OBJECT_SELF,"NW_L_HIRED")==10
        && GetLocalObject(OBJECT_SELF,"NW_L_HIREDBY")==oPC)
    {
        FollowPlayer(GetLocalObject(OBJECT_SELF, "NW_L_HIREDBY"));
    }
}
