//::///////////////////////////////////////////////
//:: Associate On Attacked
//:: on_atk_hench
//:://////////////////////////////////////////////
/*
    If already fighting then ignore, else determine
    combat round
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Hayward
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "X0_INC_HENAI"

void EquipBestWeapon(object oSelf, object oTarget);

void main()
{
    SpeakString("NW_I_WAS_ATTACKED", TALKVOLUME_SILENT_TALK);

    if(!GetAssociateState(NW_ASC_IS_BUSY))
    {
        SetCommandable(TRUE);
        EquipBestWeapon(OBJECT_SELF, GetLastAttacker());

        if(!GetAssociateState(NW_ASC_MODE_STAND_GROUND))
        {
            if(!GetIsObjectValid(GetAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
            {
                if(GetIsObjectValid(GetLastAttacker()))
                {
                    if(GetAssociateState(NW_ASC_MODE_DEFEND_MASTER))
                    {
                        object oTarget = GetLastAttacker(GetMaster());
                        HenchmenCombatRound(oTarget);
                    }
                    else
                    {
                        HenchmenCombatRound(OBJECT_INVALID);
                    }

                }
            }
            if(GetSpawnInCondition(NW_FLAG_ATTACK_EVENT))
            {
                SignalEvent(OBJECT_SELF, EventUserDefined(1005));
            }
        }
    }
}

void EquipBestWeapon(object oSelf, object oTarget)
{
    float fRange = GetDistanceBetween(oSelf, oTarget);

    if (fRange >= 10.f)
        AssignCommand(oSelf, ActionEquipMostDamagingRanged());
    else
        AssignCommand(oSelf, ActionEquipMostDamagingMelee());
}
