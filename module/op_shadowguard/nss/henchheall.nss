#include "nw_i0_generic"

void main()
{
    ResetHenchmenState();
    SetCommandable(TRUE, OBJECT_SELF);

    object oTarget = GetFactionMostDamagedMember(OBJECT_SELF);
    if(GetIsObjectValid(oTarget))
    {
        if(GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
        {
        }
        int nCurrent = GetCurrentHitPoints(oTarget);
        int nBase = GetMaxHitPoints(oTarget);

        if(nCurrent < nBase && !GetIsDead(oTarget))
        {
            talent tUse = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20);
            if(GetIsTalentValid(tUse))
            {
                ClearAllActions();
                ActionUseTalentOnObject(tUse, oTarget);
            }
            else
            {
            AssignCommand(OBJECT_SELF, ActionSpeakString("I'm out of healing spells.", TALKVOLUME_TALK));
            }
        }
    }
}
