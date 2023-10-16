void main()
{

    object oCallik = GetNearestObjectByTag("m1Q04CCallik");
    SetLocalInt(oCallik,"NW_L_Banter",TRUE);
    SignalEvent(oCallik,EventUserDefined(450));
    SetLocalObject(oCallik,"NW_L_M1Q5DPlayer",GetEnteringObject());
    DestroyObject(OBJECT_SELF);
}
