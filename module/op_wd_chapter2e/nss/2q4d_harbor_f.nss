//::///////////////////////////////////////////////
//:: Harbor Door On Fail to Open
//:: 2Q4D_HARBOR_F
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the player fails to open the door then
    it will start a conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 5, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void main()
{
    object oTarget = GetLastUsedBy();

    int nPlot = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    if(nPlot == FALSE && !GetIsObjectValid(oTarget))
    {
        ActionStartConversation(GetEnteringObject());
    }
}
