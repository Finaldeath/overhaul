void main()
{
    if(IsInConversation(OBJECT_SELF) == FALSE)
    {
        int bFound = FALSE;
        int nNth = 1;
        object oPlayerInSight = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                                   PLAYER_CHAR_IS_PC,
                                                   OBJECT_SELF,
                                                   nNth,
                                                   CREATURE_TYPE_PERCEPTION,
                                                   PERCEPTION_SEEN);

        while (GetIsObjectValid(oPlayerInSight) &&
               bFound == FALSE)
        {
            if(GetLocalInt(oPlayerInSight,"NW_L_Init_" + GetTag(OBJECT_SELF)) == FALSE)
            {
                bFound = TRUE;
            }
            else
            {
                nNth++;
                oPlayerInSight = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,
                                                    PLAYER_CHAR_IS_PC,
                                                    OBJECT_SELF,
                                                    nNth,
                                                    CREATURE_TYPE_PERCEPTION,
                                                    PERCEPTION_SEEN);
            }
        }
        if(bFound)
        {
            ActionDoCommand(SetFacingPoint(GetPosition(oPlayerInSight)));
            ActionDoCommand(SpeakOneLinerConversation());
        }
    }
}

