//::///////////////////////////////////////////////
//:: Orc Rings Gong
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    switch(GetUserDefinedEventNumber())
    {
        case 1002:
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
            if (GetIsObjectValid(oPC) == TRUE)
            {
                SetLocalInt(OBJECT_SELF, "NW_L_PATROLSTATE",1);
                ActionStartConversation(OBJECT_SELF);
            }
        break;
    }
}
