// Change rebels reputation.

void main()
{
    object oPC = GetLastOpenedBy();
    if(oPC == OBJECT_INVALID)
        oPC = GetLastKiller();

    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_CALM_AGHAAZ_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_CALM_AGHAAZ_ONCE", 1);

    object oAghaaz = GetNearestObjectByTag("q4c_aghaaz");
    AdjustReputation(oAghaaz, oPC, 100);
    AdjustReputation(oPC, oAghaaz, 100);

}
