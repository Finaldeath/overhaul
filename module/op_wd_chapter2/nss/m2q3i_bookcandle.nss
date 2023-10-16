//::///////////////////////////////////////////////
//:: m2q3I_BookCandle.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Turns the placeable object's animation on/off
    On turning it on, it launches a "conversation"
    detailing the text of the book.
*/
//:://////////////////////////////////////////////
//:: Created By:  Rob Bartel
//:: Created On:  Jan 25, 2002
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_AMION") == 0)
    {
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        ActionStartConversation(GetLastUsedBy());
        SetLocalInt(OBJECT_SELF,"NW_L_AMION",1);
    }
    else
    {
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        SetLocalInt(OBJECT_SELF,"NW_L_AMION",0);
    }
}
