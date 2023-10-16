//::///////////////////////////////////////////////
//:: Bela Heartbeat
//:: 2Q4_Bela_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes Bela move around the common room and
    sass the soldiers.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 27, 2002
//:://////////////////////////////////////////////
#include "NW_I0_2Q4LUSKAN"
void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    int nRand = d20();
    int nState = GetLocalInt(OBJECT_SELF, "2Q4_Bela_Random");

    object oNPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF, nRand);
    if(!GetIsObjectValid(oPC) || GetDistanceToObject(oPC) > 3.0)
    {
        if(GetIsObjectValid(oNPC) && !GetFactionEqual(oNPC)&& nState == 0)
        {
            if(nState == 0)
            {
                SetLocalInt(OBJECT_SELF, "2Q4_Bela_Random", 1);
                ActionMoveToObject(oNPC);
                ActionDoCommand(MoveTo2Q4PlotPoint(1));
                ActionDoCommand(SetLocalInt(OBJECT_SELF, "2Q4_Bela_Random", 0));
                return;
            }
            else
            {
                nState ++;
                if(nState == 5)
                {
                    SetLocalInt(OBJECT_SELF, "2Q4_Bela_Random", 0);
                }
                else
                {
                    SetLocalInt(OBJECT_SELF, "2Q4_Bela_Random", nState);
                }
            }
        }
    }
}
