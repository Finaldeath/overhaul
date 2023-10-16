// Armand's special trap: draw energy from victim and heal him

#include "NW_I0_SPELLS"

void main()
{
    object oStatue = GetNearestObjectByTag("q3c_trap_statue");
    int nDead = GetLocalInt(oStatue, "DEAD");
    if(nDead == 1)
    {
        oStatue = GetNearestObjectByTag("q3c_trap_statue", OBJECT_SELF, 2);
        nDead = GetLocalInt(oStatue, "DEAD");
        if(nDead == 1)
            return;
    }
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    SetLocalObject(GetArea(OBJECT_SELF), "TRAP_TARGET", oPC);
    SignalEvent(oStatue, EventUserDefined(101));

}
