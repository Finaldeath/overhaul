void main()
{
    SetLocalInt(GetObjectByTag("M0Q0_ARIBETH"),"NW_M0Q0_EnemiesDestroyed",0);
    SignalEvent(GetObjectByTag("M0Q1C_M0Q1B"),EventUserDefined(0));
}
