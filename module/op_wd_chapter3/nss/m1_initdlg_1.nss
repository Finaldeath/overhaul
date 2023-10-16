//This searches for a PC within visual range who this NPC hasn't initiated
//dialogue with.  If one is present, the NPC will display a one line string
//overhead.
//Once conversation is initiated and the PC has hit continue at least once,
//The local int "NW_L_Init_" + <tag of this character> should be set to TRUE
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
            // * if the death cleric fires this script then check to see
            // * if this is someone who has died.
            if (GetTag(OBJECT_SELF) == "NW_DEATH_CLERIC" && GetLocalInt(oPlayerInSight, "NW_L_I_DIED") == 0)
            {
                // * do not try to init because the player is not 'back from the dead'
            }
            else
            {
                ActionDoCommand(SetFacingPoint(GetPosition(oPlayerInSight)));
                ActionDoCommand(SpeakOneLinerConversation());
            }
        }
    }
}
