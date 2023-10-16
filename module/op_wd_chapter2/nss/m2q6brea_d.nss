//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6Brea_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Captain Breakweather will initiate dialog
    after his warning timer runs out.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 8, 2001
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oPC = GetNearestPC();
    
    switch (nEvent)
    {
        case 600:
            // Timer 1
            if (GetIsObjectValid(oPC) && GetLocalInt(OBJECT_SELF,"NW_L_Timer1") < 40)
            {
                ActionStartConversation(OBJECT_SELF);
            }
            else if (GetLocalInt(OBJECT_SELF,"NW_L_Timer1") == 60)
            {
                SetLocalInt(OBJECT_SELF,"NW_L_Timer1",0);
            }
        break;
        
        case 601:
            // Timer 2
            ActionStartConversation(OBJECT_SELF);
        break;
    }
}
