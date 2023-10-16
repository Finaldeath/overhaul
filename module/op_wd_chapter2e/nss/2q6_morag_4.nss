//::///////////////////////////////////////////////
//:: SetListeningPatterns
//:: NW_C2_DEFAULT4
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    by the generic script after dialogue or a
    shout is initiated.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 24, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{

    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();
    if(!GetIsPC(oShouter))
    {
        if(nMatch == -1)
        {
            ClearAllActions();
            BeginConversation();
        }
    }
    else
    {
        SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START", 99);
    }
}
