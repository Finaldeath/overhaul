//::///////////////////////////////////////////////
//:: Lord's Alliance User Defined Event
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
    if (GetLocalInt(OBJECT_SELF,"NW_TALK_ONCE") == 1)
        return;

  switch(GetUserDefinedEventNumber())
  {
    case  1002:
        ClearAllActions();
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1,CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
        if (GetIsObjectValid(oPC) == TRUE)
        {
            ActionStartConversation(oPC);
            SetLocalInt(OBJECT_SELF,"NW_TALK_ONCE",1);
        }

    break;
  }
}
