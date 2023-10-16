// teleport kelgaras for the second attack and escape.

#include "nw_i0_plot"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oKelGaras = GetObjectByTag("Q2_KELGARAS");
    SetLocalInt(oKelGaras, "SECOND_ATTACK", 1);
    SignalEvent(oKelGaras, EventUserDefined(102));
    DelayCommand(2.0, AssignCommand(oPC, PlaySound("c_mummygrt_bat2")));
}
