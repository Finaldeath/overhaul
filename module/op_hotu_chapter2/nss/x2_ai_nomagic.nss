// Custom AI for dead-magic beholder

#include "nw_i0_generic"

void main()
{
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");
    SetLocalInt(OBJECT_SELF,"X2_SPECIAL_COMBAT_AI_SCRIPT_OK", 1);

    if (GetIsObjectValid(oIntruder) == FALSE)
        oIntruder = bkAcquireTarget();

    ActionAttack(oIntruder);
}
