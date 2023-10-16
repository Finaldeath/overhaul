// Destroy the first sabal so the player won't encounter the two of them later on the ambush

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oSabal = GetNearestObjectByTag("q6_sabal1");
    if(oSabal != OBJECT_INVALID)
        DestroyObject(oSabal);

}
