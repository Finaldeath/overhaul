// Guardian golem custom AI

#include "nw_i0_generic"
#include "NW_I0_SPELLS"



void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);
    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    if(GetLocalInt(OBJECT_SELF, "STOP_FIGHTING") == 1)
        return;
    int nRand = Random(2);
    if(nRand == 0)
        SpeakOneLinerConversation("q4b_guard");
    float fDistance = GetDistanceBetween(OBJECT_SELF, oIntruder);

    if(fDistance < 4.0)
    {
        int nClear = GetLocalInt(OBJECT_SELF, "CLEAR");
        if(nClear == 0) // nead to clear all actions, so the golem would stop shooting at close range
        {
            SetLocalInt(OBJECT_SELF, "CLEAR", 1);
            ClearAllActions();
        }
        ActionAttack(oIntruder);
        return;
    }
    else
    {
        SetLocalInt(OBJECT_SELF, "CLEAR", 0);
        ClearAllActions();
        ActionCastSpellAtObject(715, oIntruder, METAMAGIC_ANY, TRUE);
    }
}
