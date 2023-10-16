// make the container shout for help when something is taken

/*
values for Q3_GNOLL_STATUS:

GNOLL_STATUS_INIT =             initial status
GNOLL_STATUS_LEFT =             all gnoll left the area
GNOLL_STATUS_DEAD =             chief is dead
GNOLL_STATUS_SAFE_PASSAGE =     gnollsgave safe passge
GNOLL_STATUS_CONTROL_TRIBE =     player has full control over the tribe

values for Q3_GNOLL_HELP

GNOLL_NOHELP
GNOLL_HELP
*/

//#include "nw_i0_generic"
#include "nw_o2_coninclude"
#include "q3_inc_plot"

void main()
{
        int nStatus = GetLocalInt(GetModule(), "Q3_GNOLL_STATUS");
        if(nStatus != GNOLL_STATUS_CONTROL_TRIBE)
        {
            ShoutDisturbed(); // shout only when not controlling the tribe
        }
        /*object oPC = GetLastDisturbed();
        AdjustReputation(oPC, OBJECT_SELF, -100);
        AdjustReputation(OBJECT_SELF, oPC, -100);
        //SpeakString("ATTACK! ATTACK!");
        int n = 1;
        object oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
        while(oGnoll != OBJECT_INVALID)
        {
            n++;
            string sTag = GetTag(oGnoll);
            if(GetStringLeft(sTag, 8) == "Q3_GNOLL")
                AssignCommand(oGnoll, DetermineCombatRound());
            oGnoll = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, OBJECT_SELF, n);
        } */

}
