void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                    PLAYER_CHAR_IS_PC,
                                    OBJECT_SELF,
                                    1,
                                    CREATURE_TYPE_PERCEPTION,
                                    PERCEPTION_SEEN);
    if(GetIsObjectValid(oPC) && GetLocalInt(oPC,"NW_L_GeldarSpoken") == FALSE)
    {
        if(GetLocalInt(OBJECT_SELF,"NW_L_HBCount") > 2)
        {

            SpeakOneLinerConversation();
            SetLocalInt(OBJECT_SELF,"NW_L_HBCount",0);
        }
        else
        {
            SetLocalInt(OBJECT_SELF,"NW_L_HBCount",GetLocalInt(OBJECT_SELF,"NW_L_HBCount") + 1);
        }

    }
}
