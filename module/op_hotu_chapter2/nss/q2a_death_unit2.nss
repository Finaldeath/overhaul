//:: q2a_death_unit2
/*

// Default On Death for attackers
//if the leader dies - elect a new leader

 */
//:://////////////////////////////////////////////////
//::
//:: Created By: Keith Warner
//:: Created On: August 28/03
//:://////////////////////////////////////////////////
#include "q2_inc_battle"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
            return;


    SetLocalInt(OBJECT_SELF, "nDieOnce", 1);

    //count how many of this formation have died.
    //after 3 - if this formation is attacking the gates - send in a new formation
    int nFormation = GetLocalInt(OBJECT_SELF, "nFormation");
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    SetLocalInt(oBattleMaster, "nFormDeathCount" + IntToString(nFormation), GetLocalInt(oBattleMaster, "nFormDeathCount" + IntToString(nFormation)) + 1);
    //SendMessageToPC(GetFirstPC(), "Formation " + IntToString(nFormation) + " DEAD: " + IntToString(GetLocalInt(oBattleMaster, "nFormDeathCount" + IntToString(nFormation))));
    SetLocalInt(oBattleMaster, "Battle1TotalDead", GetLocalInt(oBattleMaster, "Battle1TotalDead") + 1);

    //SendMessageToPC(GetFirstPC(), "Total Dead : " + IntToString(GetLocalInt(oBattleMaster, "Battle1TotalDead")));
    if (GetLocalInt(oBattleMaster, "Battle1TotalDead") == 8)
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_RESPAWN_WAVE));
    else if (GetLocalInt(oBattleMaster, "Battle1TotalDead") == 18)
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_RESPAWN_WAVE));
    else if (GetLocalInt(oBattleMaster, "Battle1TotalDead") > 30)
    {
        //SendMessageToPC(GetFirstPC(), "PC VICTORY IN BATTLE 1 - Signal Retreat");
        SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_SIGNAL_RETREAT));
    }
    /*if(GetLocalInt(oBattleMaster, "nFormDeathCount" + IntToString(nFormation)) == 3)
    {
        object oGroupTarget = GetLocalObject(OBJECT_SELF, "oTarget");
        if (GetTag(oGroupTarget) == "q2acitygate" || GetTag(oGroupTarget) == "q2ainnergate")
        {
           SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_FIND_NEW_GATE_ATTACKER));
        }
    }
    */
    if (GetLocalInt(OBJECT_SELF, "nLeader") == 1)
    {

        //SendMessageToPC(GetFirstPC(), "Leader DEAD!!!!");
        int nFound = FALSE;

        int nCount;
        object oNewLeader = OBJECT_INVALID;
        object oProspect;
        string szResRef = GetResRef(OBJECT_SELF);
        for (nCount = 1; nCount < 6 && nFound == FALSE; nCount++)
        {
            oProspect = GetLocalObject(OBJECT_SELF, "oFormMember" + IntToString(nCount));
            if (oProspect != OBJECT_SELF)
            {
                if (GetIsObjectValid(oProspect) == TRUE)
                {
                    oNewLeader = oProspect;
                    nFound = TRUE;
                }
            }
        }
        if (nFound == TRUE)
        {
            SetLocalInt(oNewLeader, "nLeader", 1);

            //Store a new pointer on the battlemaster for the new leader of this formation
            SetLocalObject(oBattleMaster, "oFormationLeader" + IntToString(nFormation), oNewLeader);

            //SendMessageToPC(GetFirstPC(), "NewLeader FOUND");
            SignalEvent(oNewLeader, EventUserDefined(5000));
        }
        else
        {
            //Track the total number of formations killed for the retreat event
            SetLocalInt(oBattleMaster, "nFormDeathCountTotal", GetLocalInt(oBattleMaster, "nFormDeathCountTotal") + 1);

            //Track the fact that this formation has been totally wiped out.
            SetLocalInt(oBattleMaster, "nDeadFormation" + IntToString(nFormation), 1);
            //SendMessageToPC(GetFirstPC(), "NO New Leader");
            //SendMessageToPC(GetFirstPC(), "Dead Formation Count: " + IntToString(GetLocalInt(oBattleMaster, "nFormDeathCountTotal")));

            //If the number of formations killed is greater than the wave retreat number, signal a retreat.
            if(GetLocalInt(oBattleMaster, "nFormDeathCountTotal") > BATTLE1_RETREAT_NUMBER)
            {
                SignalEvent(oBattleMaster, EventUserDefined(BATTLEMASTER_SIGNAL_RETREAT));
            }
        }
    }
}


