//::///////////////////////////////////////////////
//:: Custom User Defined Event
//:: 2Q4_Bela_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 30, 2002
//:://////////////////////////////////////////////

void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1001) //HEARTBEAT
    {
        if(!IsInConversation(OBJECT_SELF))
        {
            int nRand = Random(30)+1;
            object oNPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF, nRand);
            object oPC =GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            if(GetIsObjectValid(oNPC)
               && GetIsObjectValid(oPC)
               && !GetFactionEqual(oNPC, OBJECT_SELF)
               && !GetIsEnemy(oNPC)
               && !GetFactionEqual(oNPC, oPC))
            {
                vector vFace = GetPosition(oNPC);
                SetFacingPoint(vFace);
                SpeakOneLinerConversation("2Q4C_BELA_SASS");

                string sTag = GetTag(oNPC);
                int nCnt = 1;
                object oSassed = GetNearestObjectByTag(sTag, oNPC, nCnt);
                vector vBela = GetPosition(OBJECT_SELF);
                while(GetIsObjectValid(oSassed))
                {
                    if(GetIsObjectValid(oSassed) && GetDistanceBetween(oSassed, oNPC) < 4.0)
                    {
                        AssignCommand(oSassed, ClearAllActions());
                        AssignCommand(oSassed, SetFacingPoint(vBela));
                    }
                    else
                    {
                        oSassed = OBJECT_INVALID;
                    }
                    nCnt++;
                    oSassed = GetNearestObjectByTag(sTag, oNPC, nCnt);
                }
                AssignCommand(oNPC, ClearAllActions());
                AssignCommand(oNPC, ActionDoCommand(SpeakOneLinerConversation("2Q4_SASSED")));
                AssignCommand(oNPC, SetFacingPoint(vBela));
            }
        }
    }
    else if(nUser == 1002) // PERCEIVE
    {
        if(!IsInConversation(OBJECT_SELF) && GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN)))
        {
            SpeakOneLinerConversation("2Q4C_BELA_GREET");
        }
    }
}
