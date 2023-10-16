void main()
{
    int nCount = GetLocalInt(OBJECT_SELF,"NW_L_Count");
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
            if(GetLocalInt(oPlayerInSight,"NW_L_M1Q1KFenthicInit"))
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
        if(bFound == FALSE &&
           nCount >= 3)
        {
            ActionDoCommand(SetFacingPoint(GetPosition(oPlayerInSight)));
            ActionDoCommand(SpeakOneLinerConversation());
            nCount++;
        }
        else
        {
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
            ActionPlayAnimation(ANIMATION_LOOPING_LISTEN);
            ActionPlayAnimation(ANIMATION_LOOPING_TALK_NORMAL);
            ActionDoCommand(SetFacingPoint(GetPosition(GetNearestObjectByTag("WP_GroupFacing"))));
            nCount = 0;
        }
    }
    SetLocalInt(OBJECT_SELF,"NW_L_Count",nCount);
}
