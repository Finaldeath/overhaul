void main()
{
    int nNth = 1;
    object oNPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_NOT_PC,OBJECT_SELF,nNth);
    while(GetIsObjectValid(oNPC))
    {
        SignalEvent(oNPC,EventUserDefined(601));
        nNth++;
        oNPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR,PLAYER_CHAR_NOT_PC,OBJECT_SELF,nNth);
    }
    SignalEvent(OBJECT_SELF,EventUserDefined(601));
    SetLocalInt(GetModule(),"NW_G_M1Q6A01RitualInProgress",TRUE);
}
