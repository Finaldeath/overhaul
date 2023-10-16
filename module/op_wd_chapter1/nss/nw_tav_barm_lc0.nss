//::///////////////////////////////////////////////
//::
//:: End Conversation - Normal
//::
//:: NW_TAV_BarM_LC0.nss
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: This script sets the barmaid's NW_L_BarmaidTalk
//:: to 0.
//:: This means that the barmaid is available for
//:: conversation.
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: John
//:: Created On: June 19, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_BarmaidTalk",0);
}
