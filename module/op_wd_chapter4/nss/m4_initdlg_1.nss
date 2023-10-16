//::///////////////////////////////////////////////
//:: M4_INITDLG_1.NSS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
This searches for a PC within visual range who this NPC hasn't initiated
dialogue with.  If one is present, the NPC will display a one line string
overhead.
Once conversation is initiated and the PC has hit continue at least once,
The local int "NW_L_Init_" + <tag of this character> should be set to TRUE
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May (with Aidan's script)
//:: Created On: February 28, 2002
//:://////////////////////////////////////////////

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
