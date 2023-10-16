// gishnak dialog abort: attack if there is no agreement

/*
values for Q3_GNOLL_STATUS:

GNOLL_STATUS_INIT =             initial status
GNOLL_STATUS_LEFT =             all gnoll left the area
GNOLL_STATUS_DEAD =             chief is dead
GNOLL_STATUS_SAFE_PASSAGE =     gnollsgave safe passge
GNOLL_STATUS_CONTROL_TRIBE =    player has full control over the tribe

values for Q3_GNOLL_HELP

GNOLL_NOHELP
GNOLL_HELP
*/

#include "nw_i0_generic"
#include "q3_inc_plot"

void main()
{
    object oChief = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
    if(nStatus == GNOLL_STATUS_INIT)
    {
        AssignCommand(oChief, ClearAllActions());
        AssignCommand(oChief, ActionSpeakStringByStrRef(40283));
        AdjustReputation(oPC, oChief, -50);
        AdjustReputation(oChief, oPC, -50);
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oChief, DetermineCombatRound(oPC));
        int n = 1;
        object oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
        while(oGnoll != OBJECT_INVALID)
        {
            n++;
            string sTag = GetTag(oGnoll);
            if(GetStringLeft(sTag, 8) == "Q3_GNOLL")
            {
                AssignCommand(oGnoll, DetermineCombatRound());
            }
            oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
        }
     }

}
