// Change rebels reputation.

void main()
{
    object oPC = GetLastOpenedBy();
    if(oPC == OBJECT_INVALID)
        oPC = GetLastKiller();

    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_CALM_REBELS_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_CALM_REBELS_ONCE", 1);



    object oFerron = GetNearestObjectByTag("q4c_ferron");
    AdjustReputation(oFerron, oPC, 100);
    AdjustReputation(oPC, oFerron, 100);

}
