//::///////////////////////////////////////////////
//:: Used
//:: m2q3wanevswitch
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This switch turns on the zappy zappy for the
    mephits.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 19, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetArea(OBJECT_SELF),"NW_A_PulledSwitch") == 0)
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_PulledSwitch",10);
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SpeakOneLinerConversation();
    }
    else
    {
        SetLocalInt(GetArea(OBJECT_SELF),"NW_A_PulledSwitch",0);
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    }
}
