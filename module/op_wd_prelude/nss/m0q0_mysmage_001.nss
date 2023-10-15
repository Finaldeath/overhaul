void main()
{
//* Summon Goblins
    SetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL",GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL") + 1);
    SignalEvent(OBJECT_SELF,EventUserDefined(1));
}
