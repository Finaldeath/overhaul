//  * every heartbeat see if
//  * there are any lizardmen to waken
#include "Nw_I0_Generic"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_DOONCE") == 0)
    {
        // * oLoci is just an object in the area to use in the next comparison
        object oLoci = OBJECT_SELF;
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC,oLoci) ;
        if (GetIsObjectValid(oPC) == FALSE)
        {
            return;
        }
        SetLocalInt(OBJECT_SELF, "NW_L_DOONCE", 10)   ;
        object oSleeper = GetNearestObjectByTag("M4Q1DSleeper",oPC);
            //* only choose Sleepers not those who have woken
            int nCount = 1;
            // * cycle through, looking for sleeping sleepers
            while ((GetPlotFlag(oSleeper) == FALSE) && (GetIsObjectValid(oSleeper) == TRUE))
            {
                nCount++;
                oSleeper = GetNearestObjectByTag("M4Q1DSleeper",oPC, nCount);
            }

            if (GetIsObjectValid(oSleeper) == TRUE)
             {

                if (GetPlotFlag(oSleeper) == TRUE)
                if (/*GetDistanceBetween(oPC, oSleeper) > 2.0 && */GetDistanceBetween(oPC, oSleeper) < 20.0)
                {
                   SetPlotFlag(oSleeper, FALSE);
                   ChangeToStandardFaction(oSleeper, STANDARD_FACTION_HOSTILE);
                   object oYellow = GetNearestObjectByTag("M4SleeperShell", oSleeper);
                   SetPlotFlag(oYellow, FALSE);
                   AssignCommand(oYellow, DestroyObject(oYellow));
                   AssignCommand(oSleeper, DetermineCombatRound());
                }
              }
          }
}
