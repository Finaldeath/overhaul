void main()
{
    if(IsInConversation(OBJECT_SELF) == FALSE )
    {
        int bFound = FALSE;
        int nNth = 1;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                        PLAYER_CHAR_IS_PC,
                                        OBJECT_SELF,
                                        nNth,
                                        CREATURE_TYPE_PERCEPTION,
                                        PERCEPTION_SEEN);
        while( GetIsObjectValid(oPC) && bFound == FALSE )
        {
            if(GetLocalInt(oPC,"NW_L_M1Q1FSpokeToArib") == FALSE)
            {
                ActionDoCommand(SetFacingPoint(GetPosition(oPC)));
                ActionDoCommand(SpeakOneLinerConversation());
                bFound = TRUE;
            }
            nNth++;
            oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                     PLAYER_CHAR_IS_PC,
                                     OBJECT_SELF,
                                     nNth,
                                     CREATURE_TYPE_PERCEPTION,
                                     PERCEPTION_SEEN);
        }
    }
}

