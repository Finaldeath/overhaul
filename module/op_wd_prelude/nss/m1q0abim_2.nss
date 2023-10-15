void main()
{


    if (GetLocalInt(OBJECT_SELF,"NW_TALKTIMES")==0)
        ActionStartConversation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));

}

