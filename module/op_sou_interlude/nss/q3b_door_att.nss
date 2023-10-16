// call all neaby slaadi

#include "nw_i0_generic"

void main()
{
    //SpeakString("NW_ATTACK_MY_TARGET", TALKVOLUME_SILENT_SHOUT);
    //SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_SHOUT);

    int n = 1;
    object oPC;
    object oSlaad = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_OUTSIDER, OBJECT_SELF, n);
    while (oSlaad != OBJECT_INVALID)
    {
        float fDistance = GetDistanceBetween(OBJECT_SELF, oSlaad);
        if(fDistance > 50.0)
            return;
        if(GetTag(oSlaad) == "NW_SLAADRED")
        {
            if(!GetIsInCombat(oSlaad) && GetLocalInt(oSlaad, "CALLED") == 0)
            {
                SetLocalInt(oSlaad, "CALLED", 1);
                oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
                AssignCommand(oSlaad, ClearAllActions());
                AssignCommand(oSlaad, ActionMoveToObject(oPC, TRUE, 15.0));
                AssignCommand(oSlaad, ActionDoCommand(DetermineCombatRound(oPC)));
            }
        }
        n++;
        oSlaad = GetNearestCreature(CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_OUTSIDER, OBJECT_SELF, n);
    }
}
