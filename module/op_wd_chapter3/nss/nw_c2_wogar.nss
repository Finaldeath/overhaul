//::///////////////////////////////////////////////
//:: Default On Heartbeat
//:: NW_C2_DEFAULT1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will have people perform default
    animations.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 23, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    if (GetLocalInt(GetModule(),"NW_G_M3Q04TALKWOGAR") == 0)
        ActionSpeakStringByStrRef(45892);

    if (GetLocalInt(GetModule(),"NW_G_M3Q04TALKWOGAR") == 1)
        {
        SetLocalInt(GetModule(),"NW_G_M3Q04TALKWOGAR",2);
        ActionStartConversation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_IS_PC));
        }
}
