void main()
{

    SetLocalInt(GetModule(),"NW_G_M0Q01PLOTDESTHER_GONE",TRUE);
    SignalEvent(GetObjectByTag("M1Q0EDesther"),EventUserDefined(0));

}
