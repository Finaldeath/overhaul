//::///////////////////////////////////////////////
//:: User Defined
//:: m2q6OgreTort_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The ogre torturer will say his lines if a PC
    is around
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 13, 2001
//:://////////////////////////////////////////////

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,OBJECT_SELF,1,CREATURE_TYPE_PERCEPTION,PERCEPTION_SEEN);
    switch (nEvent)
    {
        case 600:
            if (GetIsObjectValid(oPC))
            {
                ActionStartConversation(OBJECT_SELF);
            }
            else
            {
                DelayCommand(6.0,SignalEvent(OBJECT_SELF,EventUserDefined(600)));
            }
        break;
    }
}
